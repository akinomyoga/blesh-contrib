# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_hopscotch.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Hopscotch Scheme by Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_hopscotch/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=107 # fg=#433b42,bg=#8fc13e
  ble-face -s vim_airline_a_inactive                   fg=250,bg=238 # fg=#b9b5b8,bg=#433b42
  ble-face -s vim_airline_a_insert                     fg=238,bg=31  # fg=#433b42,bg=#1290bf
  ble-face -s vim_airline_a_replace                    fg=238,bg=167 # fg=#433b42,bg=#dd464c
  ble-face -s vim_airline_a_visual                     fg=238,bg=168 # fg=#433b42,bg=#c85e7c
  ble-face -s vim_airline_b                            fg=188,bg=240 # fg=#d5d3d5,bg=#5c545b
  ble-face -s vim_airline_b_inactive                   fg=250,bg=238 # fg=#b9b5b8,bg=#433b42
  ble-face -s vim_airline_c                            fg=208,bg=238 # fg=#fd8b19,bg=#433b42
  ble-face -s vim_airline_c_inactive                   fg=250,bg=238 # fg=#b9b5b8,bg=#433b42
}
