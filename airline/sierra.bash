# From github:vim-airline/vim-airline-themes/autoload/airline/themes/sierra.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# File: sierra.vim
# Author: Danilo Augusto <daniloaugusto.ita16@gmail.com>
# Date: 2017-02-26
# License:  MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:sierra/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=180 # fg=#ffffff,bg=#dfaf87
  ble-face -s vim_airline_a_inactive                   fg=241,bg=131 # fg=#666666,bg=#af5f5f
  ble-face -s vim_airline_a_insert                     fg=231,bg=152 # fg=#ffffff,bg=#afd7d7
  ble-face -s vim_airline_a_replace                    fg=242,bg=236 # fg=#686868,bg=#303030
  ble-face -s vim_airline_a_visual                     fg=231,bg=242 # fg=#ffffff,bg=#686868
  ble-face -s vim_airline_b                            fg=231,bg=131 # fg=#ffffff,bg=#af5f5f
  ble-face -s vim_airline_b_inactive                   fg=167,bg=235 # fg=#d75f5f,bg=#2a2a2a
  ble-face -s vim_airline_c                            fg=167,bg=240 # fg=#d75f5f,bg=#545454
  ble-face -s vim_airline_c_inactive                   fg=167,bg=235 # fg=#d75f5f,bg=#2a2a2a
  ble-face -s vim_airline_c_inactive_modified          fg=223,bg=16  # fg=#f7e4c0,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=231,bg=131 # fg=#ffffff,bg=#af5f5f
  ble-face -s vim_airline_c_insert_modified            fg=223,bg=16  # fg=#f7e4c0,bg=#000000
  ble-face -s vim_airline_c_normal_modified            fg=223,bg=16  # fg=#f7e4c0,bg=#000000
  ble-face -s vim_airline_c_replace_modified           fg=223,bg=16  # fg=#f7e4c0,bg=#000000
  ble-face -s vim_airline_c_visual                     fg=231,bg=131 # fg=#ffffff,bg=#af5f5f
  ble-face -s vim_airline_c_visual_modified            fg=223,bg=16  # fg=#f7e4c0,bg=#000000
}
