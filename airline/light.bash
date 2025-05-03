# From github:vim-airline/vim-airline-themes/autoload/airline/themes/light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=27  # fg=#ffffff,bg=#005fff
  ble-face -s vim_airline_a_inactive                   fg=241,bg=249 # fg=#666666,bg=#b2b2b2
  ble-face -s vim_airline_a_insert                     fg=231,bg=29  # fg=#ffffff,bg=#00875f
  ble-face -s vim_airline_a_replace                    fg=22,bg=196  # fg=#005f00,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=231,bg=202 # fg=#ffffff,bg=#ff5f00
  ble-face -s vim_airline_b                            fg=18,bg=45   # fg=#000087,bg=#00dfff
  ble-face -s vim_airline_b_inactive                   fg=245,bg=252 # fg=#8a8a8a,bg=#d0d0d0
  ble-face -s vim_airline_b_insert                     fg=22,bg=42   # fg=#005f00,bg=#00df87
  ble-face -s vim_airline_b_visual                     fg=52,bg=214  # fg=#5f0000,bg=#ffaf00
  ble-face -s vim_airline_c                            fg=27,bg=159  # fg=#005fff,bg=#afffff
  ble-face -s vim_airline_c_inactive                   fg=248,bg=231 # fg=#a8a8a8,bg=#ffffff
  ble-face -s vim_airline_c_inactive_modified          fg=160,bg=231 # fg=#df0000,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=23,bg=156  # fg=#005f5f,bg=#afff87
  ble-face -s vim_airline_c_insert_modified            fg=160,bg=224 # fg=#df0000,bg=#ffdfdf
  ble-face -s vim_airline_c_normal_modified            fg=160,bg=224 # fg=#df0000,bg=#ffdfdf
  ble-face -s vim_airline_c_replace_modified           fg=160,bg=224 # fg=#df0000,bg=#ffdfdf
  ble-face -s vim_airline_c_visual                     fg=166,bg=228 # fg=#df5f00,bg=#ffff87
  ble-face -s vim_airline_c_visual_modified            fg=160,bg=224 # fg=#df0000,bg=#ffdfdf
  ble-face -s vim_airline_term                         fg=27,bg=159  # fg=#005fff,bg=#afffff
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_term_insert                  fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_term_normal_modified         fg=160,bg=224 # fg=#df0000,bg=#ffdfdf
  ble-face -s vim_airline_term_visual                  fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_z_replace                    fg=231,bg=29  # fg=#ffffff,bg=#00875f
}
