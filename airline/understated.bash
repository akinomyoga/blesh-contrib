# From github:vim-airline/vim-airline-themes/autoload/airline/themes/understated.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:understated/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=69  # fg=#ffffff,bg=#5f87ff
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=231,bg=107 # fg=#ffffff,bg=#87af5f
  ble-face -s vim_airline_a_replace                    fg=231,bg=88  # fg=#ffffff,bg=#870000
  ble-face -s vim_airline_a_visual                     fg=231,bg=130 # fg=#ffffff,bg=#af5f00
  ble-face -s vim_airline_b                            fg=144,bg=62  # fg=#afaf87,bg=#5f5f5f
  ble-face -s vim_airline_b_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c                            fg=144,bg=62  # fg=#afaf87,bg=#5f5f5f
  ble-face -s vim_airline_c_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive_modified          fg=239,bg=231 # fg=#4e4e4e,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_visual_modified            fg=144,bg=53  # fg=#afaf87,bg=#5f005f
  ble-face -s vim_airline_z_replace                    fg=231,bg=107 # fg=#ffffff,bg=#87af5f
}
