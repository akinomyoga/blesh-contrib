# blesh/contrib/config/github296-named-execmark.bash (C) 2023, Koichi Murase <myoga.murase@gmail.com>

function ble/contrib/config:github296/named-execmark.hook {
  local lastexit=$? command=$1

  if ((lastexit)) && ! ble/string#match "$command" $'^[[:blank:]]*#[^\n]+$'; then
    local sgr=$'\e[;94m' sgr0=$'\e[m' sgrE=$'\e[;91m' ret
    ble/color/face2sgr-ansi varname_number; local sgrN=$ret

    local exit=$lastexit name=
    if ((exit>=128)) && [[ ${name:=${_ble_builtin_trap_sig_name[exit&127]}} ]]; then
      exit=$'\e[1m'"$name"$'\e[22m'" ($sgrN$exit$sgrE)"
    else
      exit="exit $sgrN$exit$sgrE"
    fi
    local mark=$sgrE'[ble: '$exit']'$sgr0
    ble/util/buffer.print "$mark"
  fi
}
bleopt exec_errexit_mark=
blehook POSTEXEC!=ble/contrib/config:github296/named-execmark.hook
