# blesh/contrib/prompt-elapsed.bash (C) 2022, Koichi Murase <myoga.murase@gmail.com>

function ble/contrib/prompt-elapsed/output-sec.ps {
  local sec=$1 min
  ((min=sec/60,sec%=60))
  if ((min<100)); then
    ble/prompt/print "${min}m${sec}s"
    return 0
  fi

  local hour; ((hour=min/60,min%=60))
  if ((hour<100)); then
    ble/prompt/print "${hour}h${min}m${sec}s"
    return 0
  fi

  local day; ((day=hour/24,hour%=24))
  if ((day<365)); then
    ble/prompt/print "${day}d${hour}h${min}m"
    return 0
  fi

  local year; ((year=day/365,day%=365))
  ble/prompt/print "${year}y${day}d${hour}h"
  return 0
}

function ble/contrib/prompt-elapsed/output-time-format.ps {
  local msec=$1
  local d=${#msec}
  if ((d<=3)); then
    ble/prompt/print "${msec}msec"
    return 0
  elif ((d<=5)); then
    ble/prompt/print "${msec::d-3}.${msec:d-36-d}sec"
    return 0
  fi

  local sec=$((msec/1000)) min
  ((msec%=1000,min=sec/60,sec%=60))
  msec=000${msec}; msec=${msec:${#msec}-3}
  if ((min<100)); then
    ble/prompt/print "${min}m${sec}.${msec}s"
    return 0
  fi

  ble/contrib/prompt-elapsed/output-sec.ps "$((min*60+sec))"
}

function ble/prompt/backslash:contrib/elapsed {
  [[ $_ble_exec_time_ata ]] || return 1

  local ata=$_ble_exec_time_ata
  local d=${#ata}
  if ((d<=3)); then
    ble/prompt/print "${ata}usec"
    return 0
  elif ((d<=6)); then
    if ((d<=5)); then
      ble/prompt/print "${ata::d-3}.${ata:d-3:6-d}msec"
    else
      ble/prompt/print "${ata::3}msec"
    fi
    return 0
  elif ((d<=8)); then
    ble/prompt/print "${ata::d-6}.${ata:d-6:3}sec"
    return 0
  fi

  ble/contrib/prompt-elapsed/output-sec.ps "$((ata/1000000))"
}

function ble/prompt/backslash:contrib/elapsed-real {
  [[ $_ble_exec_time_ata ]] || return 1
  ble/contrib/prompt-elapsed/output-time-format.ps "$_ble_exec_time_tot"
}
function ble/prompt/backslash:contrib/elapsed-user {
  [[ $_ble_exec_time_ata ]] || return 1
  ble/contrib/prompt-elapsed/output-time-format.ps "$_ble_exec_time_usr"
}
function ble/prompt/backslash:contrib/elapsed-sys {
  [[ $_ble_exec_time_ata ]] || return 1
  ble/contrib/prompt-elapsed/output-time-format.ps "$_ble_exec_time_sys"
}
function ble/prompt/backslash:contrib/elapsed-cpu {
  ((_ble_exec_time_tot)) || return 1

  local pk=$(((_ble_exec_time_usr+_ble_exec_time_sys)*1000/_ble_exec_time_tot))
  ble/prompt/print "$((pk/10)).$((pk%10))%"
  return 0
}
