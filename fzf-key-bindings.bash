# ble/contrib/fzf-key-bindings.bash (C) 2020, akinomyoga

[[ $- == *i* ]] || return 0

function ble/contrib/fzf-key-bindings/initialize {
  [[ $_ble_contrib_fzf_base ]] && return 0
  
  local ret
  if ! ble/util/assign ret 'type -p fzf 2>/dev/null'; then
    echo 'ble/contrib/fzf: "fzf" not found.'
    return 1
  fi
  ble/util/readlink "$ret"
  ret=${ret%/*}
  ret=${ret%/bin}
  if [[ -d $ret/shell ]]; then
    _ble_contrib_fzf_base=$ret
  else
    echo 'ble/contrib/fzf: failed to find "fzf" base directory' >&2
    return 1
  fi
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
