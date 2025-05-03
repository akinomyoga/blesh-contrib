# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_savanna_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Savanna Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_savanna_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=241 # fg=#dfe7e2,bg=#5f6d64
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#dfe7e2,bg=#dfe7e2
  ble-face -s vim_airline_a_insert                     fg=254,bg=65  # fg=#dfe7e2,bg=#489963
  ble-face -s vim_airline_a_replace                    fg=254,bg=67  # fg=#dfe7e2,bg=#55859b
  ble-face -s vim_airline_a_visual                     fg=254,bg=131 # fg=#dfe7e2,bg=#9f713c
  ble-face -s vim_airline_b                            fg=241,bg=245 # fg=#5f6d64,bg=#87928a
  ble-face -s vim_airline_b_inactive                   fg=241,bg=254 # fg=#5f6d64,bg=#dfe7e2
  ble-face -s vim_airline_c                            fg=241,bg=254 # fg=#5f6d64,bg=#dfe7e2
  ble-face -s vim_airline_c_inactive                   fg=240,bg=254 # fg=#526057,bg=#dfe7e2
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#171c19,bg=#dfe7e2
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#171c19,bg=#dfe7e2
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#171c19,bg=#dfe7e2
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#171c19,bg=#dfe7e2
}
