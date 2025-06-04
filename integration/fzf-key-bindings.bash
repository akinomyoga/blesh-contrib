# ble/contrib/integration/fzf-key-bindings.bash (C) 2020-2024, akinomyoga

[[ $- == *i* ]] || return 0

if ! ble/is-function __fzf_history__; then
  ble-import contrib/integration/fzf-initialize || return 1
  ble/function#push bind :
  if [[ -f $_ble_contrib_fzf_base/key-bindings.bash ]]; then
    source -- "$_ble_contrib_fzf_base/key-bindings.bash"
  elif [[ -f $_ble_contrib_fzf_base/shell/key-bindings.bash ]]; then
    source -- "$_ble_contrib_fzf_base/shell/key-bindings.bash"
  elif [[ $_ble_contrib_fzf_base == __eval_fzf_bash__ ]]; then
    ble/util/eval-stdout '"$_ble_contrib_fzf_path" --bash | sed -n "/### key-bindings/,/### end/p"'
  fi
  ble/function#pop bind
fi

function ble/contrib/integration:fzf-key-bindings/is-fzf-above-7c447bbd {
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
  ble/util/assign READLINE_LINE '__fzf_history__'
  ble/util/assign READLINE_LINE 'history -p "$READLINE_LINE"'
  READLINE_POINT=${#READLINE_LINE}
}
((_ble_bash>=40000)) &&
  ble/contrib/integration:fzf-key-bindings/is-fzf-above-7c447bbd &&
  function fzf-history-widget { __fzf_history__; }

# ALT-C - cd into the selected directory
ble-bind -m emacs   -c M-c 'ble/util/eval-stdout "__fzf_cd__"'
ble-bind -m vi_imap -c M-c 'ble/util/eval-stdout "__fzf_cd__"'
ble-bind -m vi_nmap -c M-c 'ble/util/eval-stdout "__fzf_cd__"'
