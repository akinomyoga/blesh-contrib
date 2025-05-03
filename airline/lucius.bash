# From github:vim-airline/vim-airline-themes/autoload/airline/themes/lucius.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:lucius/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_insert                     fg=16,bg=152  # fg=#000000,bg=#add8e6
  ble-face -s vim_airline_a_replace                    fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_b                            fg=18,bg=252  # fg=#00008b,bg=#d3d3d3
  ble-face -s vim_airline_b_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c                            fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_c_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_inactive_modified          fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_replace_modified           fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_c_visual_modified            fg=124,bg=231 # fg=#a52a2a,bg=#ffffff
  ble-face -s vim_airline_error                        fg=21,bg=195  # fg=#0000ff,bg=#e0ffff
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
