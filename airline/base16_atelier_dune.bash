# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_dune.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Dune vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_dune/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=16,bg=102  # fg=#292824,bg=#999580
  ble-face -s vim_airline_a_inactive                   fg=16,bg=16   # fg=#292824,bg=#292824
  ble-face -s vim_airline_a_insert                     fg=16,bg=71   # fg=#292824,bg=#60ac39
  ble-face -s vim_airline_a_replace                    fg=16,bg=134  # fg=#292824,bg=#b854d4
  ble-face -s vim_airline_a_visual                     fg=16,bg=130  # fg=#292824,bg=#b65611
  ble-face -s vim_airline_b                            fg=102,bg=59  # fg=#999580,bg=#6e6b5e
  ble-face -s vim_airline_b_inactive                   fg=102,bg=16  # fg=#999580,bg=#292824
  ble-face -s vim_airline_c                            fg=102,bg=16  # fg=#999580,bg=#292824
  ble-face -s vim_airline_c_inactive                   fg=144,bg=16  # fg=#a6a28c,bg=#292824
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=16  # fg=#fefbec,bg=#292824
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=16  # fg=#fefbec,bg=#292824
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=16  # fg=#fefbec,bg=#292824
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=16  # fg=#fefbec,bg=#292824
}
