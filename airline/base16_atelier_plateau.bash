# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_plateau.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Plateau vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_plateau/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=16,bg=102  # fg=#292424,bg=#7e7777
  ble-face -s vim_airline_a_inactive                   fg=16,bg=16   # fg=#292424,bg=#292424
  ble-face -s vim_airline_a_insert                     fg=16,bg=66   # fg=#292424,bg=#4b8b8b
  ble-face -s vim_airline_a_replace                    fg=16,bg=98   # fg=#292424,bg=#8464c4
  ble-face -s vim_airline_a_visual                     fg=16,bg=131  # fg=#292424,bg=#b45a3c
  ble-face -s vim_airline_b                            fg=102,bg=59  # fg=#7e7777,bg=#585050
  ble-face -s vim_airline_b_inactive                   fg=102,bg=16  # fg=#7e7777,bg=#292424
  ble-face -s vim_airline_c                            fg=102,bg=16  # fg=#7e7777,bg=#292424
  ble-face -s vim_airline_c_inactive                   fg=102,bg=16  # fg=#8a8585,bg=#292424
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=16  # fg=#f4ecec,bg=#292424
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=16  # fg=#f4ecec,bg=#292424
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=16  # fg=#f4ecec,bg=#292424
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=16  # fg=#f4ecec,bg=#292424
}
