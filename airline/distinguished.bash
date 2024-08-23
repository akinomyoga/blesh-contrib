# From github:vim-airline/vim-airline-themes/autoload/airline/themes/distinguished.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of distinguished
# (https://github.com/Lokaltog/vim-distinguished)
# I have nothing to do with the original
# distinguished theme other than being a big fan.
# this theme was shamelessly created by modifying
# the Ubaryd airline theme.

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:distinguished/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=16,bg=245  # fg=#000000,bg=#8a8a8a
  ble-face -s vim_airline_a_inactive                   fg=238,bg=234 # fg=#444444,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=16,bg=143  # fg=#000000,bg=#afaf5f
  ble-face -s vim_airline_a_normal_modified            fg=231,bg=166 # fg=#ffffff,bg=#d75f00
  ble-face -s vim_airline_a_replace                    fg=16,bg=67   # fg=#000000,bg=#5f87af
  ble-face -s vim_airline_a_visual                     fg=16,bg=131  # fg=#000000,bg=#af5f5f
  ble-face -s vim_airline_b                            fg=250,bg=238 # fg=#bcbcbc,bg=#444444
  ble-face -s vim_airline_b_inactive                   fg=238,bg=234 # fg=#444444,bg=#1c1c1c
  ble-face -s vim_airline_c                            fg=245,bg=234 # fg=#8a8a8a,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive                   fg=238,bg=234 # fg=#444444,bg=#1c1c1c
  ble-face -s vim_airline_c_insert                     fg=143,bg=234 # fg=#afaf5f,bg=#1c1c1c
  ble-face -s vim_airline_c_normal_modified            fg=166,bg=231 # fg=#d75f00,bg=#ffffff
  ble-face -s vim_airline_c_replace                    fg=67,bg=234  # fg=#5f87af,bg=#1c1c1c
  ble-face -s vim_airline_c_visual                     fg=131,bg=234 # fg=#af5f5f,bg=#1c1c1c
  ble-face -s vim_airline_x_normal_modified            fg=166,bg=231 # fg=#d75f00,bg=#ffffff
  ble-face -s vim_airline_z_normal_modified            fg=231,bg=166 # fg=#ffffff,bg=#d75f00
}
