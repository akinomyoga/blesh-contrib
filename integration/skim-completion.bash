# ble/contrib/integration/skim-completion.bash (C) 2024, akinomyoga

[[ $- == *i* ]] || return 0

# skim/shell/completion.bash を未ロードの時のみロードする
if ! ble/is-function _skim_complete; then
  ble-import contrib/integration/skim-initialize || return 1
  if [[ -f $_ble_contrib_skim_base/completion.bash ]]; then
    source -- "$_ble_contrib_skim_base/completion.bash"
  elif [[ -f $_ble_contrib_skim_base/shell/completion.bash ]]; then
    source -- "$_ble_contrib_skim_base/shell/completion.bash"
  elif [[ $_ble_contrib_skim_base == */share/skim && -f /etc/bash_completion.d/skim ]]; then
    source /etc/bash_completion.d/skim
  fi
fi

# clear blesh completer for cd
blehook/eval-after-load complete 'builtin unset -f ble/cmdinfo/complete:cd'

# Note: completion integration has been moved from "skim/shell/completion.bash"
# to "skim/shell/key-bindings.bash".  See "skim-key-bindings.bash" for details.
if ble/is-function _skim_handle_dynamic_completion; then
  ble-import contrib/integration/fzf.common
  ble/function#advice -f around __skim_generic_path_completion  'ble/contrib/integration:fzf/complete.advice'
  ble/function#advice -f around _skim_complete                  'ble/contrib/integration:fzf/complete.advice keep-stdin'
  ble/function#advice -f around _skim_complete_kill             'ble/contrib/integration:fzf/complete.advice'
  ble/function#advice -f around _skim_handle_dynamic_completion 'ble/contrib/integration:fzf/handle_dynamic_completion.advice'
  _ble_contrib_fzf_adjust_dynamic_completion=1
fi
