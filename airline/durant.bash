# From github:vim-airline/vim-airline-themes/autoload/airline/themes/durant.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:durant/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=148  # fg=#005f00,bg=#afd700
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=231,bg=29  # fg=#ffffff,bg=#00875f
  ble-face -s vim_airline_a_replace                    fg=247,bg=124 # fg=#9e9e9e,bg=#af0000
  ble-face -s vim_airline_a_visual                     fg=234,bg=231 # fg=#1a1a18,bg=#ffffff
  ble-face -s vim_airline_b                            fg=109,bg=60  # fg=#93a1a1,bg=#586e75
  ble-face -s vim_airline_b_inactive                   fg=239,bg=235 # fg=#4e4e4e,bg=#262626
  ble-face -s vim_airline_b_insert                     fg=247,bg=236 # fg=#9e9e9e,bg=#303030
  ble-face -s vim_airline_b_visual                     fg=231,bg=238 # fg=#ffffff,bg=#44403a
  ble-face -s vim_airline_c                            fg=109,bg=23  # fg=#93a1a1,bg=#073642
  ble-face -s vim_airline_c_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c_inactive_modified          fg=97,bg=231  # fg=#875faf,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=117,bg=24  # fg=#87d7ff,bg=#005f87
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_visual                     fg=108,bg=236 # fg=#90a680,bg=#2e2d2a
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_z_replace                    fg=231,bg=29  # fg=#ffffff,bg=#00875f
}
