# From github:vim-airline/vim-airline-themes/autoload/airline/themes/luna.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of Luna
# (https://github.com/Pychimp/vim-luna)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:luna/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=23  # fg=#ffffff,bg=#005252
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#002b2b
  ble-face -s vim_airline_a_insert                     fg=231,bg=106 # fg=#ffffff,bg=#789f00
  ble-face -s vim_airline_a_replace                    fg=231,bg=88  # fg=#ffffff,bg=#920000
  ble-face -s vim_airline_a_visual                     fg=228,bg=209 # fg=#ffff9a,bg=#ff8036
  ble-face -s vim_airline_b                            fg=231,bg=23  # fg=#ffffff,bg=#003f3f
  ble-face -s vim_airline_b_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#002b2b
  ble-face -s vim_airline_c                            fg=231,bg=234 # fg=#ffffff,bg=#002b2b
  ble-face -s vim_airline_c_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#002b2b
  ble-face -s vim_airline_c_inactive_modified          fg=160,bg=231 # fg=#e20000,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#ffffff,bg=#005e5e
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=52  # fg=#ffffff,bg=#450000
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#ffffff,bg=#005e5e
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=52  # fg=#ffffff,bg=#450000
  ble-face -s vim_airline_warning                      fg=231,bg=52  # fg=#ffffff,bg=#5f0000
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_z_replace                    fg=231,bg=106 # fg=#ffffff,bg=#789f00
}
