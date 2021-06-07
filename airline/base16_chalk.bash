# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_chalk.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Chalk Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_chalk/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=143 # fg=#202020,bg=#acc267
  ble-face -s vim_airline_a_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=75  # fg=#202020,bg=#6fc2ef
  ble-face -s vim_airline_a_replace                    fg=234,bg=217 # fg=#202020,bg=#fb9fb1
  ble-face -s vim_airline_a_visual                     fg=234,bg=183 # fg=#202020,bg=#e1a3ee
  ble-face -s vim_airline_b                            fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_c                            fg=216,bg=234 # fg=#eda987,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
}
