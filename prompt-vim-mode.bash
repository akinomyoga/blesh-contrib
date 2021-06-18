# ble/contrib/prompt-vim-mode.bash (C) 2020-2021, akinomyoga

# \q{contrib/vim-mode} (Prompt escape sequence)
#
# Example:
#
#   ble-import contrib/prompt-vim-mode
#   PS1='[\u@\h \W]\q{contrib/vim-mode}\$ '
#   bleopt keymap_vi_mode_show:=
#

function ble/prompt/backslash:contrib/vim-mode {
  local mode; ble/keymap:vi/script/get-mode
  case $mode in
  ([iR]*) ble/prompt/print '(ins)' ;;
  (*n)      ble/prompt/print '(cmd)' ;;
  (*x)      ble/prompt/print '(vis)' ;;
  (*s)      ble/prompt/print '(sel)' ;;
  esac
}
