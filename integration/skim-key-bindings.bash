# ble/contrib/integration/skim-key-bindings.bash (C) 2024, akinomyoga

[[ $- == *i* ]] || return 0

if ! ble/is-function __skim_history__; then
  ble-import contrib/integration/skim-initialize || return 1
  ble/function#push bind :
  if [[ -f $_ble_contrib_skim_base/key-bindings.bash ]]; then
    source -- "$_ble_contrib_skim_base/key-bindings.bash"
  elif [[ -f $_ble_contrib_skim_base/shell/key-bindings.bash ]]; then
    source -- "$_ble_contrib_skim_base/shell/key-bindings.bash"
  fi
  ble/function#pop bind
fi

# CTRL-T - Paste the selected file path into the command line
ble-bind -m emacs   -x C-t skim-file-widget
ble-bind -m vi_imap -x C-t skim-file-widget
ble-bind -m vi_nmap -s C-t 'i\C-t'

# CTRL-R - Paste the selected command from history into the command line
ble-bind -m emacs   -x C-r skim-history-widget
ble-bind -m vi_imap -x C-r skim-history-widget
ble-bind -m vi_nmap -s C-r 'i\C-r'
function skim-history-widget { __skim_history__; }

# ALT-C - cd into the selected directory
ble-bind -m emacs   -c M-c 'ble/util/eval-stdout "__skim_cd__"'
ble-bind -m vi_imap -c M-c 'ble/util/eval-stdout "__skim_cd__"'
ble-bind -m vi_nmap -c M-c 'ble/util/eval-stdout "__skim_cd__"'

# Note: completion integration has been moved from "skim/shell/completion.bash"
# to "skim/shell/key-bindings.bash".  When the argument completion for "sk" is
# implemented using Clap in Ref. [1], somehow the completion integration (which
# is unrelated to the argument completion for "sk") was completely removed.
# Later, this was pointed out in Ref. [2], and the completion integration code
# was restored in "key-bindings.bash" instead of "completion.bash".
#
# [1] https://github.com/skim-rs/skim/pull/586
# [2] https://github.com/skim-rs/skim/issues/726
# [3] https://github.com/skim-rs/skim/commit/f87ff6740b20794eaf6288b901f85b7737a28bcf
if ble/is-function _skim_handle_dynamic_completion; then
  # patch skim completion functions
  ble-import contrib/integration/fzf.common
  ble/function#advice -f around __skim_generic_path_completion  'ble/contrib/integration:fzf/complete.advice'
  ble/function#advice -f around _skim_complete                  'ble/contrib/integration:fzf/complete.advice keep-stdin'
  ble/function#advice -f around _skim_complete_kill             'ble/contrib/integration:fzf/complete.advice'
  ble/function#advice -f around _skim_handle_dynamic_completion 'ble/contrib/integration:fzf/handle_dynamic_completion.advice'
  _ble_contrib_fzf_adjust_dynamic_completion=1
fi
