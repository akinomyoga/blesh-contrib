# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_fruit_soda.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Fruit Soda vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By jozip

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_fruit_soda/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=246 # fg=#e0dee0,bg=#979598
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e0dee0,bg=#e0dee0
  ble-face -s vim_airline_a_insert                     fg=254,bg=83  # fg=#e0dee0,bg=#47f74c
  ble-face -s vim_airline_a_replace                    fg=254,bg=56  # fg=#e0dee0,bg=#611fce
  ble-face -s vim_airline_a_visual                     fg=254,bg=202 # fg=#e0dee0,bg=#fe6d08
  ble-face -s vim_airline_b                            fg=246,bg=190 # fg=#979598,bg=#d8d5d5
  ble-face -s vim_airline_b_inactive                   fg=246,bg=254 # fg=#979598,bg=#e0dee0
  ble-face -s vim_airline_c                            fg=246,bg=254 # fg=#979598,bg=#e0dee0
  ble-face -s vim_airline_c_inactive                   fg=239,bg=254 # fg=#515151,bg=#e0dee0
  ble-face -s vim_airline_c_insert_modified            fg=236,bg=254 # fg=#2d2c2c,bg=#e0dee0
  ble-face -s vim_airline_c_normal_modified            fg=236,bg=254 # fg=#2d2c2c,bg=#e0dee0
  ble-face -s vim_airline_c_replace_modified           fg=236,bg=254 # fg=#2d2c2c,bg=#e0dee0
  ble-face -s vim_airline_c_visual_modified            fg=236,bg=254 # fg=#2d2c2c,bg=#e0dee0
}
