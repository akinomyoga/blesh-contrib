# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_cave_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Cave Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_cave_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=241 # fg=#e2dfe7,bg=#655f6d
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e2dfe7,bg=#e2dfe7
  ble-face -s vim_airline_a_insert                     fg=254,bg=30  # fg=#e2dfe7,bg=#2a9292
  ble-face -s vim_airline_a_replace                    fg=254,bg=98  # fg=#e2dfe7,bg=#955ae7
  ble-face -s vim_airline_a_visual                     fg=254,bg=131 # fg=#e2dfe7,bg=#aa573c
  ble-face -s vim_airline_b                            fg=241,bg=245 # fg=#655f6d,bg=#8b8792
  ble-face -s vim_airline_b_inactive                   fg=241,bg=254 # fg=#655f6d,bg=#e2dfe7
  ble-face -s vim_airline_c                            fg=241,bg=254 # fg=#655f6d,bg=#e2dfe7
  ble-face -s vim_airline_c_inactive                   fg=240,bg=254 # fg=#585260,bg=#e2dfe7
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#19171c,bg=#e2dfe7
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#19171c,bg=#e2dfe7
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#19171c,bg=#e2dfe7
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#19171c,bg=#e2dfe7
}
