# blesh/contrib/config/github481-elapsed-mark-without-command.bash (C) 2024, Koichi Murase <myoga.murase@gmail.com>

bleopt/declare -v github481_elapsed_mark $'\e[94m[ble: elapsed %s (CPU %s%%)]\e[m'

function ble/contrib/config:github481/elapsed-mark-without-command.hook {
  ble/exec/time#mark-enabled || return 0

  local ret
  ble/edit/marker#get-config github481_elapsed_mark || return 0
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

  local mark
  ble/util/sprintf mark "$format" "$ata" "$cpu"
  ble/edit/marker#instantiate "$mark" bare &&
    ble/util/buffer.print "$mark"
}

bleopt exec_elapsed_mark=
blehook POSTEXEC!=ble/contrib/config:github481/elapsed-mark-without-command.hook
