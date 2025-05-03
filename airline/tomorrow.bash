# From github:vim-airline/vim-airline-themes/autoload/airline/themes/tomorrow.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:tomorrow/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=21  # fg=#ffffff,bg=#0000ff
  ble-face -s vim_airline_a_inactive                   fg=21,bg=254  # fg=#0000ff,bg=#e5e5e5
  ble-face -s vim_airline_a_insert                     fg=231,bg=29  # fg=#ffffff,bg=#2e8b57
  ble-face -s vim_airline_a_replace                    fg=231,bg=196 # fg=#ffffff,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=231,bg=201 # fg=#ffffff,bg=#ff00ff
  ble-face -s vim_airline_b                            fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_b_inactive                   fg=21,bg=254  # fg=#0000ff,bg=#e5e5e5
  ble-face -s vim_airline_b_insert                     fg=29,bg=231  # fg=#2e8b57,bg=#ffffff
  ble-face -s vim_airline_b_replace                    fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_b_visual                     fg=201,bg=231 # fg=#ff00ff,bg=#ffffff
  ble-face -s vim_airline_c                            fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_c_inactive                   fg=21,bg=254  # fg=#0000ff,bg=#e5e5e5
  ble-face -s vim_airline_c_inactive_modified          fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_insert_modified            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_normal_modified            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_replace_modified           fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_visual_modified            fg=-1,bg=-1   # fg=-1,bg=-1
}
