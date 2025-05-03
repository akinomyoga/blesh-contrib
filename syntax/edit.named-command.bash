# blesh/contrib/syntax/edit.named-command.bash
# (C) 2024, Koichi Murase <myoga.murase@gmail.com>

ble-import core-syntax

#------------------------------------------------------------------------------
# syntax

function ble/syntax:edit.named-command/initialize-ctx {
  ctx=$_ble_ctx_EDIT_NamedCommand
}
function ble/syntax:edit.named-command/initialize-vars { return 0; }

_ble_syntax_context_proc[_ble_ctx_EDIT_NamedCommand]=ble/syntax:edit.named-command/ctx-rlfunc

function ble/syntax:edit.named-command/ctx-rlfunc {
  if ble/string#match "$tail" $'^[[:blank:]]+'; then
    ((_ble_syntax_attr[i]=_ble_ctx_UNSPECIFIED,i+=${#BASH_REMATCH}))
    return 0
  elif ble/string#match "$tail" $'^[^[:blank:]]+'; then
    local name=$BASH_REMATCH

    # determine the color
    local ret
    ble/builtin/bind/rlfunc2widget/type "$name"
    case $ret in
    (rlfunc) _ble_syntax_attr[i]=$_ble_attr_KEYWORD ;;
    (widget) _ble_syntax_attr[i]=$_ble_attr_CMD_FUNCTION ;;
    (*)      _ble_syntax_attr[i]=$_ble_attr_FILE_WARN ;;
    esac

    # register a word
    ble/syntax/parse/word-push "$ctx" "$i"
    ((i+=${#name}))
    ble/syntax/parse/word-pop
    ((ctx=_ble_ctx_UNSPECIFIED))
    return 0
  else
    ((ctx=_ble_ctx_UNSPECIFIED))
    ble/syntax:text/ctx-unspecified
  fi
}

#------------------------------------------------------------------------------
# completion

function ble/complete/action:edit.named-command/initialize { return 0; }
function ble/complete/action:edit.named-command/initialize.batch { inserts=("${cands[@]}"); }
function ble/complete/action:edit.named-command/complete { ble/complete/action/complete.addtail ' '; }
function ble/complete/action:edit.named-command/get-desc {
  case $DATA in
  (rlfunc) desc='(readline bindable function)' ;;
  (widget) desc='(ble.sh widget)' ;;
  (*) desc='(unknown)' ;;
  esac
  desc=$desc_sgrt$desc$desc_sgr0
}
function ble/complete/action:edit.named-command/init-menu-item {
  local ret
  case $DATA in
  (rlfunc) ble/color/face2g command_keyword; g=$ret ;;
  (widget) ble/color/face2g command_function; g=$ret ;;
  (*) ble/color/face2g argument_error; g=$ret ;;
  esac
}

function ble/complete/source:edit.named-command {
  # ToDo: これで良いのか? 外側も書き換えないと挿入時や menu-filter で問題になるのでは
  local COMPS=$COMPS COMPV=$COMPS comps_flags= comps_fixed=
  ble/complete/source/reduce-compv-for-ambiguous-match

  "${_ble_util_set_declare[@]//NAME/mark}" # disable=#D1570

  local dict entry
  if ble/builtin/bind/rlfunc2widget/load-dict; then
    for entry in "${dict[@]}"; do
      ((cand_iloop++%bleopt_complete_polling_cycle==0)) && ble/complete/check-cancel && return 148
      local rl= widget=
      ble/bash/read rl widget <<< "$entry"
      if [[ $rl == "$COMPS"* && $widget != - ]]; then
        ble/set#add mark "$rl"
        ble/complete/cand/yield edit.named-command "$rl" rlfunc
      fi
    done
  fi

  local widgets widget
  ble/util/assign-array widgets 'compgen -A function -X "ble/widget/*.*" -- "ble/widget/$COMPS"'
  for widget in "${widgets[@]}"; do
    ((cand_iloop++%bleopt_complete_polling_cycle==0)) && ble/complete/check-cancel && return 148
    widget=${widget#ble/widget/}
    ble/set#contains mark "$widget" ||
      ble/complete/cand/yield edit.named-command "$widget" widget
  done

  return 0
}

_ble_syntax_completion_context_check_prefix[_ble_ctx_EDIT_NamedCommand]=edit.named-command/rlfunc
function ble/syntax/completion-context/prefix:edit.named-command/rlfunc {
  local word=${text:istat:index-istat}
  ble/string#match "$word" $'^[[:blank:]]*'
  ble/syntax/completion-context/add edit.named-command "$((istat+${#BASH_REMATCH}))"
}

_ble_syntax_completion_context_check_here[_ble_ctx_EDIT_NamedCommand]='add edit.named-command'
