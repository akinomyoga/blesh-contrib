# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_heath_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Heath Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_heath_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=252,bg=96  # fg=#d8cad8,bg=#776977
  ble-face -s vim_airline_a_inactive                   fg=252,bg=252 # fg=#d8cad8,bg=#d8cad8
  ble-face -s vim_airline_a_insert                     fg=252,bg=101 # fg=#d8cad8,bg=#918b3b
  ble-face -s vim_airline_a_replace                    fg=252,bg=97  # fg=#d8cad8,bg=#7b59c0
  ble-face -s vim_airline_a_visual                     fg=252,bg=130 # fg=#d8cad8,bg=#a65926
  ble-face -s vim_airline_b                            fg=96,bg=248  # fg=#776977,bg=#ab9bab
  ble-face -s vim_airline_b_inactive                   fg=96,bg=252  # fg=#776977,bg=#d8cad8
  ble-face -s vim_airline_c                            fg=96,bg=252  # fg=#776977,bg=#d8cad8
  ble-face -s vim_airline_c_inactive                   fg=241,bg=252 # fg=#695d69,bg=#d8cad8
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=252 # fg=#1b181b,bg=#d8cad8
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=252 # fg=#1b181b,bg=#d8cad8
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=252 # fg=#1b181b,bg=#d8cad8
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=252 # fg=#1b181b,bg=#d8cad8
}
