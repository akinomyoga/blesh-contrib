# ble/contrib/fzf-key-bindings.bash (C) 2020, akinomyoga

[[ $- == *i* ]] || return 0

function ble/contrib/fzf-key-bindings/initialize {
  if [[ ! $_ble_contrib_fzf_base ]]; then
    local path
    if ! ble/util/assign path 'type -p fzf 2>/dev/null'; then
      echo 'ble/contrib/fzf-key-bindings: "fzf" not found.'
      return 1
    fi
    _ble_contrib_fzf_base=${path%/*}
    _ble_contrib_fzf_base=${_ble_contrib_fzf_base%/bin}
  fi
  [[ -d $_ble_contrib_fzf_base ]]
}
ble/contrib/fzf-key-bindings/initialize || return 1

ble/function#push bind :
source "$_ble_contrib_fzf_base/shell/key-bindings.bash"
ble/function#pop bind

# CTRL-T - Paste the selected file path into the command line
ble-bind -m emacs   -x C-t fzf-file-widget
ble-bind -m vi_imap -x C-t fzf-file-widget
ble-bind -m vi_nmap -s C-t 'i\C-t'

# CTRL-R - Paste the selected command from history into the command line
ble-bind -m emacs   -x C-r fzf-history-widget
ble-bind -m vi_imap -x C-r fzf-history-widget
ble-bind -m vi_nmap -s C-r 'i\C-r'
function fzf-history-widget {
  READLINE_LINE=$(history -p "$(__fzf_history__)")
  READLINE_POINT=${#READLINE_LINE}
}

# ALT-C - cd into the selected directory
ble-bind -m emacs   -c M-c 'eval "$(__fzf_cd__)"'
ble-bind -m vi_imap -c M-c 'eval "$(__fzf_cd__)"'
ble-bind -m vi_nmap -c M-c 'eval "$(__fzf_cd__)"'
