# From github:vim-airline/vim-airline-themes/autoload/airline/themes/biogoo.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Name:        biogoo (vim-airline version)
# Author:      Benjamin Esham (https://esham.io)
# Last Change: 2017-10-20
#
# You can find more information on the Biogoo theme at <https://github.com/bdesham/biogoo>.

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:biogoo/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=24  # fg=#ffffff,bg=#295498
  ble-face -s vim_airline_a_inactive                   fg=242,bg=231 # fg=#676767,bg=#ffffff
  ble-face -s vim_airline_a_insert                     fg=231,bg=34  # fg=#ffffff,bg=#00a000
  ble-face -s vim_airline_a_replace                    fg=231,bg=160 # fg=#ffffff,bg=#d11518
  ble-face -s vim_airline_a_visual                     fg=231,bg=166 # fg=#ffffff,bg=#cc6600
  ble-face -s vim_airline_b                            fg=24,bg=254  # fg=#295498,bg=#e5e5e5
  ble-face -s vim_airline_b_inactive                   fg=242,bg=231 # fg=#676767,bg=#ffffff
  ble-face -s vim_airline_c                            fg=24,bg=231  # fg=#295498,bg=#ffffff
  ble-face -s vim_airline_c_inactive                   fg=242,bg=231 # fg=#676767,bg=#ffffff
  ble-face -s vim_airline_c_inactive_modified          fg=34,bg=231  # fg=#00a000,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=34,bg=231  # fg=#00a000,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=34,bg=231  # fg=#00a000,bg=#ffffff
  ble-face -s vim_airline_c_replace_modified           fg=34,bg=231  # fg=#00a000,bg=#ffffff
  ble-face -s vim_airline_c_visual_modified            fg=34,bg=231  # fg=#00a000,bg=#ffffff
  ble-face -s vim_airline_term                         fg=231,bg=242 # fg=#ffffff,bg=#676767
}
