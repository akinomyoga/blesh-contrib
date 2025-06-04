# ble/contrib/integration/fzf-completion.bash (C) 2020-2024, akinomyoga

[[ $- == *i* ]] || return 0

# fzf/shell/completion.bash を未ロードの時のみロードする
if ! ble/is-function _fzf_complete; then
  ble-import contrib/integration/fzf-initialize || return 1
  if [[ -f $_ble_contrib_fzf_base/completion.bash ]]; then
    source -- "$_ble_contrib_fzf_base/completion.bash"
  elif [[ -f $_ble_contrib_fzf_base/shell/completion.bash ]]; then
    source -- "$_ble_contrib_fzf_base/shell/completion.bash"
  elif [[ $_ble_contrib_fzf_base == */share/fzf && -f /etc/bash_completion.d/fzf ]]; then
    source /etc/bash_completion.d/fzf
  elif [[ $_ble_contrib_fzf_base == __eval_fzf_bash__ ]]; then
    ble/util/eval-stdout '"$_ble_contrib_fzf_path" --bash | sed -n "/### completion/,/### end/p"'
  fi
fi

# clear blesh completer for cd
blehook/eval-after-load complete 'builtin unset -f ble/cmdinfo/complete:cd'

# patch fzf functions
ble-import contrib/integration/fzf.common
ble/function#advice -f around __fzf_generic_path_completion  'ble/contrib/integration:fzf/complete.advice'
ble/function#advice -f around _fzf_complete                  'ble/contrib/integration:fzf/complete.advice keep-stdin'
ble/function#advice -f around _fzf_complete_kill             'ble/contrib/integration:fzf/complete.advice'
ble/function#advice -f around _fzf_handle_dynamic_completion 'ble/contrib/integration:fzf/handle_dynamic_completion.advice'

if ble/is-function __fzf_orig_completion_get_orig_func; then
  ## @fn ble/contrib/integration:fzf/orig_completion_get_orig_func.advice
  ##   @var[ref] comp_opts
  function ble/contrib/integration:fzf/orig_completion_get_orig_func.advice {
    if ((ADVICE_EXIT==0)); then
      local comp_func=$REPLY comp_prog=
      ble/complete/progcomp/adjust-third-party-completions
    fi
  }
  ble/function#advice after __fzf_orig_completion_get_orig_func 'ble/contrib/integration:fzf/orig_completion_get_orig_func.advice'
elif ble/is-function _fzf_handle_dynamic_completion; then
  _ble_contrib_fzf_adjust_dynamic_completion=1
fi

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
