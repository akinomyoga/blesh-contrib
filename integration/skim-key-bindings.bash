# ble/contrib/integration/skim-key-bindings.bash (C) 2024, akinomyoga

[[ $- == *i* ]] || return 0

if ! ble/is-function __skim_history__; then
  ble-import contrib/integration/skim-initialize || return 1
  ble/function#push bind :
  if [[ -f $_ble_contrib_skim_base/key-bindings.bash ]]; then
    source "$_ble_contrib_skim_base/key-bindings.bash"
  elif [[ -f $_ble_contrib_skim_base/shell/key-bindings.bash ]]; then
    source "$_ble_contrib_skim_base/shell/key-bindings.bash"
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
