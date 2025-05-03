# From github:vim-airline/vim-airline-themes/autoload/airline/themes/transparent.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
#FROM https://github.com/khatiba

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:transparent/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=103,bg=16  # fg=#8d96a1,bg=#000000
  ble-face -s vim_airline_a_inactive                   fg=234,bg=231 # fg=#1d1f21,bg=#ffffff
  ble-face -s vim_airline_a_insert                     fg=234,bg=150 # fg=#1d1f21,bg=#bbe67e
  ble-face -s vim_airline_a_normal_modified            fg=234,bg=215 # fg=#1d1f21,bg=#ffae57
  ble-face -s vim_airline_a_replace                    fg=234,bg=183 # fg=#1d1f21,bg=#d4bfff
  ble-face -s vim_airline_a_visual                     fg=234,bg=204 # fg=#1d1f21,bg=#f07178
  ble-face -s vim_airline_b                            fg=239,bg=231 # fg=#3f4b59,bg=#ffffff
  ble-face -s vim_airline_b_inactive                   fg=234,bg=231 # fg=#1d1f21,bg=#ffffff
  ble-face -s vim_airline_c                            fg=239,bg=231 # fg=#3f4b59,bg=#ffffff
  ble-face -s vim_airline_c_inactive_modified          fg=215,bg=16  # fg=#ffae57,bg=#000000
  ble-face -s vim_airline_error                        fg=234,bg=204 # fg=#1d1f21,bg=#f07178
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=234,bg=215 # fg=#1d1f21,bg=#ffae57
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_x_inactive                   fg=234,bg=231 # fg=#1d1f21,bg=#ffffff
  ble-face -s vim_airline_z_insert                     fg=150,bg=16  # fg=#bbe67e,bg=#000000
  ble-face -s vim_airline_z_normal                     fg=239,bg=231 # fg=#3f4b59,bg=#ffffff
  ble-face -s vim_airline_z_normal_modified            fg=215,bg=16  # fg=#ffae57,bg=#000000
  ble-face -s vim_airline_z_replace                    fg=183,bg=16  # fg=#d4bfff,bg=#000000
  ble-face -s vim_airline_z_visual                     fg=204,bg=16  # fg=#f07178,bg=#000000
}
