# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_edge_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Edge Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Sainnhepark (https://github.com/sainnhe)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_edge_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=103,bg=110 # fg=#88909f,bg=#73b3e7
  ble-face -s vim_airline_a_inactive                   fg=103,bg=103 # fg=#88909f,bg=#88909f
  ble-face -s vim_airline_a_insert                     fg=103,bg=144 # fg=#88909f,bg=#a1bf78
  ble-face -s vim_airline_a_replace                    fg=103,bg=176 # fg=#88909f,bg=#d390e7
  ble-face -s vim_airline_a_visual                     fg=103,bg=167 # fg=#88909f,bg=#e77171
  ble-face -s vim_airline_b                            fg=110,bg=146 # fg=#73b3e7,bg=#b7bec9
  ble-face -s vim_airline_b_inactive                   fg=110,bg=103 # fg=#73b3e7,bg=#88909f
  ble-face -s vim_airline_c                            fg=110,bg=103 # fg=#73b3e7,bg=#88909f
  ble-face -s vim_airline_c_inactive                   fg=146,bg=103 # fg=#b7bec9,bg=#88909f
  ble-face -s vim_airline_c_insert_modified            fg=238,bg=103 # fg=#3e4249,bg=#88909f
  ble-face -s vim_airline_c_normal_modified            fg=238,bg=103 # fg=#3e4249,bg=#88909f
  ble-face -s vim_airline_c_replace_modified           fg=238,bg=103 # fg=#3e4249,bg=#88909f
  ble-face -s vim_airline_c_visual_modified            fg=238,bg=103 # fg=#3e4249,bg=#88909f
}
