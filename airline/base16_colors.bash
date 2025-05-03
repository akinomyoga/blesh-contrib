# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_colors.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Colors Scheme by mrmrs (http://clrs.cc)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_colors/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=41  # fg=#333333,bg=#2ecc40
  ble-face -s vim_airline_a_inactive                   fg=250,bg=236 # fg=#bbbbbb,bg=#333333
  ble-face -s vim_airline_a_insert                     fg=236,bg=32  # fg=#333333,bg=#0074d9
  ble-face -s vim_airline_a_replace                    fg=236,bg=203 # fg=#333333,bg=#ff4136
  ble-face -s vim_airline_a_visual                     fg=236,bg=128 # fg=#333333,bg=#b10dc9
  ble-face -s vim_airline_b                            fg=253,bg=240 # fg=#dddddd,bg=#555555
  ble-face -s vim_airline_b_inactive                   fg=250,bg=236 # fg=#bbbbbb,bg=#333333
  ble-face -s vim_airline_c                            fg=208,bg=236 # fg=#ff851b,bg=#333333
  ble-face -s vim_airline_c_inactive                   fg=250,bg=236 # fg=#bbbbbb,bg=#333333
}
