# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_summerfruit.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Summerfruit Scheme by Christopher Corley (http://cscorley.github.io/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_summerfruit/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=40  # fg=#202020,bg=#00c918
  ble-face -s vim_airline_a_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=68  # fg=#202020,bg=#3777e6
  ble-face -s vim_airline_a_replace                    fg=234,bg=198 # fg=#202020,bg=#ff0086
  ble-face -s vim_airline_a_visual                     fg=234,bg=127 # fg=#202020,bg=#ad00a1
  ble-face -s vim_airline_b                            fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_c                            fg=208,bg=234 # fg=#fd8900,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
}
