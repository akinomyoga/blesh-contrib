# From github:vim-airline/vim-airline-themes/autoload/airline/themes/bubblegum.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Color palette

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:bubblegum/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=150 # fg=#303030,bg=#afd787
  ble-face -s vim_airline_a_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_a_insert                     fg=238,bg=110 # fg=#444444,bg=#87afd7
  ble-face -s vim_airline_a_replace                    fg=236,bg=174 # fg=#303030,bg=#d78787
  ble-face -s vim_airline_a_visual                     fg=236,bg=182 # fg=#303030,bg=#d7afd7
  ble-face -s vim_airline_b                            fg=249,bg=237 # fg=#b2b2b2,bg=#3a3a3a
  ble-face -s vim_airline_b_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c                            fg=150,bg=238 # fg=#afd787,bg=#444444
  ble-face -s vim_airline_c_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c_inactive_modified          fg=179,bg=16  # fg=#d7af5f,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=110,bg=238 # fg=#87afd7,bg=#444444
  ble-face -s vim_airline_c_insert_modified            fg=179,bg=238 # fg=#d7af5f,bg=#444444
  ble-face -s vim_airline_c_normal_modified            fg=179,bg=238 # fg=#d7af5f,bg=#444444
  ble-face -s vim_airline_c_replace                    fg=174,bg=238 # fg=#d78787,bg=#444444
  ble-face -s vim_airline_c_replace_modified           fg=179,bg=238 # fg=#d7af5f,bg=#444444
  ble-face -s vim_airline_c_visual                     fg=182,bg=238 # fg=#d7afd7,bg=#444444
  ble-face -s vim_airline_c_visual_modified            fg=179,bg=238 # fg=#d7af5f,bg=#444444
}
