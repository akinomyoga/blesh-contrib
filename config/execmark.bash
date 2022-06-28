# blesh/contrib/config/execmark.bash (C) 2022, Koichi Murase <myoga.murase@gmail.com>
#
# Example setup
#
# ```bash
# # blerc
# ble-import -d contrib/config/execmark
# bleopt exec_elapsed_enabled='_ble_exec_time_tot>=1000'
# ```
#

function ble/contrib/config:execmark/.getsec {
  local msec=$1 sec
  if ((msec==0)); then
    ret=0
  elif ((msec<1000)); then
    ret=${msec}ms
  else
    ((sec=msec/1000,msec%=1000))
    msec=000$msec msec=${msec:${#msec}-3}
    ret=$sec.$msec
  fi
}

function ble/contrib/config:execmark/postexec.hook {
  local command=$_ble_edit_exec_BASH_COMMAND

  if ((_ble_edit_exec_lastexit)) || ble/exec/time#mark-enabled; then
    local ret
    local sgr=$'\e[;94m' sgrC=$'\e[38:5:244m' sgr0=$'\e[m'
    ble/color/face2sgr-ansi syntax_varname; local sgrV=$ret
    ble/color/face2sgr-ansi command_function; local sgrS=$ret
    ble/color/face2sgr-ansi varname_number; local sgrN=$ret

    # exit
    if ((_ble_edit_exec_lastexit)); then
      local sgrE=$'\e[;91m'
      local exit=$_ble_edit_exec_lastexit name=
      if ((exit>=128)) && [[ ${name:=${_ble_builtin_trap_signames[exit&127]}} ]]; then
        exit=$'\e[1m'"$name"$'\e[22m'" ($sgrN$exit$sgrE)"
      else
        exit="exit $sgrN$exit$sgrE"
      fi
      local mark=$sgrE'[ble: '$exit']'$sgr0
      ble/util/buffer.print "$mark"
    fi

    # ata
    local ata=$_ble_exec_time_ata
    local d=${#ata} sec min hour
    if ((d<=3)); then
      ata=${ata}us
    elif ((d<=5)); then
      ata=${ata::d-3}.${ata:d-3:6-d}ms
    elif ((d<=6)); then
      ata=${ata::3}ms
    elif ((d<=9)); then
      ata=${ata::${#ata}-6}.${ata:${#ata}-6:3}s
    elif ((sec=ata/(1000*1000),min=sec/60,sec%=60,min<100)); then
      ata="${min}m${sec}s"
    elif ((hour=min/60,min%=60,hour<100)); then
      ata="${hour}h${min}m${sec}s"
    else
      ata="$((hour/24))d$((hour%24))h${min}m"
    fi
    ata="${sgrV}elapsed$sgr $sgrN$ata$sgr"

    # cpu
    local cpu='--.-%'
    if ((_ble_exec_time_tot)); then
      cpu=$(((_ble_exec_time_usr+_ble_exec_time_sys)*1000/_ble_exec_time_tot))
      cpu=$((cpu/10)).$((cpu%10))%
    fi
    cpu="${sgrV}CPU$sgr $sgrN$cpu$sgr"
    if [[ $_ble_exec_time_usr_self && $_ble_exec_time_sys_self ]]; then
      local usr0=$_ble_exec_time_usr_self
      local sys0=$_ble_exec_time_sys_self
      local usr1=$((_ble_exec_time_usr-_ble_exec_time_usr_self))
      local sys1=$((_ble_exec_time_sys-_ble_exec_time_sys_self))

      local ret max=0
      ble/contrib/config:execmark/.getsec "$usr0"; local usr0s=$ret
      ble/contrib/config:execmark/.getsec "$sys0"; local sys0s=$ret
      ((usr0>max)) && max=$usr0
      ((sys0>max)) && max=$sys0
      if ((usr1||sys1)); then
        ble/contrib/config:execmark/.getsec "$usr1"; local usr1s=$ret
        ble/contrib/config:execmark/.getsec "$sys1"; local sys1s=$ret
        ((usr1>max)) && max=$usr1
        ((sys1>max)) && max=$sys1
      fi

      ((usr0==max)) && usr0s=$'\e[1m'$usr0s$'\e[22m'
      ((sys0==max)) && sys0s=$'\e[1m'$sys0s$'\e[22m'
      cpu="$cpu $sgrS(self)${sgrV}usr$sgrN$usr0s$sgr/${sgrV}sys$sgrN$sys0s$sgr"
      if ((usr1||sys1)); then
        ((usr1==max)) && usr1s=$'\e[1m'$usr1s$'\e[22m'
        ((sys1==max)) && sys1s=$'\e[1m'$sys1s$'\e[22m'
        cpu="$cpu+$sgrS(child)${sgrV}usr$sgrN${usr1s}$sgr/${sgrV}sys$sgrN${sys1s}$sgr"
      fi
    else
      local ret
      ble/contrib/config:execmark/.getsec "$_ble_exec_time_usr"; local usr=$ret
      ble/contrib/config:execmark/.getsec "$_ble_exec_time_sys"; local sys=$ret
      cpu="$cpu ${usr}usr/${sys}sys"
    fi

    local msg=$sgr'[ble: '$ata', '$cpu']'$sgr0
    local ret; ble/string#ltrim "$command"; msg="$msg${ret:+ $sgrC$ret$sgr0}"
    x=0 y=0 g=0 LINES=1 ble/canvas/trace "$msg" confine:truncate
    ble/util/buffer.print "$ret"
  fi
}
bleopt exec_@_mark=
blehook POSTEXEC-+=ble/contrib/config:execmark/postexec.hook
