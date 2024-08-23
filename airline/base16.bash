# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=196,bg=231 # fg=#ff0000,bg=#ffffff
  ble-face -s vim_airline_a_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_replace                    fg=196,bg=196 # fg=#ff0000,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=196,bg=201 # fg=#ff0000,bg=#ff00ff
  ble-face -s vim_airline_b                            fg=16,bg=252  # fg=#000000,bg=#d3d3d3
  ble-face -s vim_airline_b_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c                            fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_c_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_insert_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_replace_modified           fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_visual_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_error                        fg=196,bg=231 # fg=#ff0000,bg=#ffffff
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=231,bg=196 # fg=#ffffff,bg=#ff0000
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
