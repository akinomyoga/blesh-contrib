# ble/contrib/prompt-vim-mode.bash (C) 2020, akinomyoga

# \q{contrib/vim-mode} (Prompt escape sequence)
#
# Example:
#
#   ble-import contrib/prompt-vim-mode
#   PS1='[\u@\h \W]\q{contrib/vim-mode}\$ '
#   bleopt keymap_vi_mode_show:=
#

function ble/prompt/backslash:contrib/vim-mode {
  bleopt keymap_vi_mode_update_prompt:=1
  case $_ble_decode_keymap in
  (vi_[on]map) ble/prompt/print '(cmd)' ;;
  (vi_imap|auto_complete) ble/prompt/print '(ins)' ;;
  (vi_smap) ble/prompt/print '(sel)' ;;
  (vi_xmap) ble/prompt/print '(vis)' ;;
  esac
}
