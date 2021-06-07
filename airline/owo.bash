# From github:vim-airline/vim-airline-themes/autoload/airline/themes/owo.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:owo/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=117 # fg=#303030,bg=#87d7ff
  ble-face -s vim_airline_a_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_a_insert                     fg=238,bg=110 # fg=#444444,bg=#87afd7
  ble-face -s vim_airline_a_replace                    fg=236,bg=105 # fg=#303030,bg=#8787ff
  ble-face -s vim_airline_a_visual                     fg=236,bg=114 # fg=#303030,bg=#87d787
  ble-face -s vim_airline_b                            fg=249,bg=237 # fg=#b2b2b2,bg=#3a3a3a
  ble-face -s vim_airline_b_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c                            fg=117,bg=238 # fg=#87d7ff,bg=#444444
  ble-face -s vim_airline_c_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c_inactive_modified          fg=110,bg=238 # fg=#87afd7,bg=#444444
  ble-face -s vim_airline_c_insert                     fg=110,bg=238 # fg=#87afd7,bg=#444444
  ble-face -s vim_airline_c_normal_modified            fg=110,bg=238 # fg=#87afd7,bg=#444444
  ble-face -s vim_airline_c_replace                    fg=105,bg=238 # fg=#8787ff,bg=#444444
  ble-face -s vim_airline_c_replace_modified           fg=110,bg=238 # fg=#87afd7,bg=#444444
  ble-face -s vim_airline_c_visual                     fg=114,bg=238 # fg=#87d787,bg=#444444
  ble-face -s vim_airline_c_visual_modified            fg=110,bg=238 # fg=#87afd7,bg=#444444
}
