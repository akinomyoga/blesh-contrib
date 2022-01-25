# ble/contrib/bash-preexec.bash (C) 2022, akinomyoga

## @arr[in] precmd_functions
## @arr[in] preexec_functions
##   The functions registered to these arrays are executed on PRECMD and
##   PREEXEC hooks, respectively.
##
## @fn[in] precmd
## @fn[in] preexec
##   If these functions are defined, they are executed on PRECMD and PREEXEC
##   hooks, respectively, through "precmd_functions" and "preexec_functions".
##
##
## * Integration with bash-preexec.sh (https://github.com/rcaloras/bash-preexec)
##
##   Although this script works without bash-preexec, it provides a better
##   integration with bash-preexec when bash-preexec is loaded.  The
##   integration relies on the following public API of bash-preexec.
##
##   @fn __bp_precmd_invoke_functions lastexit lastarg
##   @fn __bp_preexec_invoke_functions lastexit lastarg this_command
##   @fn __bp_uninstall
##   @var __bp_trapdebug_string
##   @var __bp_install_string

function ble/contrib/bash-preexec/add-convenience-functions {
  ble/array#remove precmd_functions  precmd
  ble/array#remove preexec_functions preexec
  ble/array#unshift precmd_functions  precmd
  ble/array#unshift preexec_functions preexec
}

function ble/contrib/bash-preexec/precmd.hook {
  local __lastexit=$? __lastarg=$_

  # Emulate bash-preexec variables
  __bp_last_ret_value=$__lastexit
  BP_PIPESTATUS=("${BLE_PIPESTATUS[@]}")

  # local __bp_blesh_invoking_through_blesh=1 # XXX
  if ble/is-function __bp_precmd_invoke_functions; then
    __bp_precmd_invoke_functions "$__lastexit" "$__lastarg"
  else
    # For older bash-preexec.sh / without bash-preexec.sh
    local __hook
    for __hook in "${precmd_functions[@]}"; do
      if builtin type -t "$__hook" &>/dev/null; then
        ble/util/setexit "$__lastexit" "$__lastarg"
        "$__hook"
      fi
    done
  fi
}

function ble/contrib/bash-preexec/preexec.hook {
  local __lastexit=$? __lastarg=$_ __this_command=$1
  __bp_last_argument_prev_command=$__lastarg

  # local __bp_blesh_invoking_through_blesh=1 # XXX
  if ble/is-function __bp_preexec_invoke_functions; then
    __bp_preexec_invoke_functions "$__lastexit" "$__lastarg"
  else
    # For older bash-preexec.sh / without bash-preexec.sh
    local __hook
    for __hook in "${preexec_functions[@]}"; do
      if builtin type -t "$__hook" &>/dev/null; then
        ble/util/setexit "$__lastexit" "$__lastarg"
        "$__hook" "$__this_command"
      fi
    done
  fi
}

## @fn ble/contrib/bash-preexec/attach.hook
##   Remove bash-preexec hooks
function ble/contrib/bash-preexec/attach.hook {
  local BP_TRAPDEBUG_STRING=${__bp_trapdebug_string:-'__bp_preexec_invoke_exec "$_"'}

  # Remove bash-preexec preexec hook in builtin DEBUG trap.
  local trap_string q="'" Q="'\''"
  ble/util/assign trap_string 'builtin trap -p DEBUG'
  if [[ $trap_string == "trap -- '${BP_TRAPDEBUG_STRING//$q/$Q}' DEBUG" ]]; then
    if [[ ${__bp_trap_string-} ]]; then
      builtin eval -- "builtin $__bp_trap_string"
    else
      builtin trap - DEBUG
    fi
  fi

  if ble/is-function __bp_uninstall; then
    __bp_uninstall
  else
    # For older bash-preexec.sh

    local BP_INSTALL_STRING=${__bp_install_string:-$'__bp_trap_string="$(trap -p DEBUG)"\ntrap - DEBUG\n__bp_install'}
    local BP_PROMPT_COMMAND_PREFIX=__bp_precmd_invoke_cmd
    local BP_PROMPT_COMMAND_SUFFIX=__bp_interactive_mode

    # Remove __bp_install hook from PROMPT_COMMAND
    if [[ ${PROMPT_COMMAND-} == *"$__bp_install_string"* ]]; then
      PROMPT_COMMAND="${PROMPT_COMMAND//$BP_INSTALL_STRING[;$'\n']}" # Edge case of appending to PROMPT_COMMAND
      PROMPT_COMMAND="${PROMPT_COMMAND//$BP_INSTALL_STRING}"
    fi

    # Remove precmd hook from PROMPT_COMMAND
    PROMPT_COMMAND=${PROMPT_COMMAND/#$BP_PROMPT_COMMAND_PREFIX$'\n'/$'\n'}
    PROMPT_COMMAND=${PROMPT_COMMAND%$'\n'$BP_PROMPT_COMMAND_SUFFIX}
    PROMPT_COMMAND=${PROMPT_COMMAND#$'\n'}

    # Remove preexec hook in the DEBUG trap
    local q="'" Q="'\''" trap_string
    ble/util/assign trap_string 'trap -p DEBUG'
    if [[ $trap_string == "trap -- '${__bp_trapdebug_string//$q/$Q}' DEBUG" ]]; then
      if [[ ${__bp_trap_string-} ]]; then
        eval -- "$__bp_trap_string"
      else
        trap - DEBUG
      fi
    fi
  fi
}

## @fn ble/contrib/bash-preexec/detach.hook
function ble/contrib/bash-preexec/detach.hook {
  # Reinstall bash-preexec hooks
  local BP_INSTALL_STRING=${__bp_install_string-}
  [[ ! $BP_INSTALL_STRING ]] && ble/is-function __bp_install &&
    BP_INSTALL_STRING=$'__bp_trap_string="$(trap -p DEBUG)"\ntrap - DEBUG\n__bp_install'

  builtin eval -- "$__bp_install_string"

  # Note: 重複して登録される (古い bash-preexec.sh) かもしれないし、全
  # く登録されない (bash-preexec.sh をロードしていない時) かもしれない
  # ので、ble.sh 側で末尾で一回呼び出す形に修正する。
  ble/contrib/bash-preexec/add-convenience-functions
}

ble/contrib/bash-preexec/add-convenience-functions
blehook PRECMD-+=ble/contrib/bash-preexec/precmd.hook
blehook PREEXEC-+=ble/contrib/bash-preexec/preexec.hook
blehook ATTACH-+=ble/contrib/bash-preexec/attach.hook
blehook DETACH-+=ble/contrib/bash-preexec/detach.hook
if [[ ${bp_imported-${__bp_imported-}} ]]; then
  ble/contrib/bash-preexec/attach.hook
fi

# XXX: 以下は uninstall で削除しきれなかった時の為の保険。今の所不要に思われる。
# __bp_blesh_check() {
#   if [[ $BLE_ATTACHED && ! ${__bp_blesh_invoking_through_blesh-} ]]; then
#     ble/contrib/bash-preexec/attach.hook
#   fi
# }
# precmd_function+=(__bp_blesh_check)
# preexec_function+=(__bp_blesh_check)
