# ble/contrib/integration/fzf-completion.bash (C) 2020-2023, akinomyoga

ble-import contrib/integration/fzf-initialize

[[ $- == *i* ]] || return 0

# fzf/shell/completion.bash を未ロードの時のみロードする
if ! ble/is-function _fzf_complete; then
  if [[ -f $_ble_contrib_fzf_base/completion.bash ]]; then
    source "$_ble_contrib_fzf_base/completion.bash"
  elif [[ -f $_ble_contrib_fzf_base/shell/completion.bash ]]; then
    source "$_ble_contrib_fzf_base/shell/completion.bash"
  elif [[ $_ble_contrib_fzf_base == */share/fzf && -f /etc/bash_completion.d/fzf ]]; then
    source /etc/bash_completion.d/fzf
  fi
fi

# clear blesh completer for cd
blehook/eval-after-load complete 'builtin unset -f ble/cmdinfo/complete:cd'

# patch fzf functions
ble/function#advice around __fzf_generic_path_completion _fzf_complete.advice
ble/function#advice around _fzf_complete                 _fzf_complete.advice
ble/function#advice around _fzf_complete_kill            _fzf_complete.advice
function _fzf_complete.advice {
  if [[ ! ${_ble_attached-} ]]; then
    ble/function#push caller 'builtin caller ${1+"$(($1+6))"}'
    ble/function#advice/do
    ble/function#pop caller
    return 0
  fi

  [[ :$comp_type: == *:auto:* || :$comp_type: == *:[maA]:* ]] && return 0
  compopt -o ble/syntax-raw
  if [[ ! ${_ble_contrib_fzf_comp_words_raw-} ]]; then
    local _ble_contrib_fzf_comp_words_raw=1
    local COMP_WORDS; COMP_WORDS=("${comp_words[@]}")
    local COMP_CWORD=$comp_cword
    local COMP_LINE=$comp_line COMP_POINT=$comp_point
  fi
  ble/function#push printf '[[ $1 == "\e[5n" ]] || builtin printf "$@"'
  ble/function#push caller 'builtin caller ${1+"$(($1+6))"}'
  ble/term/leave-for-widget
  if [[ ${ADVICE_WORDS[0]} == _fzf_complete ]]; then
    ble/function#advice/do >&"${_ble_util_fd_tty_stdout:-1}" 2>&"${_ble_util_fd_tty_stderr:-2}"
  else
    ble/function#advice/do >&"${_ble_util_fd_tty_stdout:-1}" 2>&"${_ble_util_fd_tty_stderr:-2}" <&"${_ble_util_fd_tty_stdin:-0}"
  fi
  ble/term/enter-for-widget
  ble/function#pop caller
  ble/function#pop printf
  ble/textarea#invalidate

  # 単一候補生成の場合は他の候補 (sabbrev 等) を消去して単一確定させる
  if ((ADVICE_EXIT==0&&${#COMPREPLY[@]}==1)); then
    compopt -o ble/no-default
    ble/complete/candidates/clear
    [[ $old_cand_count ]] &&
      ! ble/variable#is-global old_cand_count &&
      old_cand_count=0
  fi
}

#------------------------------------------------------------------------------
# Extensions

# This widget can be used to trigger fzf's '**' completion from a keybinding.
function ble/widget/fzf-complete {
  local handler=_fzf_${1:-path}_completion
  if ! ble/is-function "$handler"; then
    ble/widget/.bell "unrecognized fzf-complete type '$1' (function '$handler' not found)"
    return 1
  fi

  ((_ble_edit_ind==0)) && return 0

  # If the width of the box-drawing characters in the current terminal is not
  # 1, we specify --no-unicode to fzf to suppress the use of the box-drawing
  # characters.
  if [[ " ${FZF_COMPLETION_OPTS-} " != *' --no-unicode '* ]]; then
    local ret
    ble/util/c2w 0x2500
    ((ret==1)) ||
      local FZF_COMPLETION_OPTS="--no-unicode${FZF_COMPLETION_OPTS:+ $FZF_COMPLETION_OPTS}"
  fi

  # Mask completion settings cached by fzf
  local -a fzf_orig_completions
  fzf_orig_completions=("${!_fzf_orig_completion_@}")
  local "${fzf_orig_completions[@]/%/=}" # disable=#D1570

  # Replace the programmable-completion setting
  local completion_save
  ble/util/assign completion_save 'complete -p'
  complete -r
  if ((_ble_bash>=40100)); then
    complete -F "$handler" -D
    complete -F "$handler" -E
  else
    complete -F "$handler" _DefaultCmD_
    complete -F "$handler" _EmptycmD_
  fi
  if ((_ble_bash>=50000)); then
    complete -F "$handler" -I
  else
    complete -F "$handler" _InitialWorD_
  fi

  # Disable completion auto-loader
  ble/function#push _comp_load 'return 1'

  # Trigger fzf-completion without '**'
  local FZF_COMPLETION_TRIGGER=

  ble/widget/complete; local ext=$?

  # restore the settings
  ble/function#pop _comp_load
  complete -r
  builtin eval -- "$completion_save"
  return "$ext"
}
