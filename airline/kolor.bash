# From github:vim-airline/vim-airline-themes/autoload/airline/themes/kolor.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:kolor/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=60  # fg=#e2e2e2,bg=#4f3598
  ble-face -s vim_airline_a_inactive                   fg=249,bg=239 # fg=#b2b2b2,bg=#4a4a4a
  ble-face -s vim_airline_a_insert                     fg=235,bg=111 # fg=#242322,bg=#7eaefd
  ble-face -s vim_airline_a_replace                    fg=116,bg=23  # fg=#75d7d8,bg=#005154
  ble-face -s vim_airline_a_visual                     fg=235,bg=174 # fg=#242322,bg=#e6987a
  ble-face -s vim_airline_b                            fg=206,bg=235 # fg=#ff5fd7,bg=#242322
  ble-face -s vim_airline_b_inactive                   fg=249,bg=239 # fg=#b2b2b2,bg=#4a4a4a
  ble-face -s vim_airline_b_insert                     fg=116,bg=235 # fg=#75d7d8,bg=#242322
  ble-face -s vim_airline_b_visual                     fg=185,bg=235 # fg=#dbc570,bg=#242322
  ble-face -s vim_airline_c                            fg=254,bg=239 # fg=#e2e2e2,bg=#4a4a4a
  ble-face -s vim_airline_c_inactive                   fg=249,bg=239 # fg=#b2b2b2,bg=#4a4a4a
  ble-face -s vim_airline_c_inactive_modified          fg=97,bg=231  # fg=#875faf,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=235,bg=111 # fg=#242322,bg=#7eaefd
  ble-face -s vim_airline_c_normal_modified            fg=254,bg=60  # fg=#e2e2e2,bg=#4f3598
  ble-face -s vim_airline_c_replace_modified           fg=254,bg=23  # fg=#e2e2e2,bg=#005154
  ble-face -s vim_airline_c_visual_modified            fg=235,bg=174 # fg=#242322,bg=#e6987a
  ble-face -s vim_airline_z_replace                    fg=235,bg=111 # fg=#242322,bg=#7eaefd
}
