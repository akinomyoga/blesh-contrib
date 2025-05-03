# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_plateau_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Plateau Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_plateau_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=63  # fg=#e7dfdf,bg=#655d5d
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e7dfdf,bg=#e7dfdf
  ble-face -s vim_airline_a_insert                     fg=254,bg=66  # fg=#e7dfdf,bg=#4b8b8b
  ble-face -s vim_airline_a_replace                    fg=254,bg=98  # fg=#e7dfdf,bg=#8464c4
  ble-face -s vim_airline_a_visual                     fg=254,bg=131 # fg=#e7dfdf,bg=#b45a3c
  ble-face -s vim_airline_b                            fg=63,bg=105  # fg=#655d5d,bg=#8a8585
  ble-face -s vim_airline_b_inactive                   fg=63,bg=254  # fg=#655d5d,bg=#e7dfdf
  ble-face -s vim_airline_c                            fg=63,bg=254  # fg=#655d5d,bg=#e7dfdf
  ble-face -s vim_airline_c_inactive                   fg=240,bg=254 # fg=#585050,bg=#e7dfdf
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#1b1818,bg=#e7dfdf
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#1b1818,bg=#e7dfdf
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#1b1818,bg=#e7dfdf
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#1b1818,bg=#e7dfdf
}
