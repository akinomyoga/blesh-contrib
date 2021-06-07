# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_pop.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Pop Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_pop/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=71  # fg=#202020,bg=#37b349
  ble-face -s vim_airline_a_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=24  # fg=#202020,bg=#0e5a94
  ble-face -s vim_airline_a_replace                    fg=234,bg=198 # fg=#202020,bg=#eb008a
  ble-face -s vim_airline_a_visual                     fg=234,bg=126 # fg=#202020,bg=#b31e8d
  ble-face -s vim_airline_b                            fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_c                            fg=209,bg=234 # fg=#f29333,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
}
