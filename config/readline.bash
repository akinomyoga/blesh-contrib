# blesh/contrib/config/readline.bash (C) 2025, Koichi Murase <myoga.murase@gmail.com>
#
# Example setup
#
# ```bash
# # blerc
# ble-import -d config/readline
# ```

# Disable syntax highlighting
bleopt highlight_syntax=

# Disable highlighting based on filenames
bleopt highlight_filename=

# Disable highlighting based on variable types
bleopt highlight_variable=

# Disable auto-complete (Note: auto-complete is enabled by default in bash-4.0+)
bleopt complete_auto_complete=

# Disable auto-complete based on the command history
bleopt complete_auto_history=

# Disable ambiguous completion
bleopt complete_ambiguous=

# Disable menu-complete by TAB
bleopt complete_menu_complete=

# Disable menu filtering (Note: auto-complete is enabled by default in bash-4.0+)
bleopt complete_menu_filter=

# Disable EOF marker like "[ble: EOF]"
bleopt prompt_eol_mark=''

# Disable error exit marker like "[ble: exit %d]"
bleopt exec_errexit_mark=

# Disable elapsed-time marker like "[ble: elapsed 1.203s (CPU 0.4%)]"
bleopt exec_elapsed_mark=

# Disable exit marker like "[ble: exit]"
bleopt exec_exit_mark=

# Disable some other markers like "[ble: ...]"
bleopt edit_marker=
bleopt edit_marker_error=

# Turn off Readline settings enabled by ble.sh
builtin bind 'set skip-completed-text       off'
builtin bind 'set colored-stats             off'
builtin bind 'set colored-completion-prefix off'

# Use audible bell instead of visible bell for editing error
bleopt edit_bell=abell
bleopt decode_error_@_vbell=
bleopt decode_error_@_abell=1

function ble/contrib/config:readline/emacs-load-hook {
  # Disable magic expansions
  ble-bind -m emacs -f 'SP' self-insert
  ble-bind -m emacs -f '/'  self-insert

  # Disable multiline mode
  ble-bind -m emacs -f 'C-m' 'accept-line syntax'
  ble-bind -m emacs -f 'RET' 'accept-line syntax'
  ble-bind -m emacs -f 'C-j' 'accept-line syntax'

  # Immediately run commands with RET in isearch
  ble-bind -m isearch -f 'C-m' isearch/accept-line
  ble-bind -m isearch -f 'RET' isearch/accept-line

  # Emulate Readline for non-incremental searches
  ble-bind -m emacs -f 'prior'    'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x up'   'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x C-p'  'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'next'     'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x down' 'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x C-n'  'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x ,'    'history-nsearch-backward-again    hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x .'    'history-nsearch-forward-again     hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x <'    'history-nsearch-backward          hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x >'    'history-nsearch-forward           hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x n'    'history-substring-search-forward  hide-status:point=end:immediate-accept'
  ble-bind -m emacs -f 'C-x p'    'history-substring-search-backward hide-status:point=end:immediate-accept'
}
blehook/eval-after-load keymap_emacs ble/contrib/config:readline/emacs-load-hook

function ble/contrib/config:readline/vim-load-hook {
  # Disable magic expansions
  ble-bind -m vi_imap -f 'SP' self-insert
  ble-bind -m vi_imap -f '/'  self-insert

  # Disable multiline mode
  ble-bind -m vi_imap -f 'C-m' 'accept-line syntax'
  ble-bind -m vi_imap -f 'RET' 'accept-line syntax'
  ble-bind -m vi_imap -f 'C-j' 'accept-line syntax'
  ble-bind -m vi_nmap -f 'C-m' 'accept-line syntax'
  ble-bind -m vi_nmap -f 'RET' 'accept-line syntax'
  ble-bind -m vi_nmap -f 'C-j' 'accept-line syntax'

  # Discard lines with C-c
  ble-bind -m vi_imap -f 'C-c' discard-line
  ble-bind -m vi_nmap -f 'C-c' discard-line

  # Use incremental search also in vi_nmap
  ble-bind -m vi_nmap -f 'C-r' history-isearch-backward

  # Immediately run commands with RET in isearch
  ble-bind -m isearch -f 'C-m' isearch/accept-line
  ble-bind -m isearch -f 'RET' isearch/accept-line

  # Emulate Readline for non-incremental searches
  ble-bind -m vi_imap -f 'prior'    'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x up'   'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x C-p'  'history-search-backward           hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'next'     'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x down' 'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x C-n'  'history-search-forward            hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x ,'    'history-nsearch-backward-again    hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x .'    'history-nsearch-forward-again     hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x <'    'history-nsearch-backward          hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x >'    'history-nsearch-forward           hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x n'    'history-substring-search-forward  hide-status:point=end:immediate-accept'
  ble-bind -m vi_imap -f 'C-x p'    'history-substring-search-backward hide-status:point=end:immediate-accept'
}
blehook/eval-after-load keymap_vi ble/contrib/config:readline/vim-load-hook
