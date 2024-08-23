# From github:vim-airline/vim-airline-themes/autoload/airline/themes/qwq.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# github: https://github.com/LuciusChen

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:qwq/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=230  # fg=#0e3b4f,bg=#ffeee5
  ble-face -s vim_airline_a_inactive                   fg=23,bg=231  # fg=#0e3b4f,bg=#fefcf9
  ble-face -s vim_airline_a_insert                     fg=23,bg=230  # fg=#0e3b4f,bg=#fff5d9
  ble-face -s vim_airline_a_replace                    fg=23,bg=158  # fg=#0e3b4f,bg=#c1f9cd
  ble-face -s vim_airline_b                            fg=23,bg=224  # fg=#0e3b4f,bg=#ffd3cb
  ble-face -s vim_airline_b_inactive                   fg=23,bg=187  # fg=#0e3b4f,bg=#ddc6af
  ble-face -s vim_airline_b_insert                     fg=23,bg=186  # fg=#0e3b4f,bg=#dde58e
  ble-face -s vim_airline_b_replace                    fg=23,bg=122  # fg=#0e3b4f,bg=#8befc7
  ble-face -s vim_airline_b_visual                     fg=23,bg=217  # fg=#0e3b4f,bg=#ff9da5
  ble-face -s vim_airline_c                            fg=231,bg=209 # fg=#ffffff,bg=#f7846e
  ble-face -s vim_airline_c_inactive                   fg=231,bg=138 # fg=#ffffff,bg=#a28e79
  ble-face -s vim_airline_c_inactive_modified          fg=231,bg=16  # fg=#ffffff,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=231,bg=150 # fg=#ffffff,bg=#9ed47b
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=71  # fg=#ffffff,bg=#6bad3f
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=203 # fg=#ffffff,bg=#ff5d4f
  ble-face -s vim_airline_c_replace                    fg=231,bg=38  # fg=#ffffff,bg=#04bec3
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=30  # fg=#ffffff,bg=#008492
  ble-face -s vim_airline_c_visual                     fg=231,bg=203 # fg=#ffffff,bg=#ff5b6f
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=197 # fg=#ffffff,bg=#ff003f
}
