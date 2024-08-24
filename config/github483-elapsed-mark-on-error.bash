# blesh/contrib/config/github483-elapsed-mark-on-error.bash (C) 2024, Koichi Murase <myoga.murase@gmail.com>

bleopt/declare -v github483_elapsed_mark $'\e[94m[ble: elapsed %s (CPU %s%%)]\e[m'

function ble/contrib/config:github483/elapsed-mark-on-error.hook {
  ((_ble_edit_exec_lastexit)) || ble/exec/time#mark-enabled || return 0

  local ret
  ble/edit/marker#get-config github483_elapsed_mark || return 0
  local format=$ret

  # ata
  local ret
  ble/exec/time#format-elapsed-time; local ata=$ret

  # cpu
  local cpu='--.-'
  if ((_ble_exec_time_tot)); then
    cpu=$(((_ble_exec_time_usr+_ble_exec_time_sys)*1000/_ble_exec_time_tot))
    cpu=$((cpu/10)).$((cpu%10))
  fi

  local mark ret
  ble/util/sprintf mark "$format" "$ata" "$cpu"
  ble/string#ltrim "$_ble_edit_exec_BASH_COMMAND"
  ble/edit/marker#instantiate "$mark $ret" bare &&
    ble/util/buffer.print "$ret"
}

bleopt exec_elapsed_mark=
blehook POSTEXEC!=ble/contrib/config:github483/elapsed-mark-on-error.hook
