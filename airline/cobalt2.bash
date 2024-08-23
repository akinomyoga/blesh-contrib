# From github:vim-airline/vim-airline-themes/autoload/airline/themes/cobalt2.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:cobalt2/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=32  # fg=#ffffff,bg=#1f7ad8
  ble-face -s vim_airline_a_inactive                   fg=239,bg=23  # fg=#4e4e4e,bg=#204458
  ble-face -s vim_airline_a_insert                     fg=241,bg=221 # fg=#666d51,bg=#fee533
  ble-face -s vim_airline_a_replace                    fg=231,bg=174 # fg=#ffffff,bg=#ea9299
  ble-face -s vim_airline_a_visual                     fg=228,bg=214 # fg=#ffff9a,bg=#ff9d00
  ble-face -s vim_airline_b                            fg=231,bg=111 # fg=#ffffff,bg=#8cc2fd
  ble-face -s vim_airline_b_inactive                   fg=239,bg=23  # fg=#4e4e4e,bg=#204458
  ble-face -s vim_airline_c                            fg=231,bg=23  # fg=#ffffff,bg=#204458
  ble-face -s vim_airline_c_inactive                   fg=239,bg=23  # fg=#4e4e4e,bg=#204458
  ble-face -s vim_airline_c_inactive_modified          fg=125,bg=231 # fg=#b42839,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=241,bg=221 # fg=#666d51,bg=#fee533
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=32  # fg=#ffffff,bg=#1f7ad8
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=174 # fg=#ffffff,bg=#ea9299
  ble-face -s vim_airline_c_visual_modified            fg=228,bg=214 # fg=#ffff9a,bg=#ff9d00
  ble-face -s vim_airline_warning                      fg=23,bg=231  # fg=#204458,bg=#ffffff
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
