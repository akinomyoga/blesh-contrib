# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_lakeside_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Lakeside Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_lakeside_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=153,bg=66  # fg=#c1e4f6,bg=#5a7b8c
  ble-face -s vim_airline_a_inactive                   fg=153,bg=153 # fg=#c1e4f6,bg=#c1e4f6
  ble-face -s vim_airline_a_insert                     fg=153,bg=65  # fg=#c1e4f6,bg=#568c3b
  ble-face -s vim_airline_a_replace                    fg=153,bg=61  # fg=#c1e4f6,bg=#6b6bb8
  ble-face -s vim_airline_a_visual                     fg=153,bg=94  # fg=#c1e4f6,bg=#935c25
  ble-face -s vim_airline_b                            fg=66,bg=109  # fg=#5a7b8c,bg=#7ea2b4
  ble-face -s vim_airline_b_inactive                   fg=66,bg=153  # fg=#5a7b8c,bg=#c1e4f6
  ble-face -s vim_airline_c                            fg=66,bg=153  # fg=#5a7b8c,bg=#c1e4f6
  ble-face -s vim_airline_c_inactive                   fg=60,bg=153  # fg=#516d7b,bg=#c1e4f6
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=153 # fg=#161b1d,bg=#c1e4f6
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=153 # fg=#161b1d,bg=#c1e4f6
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=153 # fg=#161b1d,bg=#c1e4f6
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=153 # fg=#161b1d,bg=#c1e4f6
}
