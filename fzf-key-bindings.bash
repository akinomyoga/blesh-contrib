# ble/contrib/fzf-key-bindings.bash (C) 2020, akinomyoga

ble-import contrib/fzf-initialize

[[ $- == *i* ]] || return 0

ble/function#push bind :
source "$_ble_contrib_fzf_base/shell/key-bindings.bash"
ble/function#pop bind

function ble/contrib/fzf-key-bindings/is-fzf-above-7c447bbd {
  local def; ble/function#getdef __fzf_history__ 
  [[ $def == *READLINE_LINE=* ]]
}

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
((_ble_bash>=40000)) &&
  ble/contrib/fzf-key-bindings/is-fzf-above-7c447bbd &&
  function fzf-history-widget { __fzf_history__; }

# ALT-C - cd into the selected directory
ble-bind -m emacs   -c M-c 'eval "$(__fzf_cd__)"'
ble-bind -m vi_imap -c M-c 'eval "$(__fzf_cd__)"'
ble-bind -m vi_nmap -c M-c 'eval "$(__fzf_cd__)"'

# patch fzf functions
ble/function#advice around fzf-file-widget ble/contrib/fzf-key-bindings.advice
ble/function#advice around __fzf_history__ ble/contrib/fzf-key-bindings.advice
ble/function#advice around __fzf_cd__      ble/contrib/fzf-key-bindings.advice
function ble/contrib/fzf-key-bindings.advice {
  if [[ ! $_ble_attached ]]; then
    ble/function#advice/do
    return
  fi
  ble/term/leave-for-widget
  ble/function#advice/do
  ble/term/enter-for-widget
}
