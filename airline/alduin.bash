# From github:vim-airline/vim-airline-themes/autoload/airline/themes/alduin.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Author:   Danilo Augusto
# Script:   Alduin (vim-airline version)
# License:  MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:alduin/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=222,bg=60  # fg=#ffdf87,bg=#5f5f87
  ble-face -s vim_airline_a_inactive                   fg=241,bg=138 # fg=#666666,bg=#af8787
  ble-face -s vim_airline_a_insert                     fg=231,bg=105 # fg=#ffffff,bg=#878787
  ble-face -s vim_airline_a_replace                    fg=101,bg=234 # fg=#87875f,bg=#1c1c1c
  ble-face -s vim_airline_a_visual                     fg=231,bg=101 # fg=#ffffff,bg=#87875f
  ble-face -s vim_airline_b                            fg=231,bg=138 # fg=#ffffff,bg=#af8787
  ble-face -s vim_airline_b_inactive                   fg=180,bg=235 # fg=#dfaf87,bg=#2a2a2a
  ble-face -s vim_airline_c                            fg=180,bg=240 # fg=#dfaf87,bg=#545454
  ble-face -s vim_airline_c_inactive                   fg=180,bg=235 # fg=#dfaf87,bg=#2a2a2a
  ble-face -s vim_airline_c_inactive_modified          fg=222,bg=16  # fg=#ffdf87,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=231,bg=138 # fg=#ffffff,bg=#af8787
  ble-face -s vim_airline_c_insert_modified            fg=222,bg=16  # fg=#ffdf87,bg=#000000
  ble-face -s vim_airline_c_normal_modified            fg=222,bg=16  # fg=#ffdf87,bg=#000000
  ble-face -s vim_airline_c_replace_modified           fg=222,bg=16  # fg=#ffdf87,bg=#000000
  ble-face -s vim_airline_c_visual                     fg=231,bg=138 # fg=#ffffff,bg=#af8787
  ble-face -s vim_airline_c_visual_modified            fg=222,bg=16  # fg=#ffdf87,bg=#000000
}
