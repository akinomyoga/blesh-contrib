# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_harmonic16.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 harmonic16 Scheme by Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_harmonic16/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=72   # fg=#223b54,bg=#56bf8b
  ble-face -s vim_airline_a_inactive                   fg=190,bg=23  # fg=#cbd6e2,bg=#223b54
  ble-face -s vim_airline_a_insert                     fg=23,bg=97   # fg=#223b54,bg=#8b56bf
  ble-face -s vim_airline_a_replace                    fg=23,bg=137  # fg=#223b54,bg=#bf8b56
  ble-face -s vim_airline_a_visual                     fg=23,bg=132  # fg=#223b54,bg=#bf568b
  ble-face -s vim_airline_b                            fg=195,bg=60  # fg=#e5ebf1,bg=#405c79
  ble-face -s vim_airline_b_inactive                   fg=190,bg=23  # fg=#cbd6e2,bg=#223b54
  ble-face -s vim_airline_c                            fg=143,bg=23  # fg=#bfbf56,bg=#223b54
  ble-face -s vim_airline_c_inactive                   fg=190,bg=23  # fg=#cbd6e2,bg=#223b54
}
