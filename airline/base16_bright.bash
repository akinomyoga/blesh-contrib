# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_bright.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Bright Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_bright/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=149 # fg=#303030,bg=#a1c659
  ble-face -s vim_airline_a_inactive                   fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_a_insert                     fg=236,bg=74  # fg=#303030,bg=#6fb3d2
  ble-face -s vim_airline_a_replace                    fg=236,bg=196 # fg=#303030,bg=#fb0120
  ble-face -s vim_airline_a_visual                     fg=236,bg=176 # fg=#303030,bg=#d381c3
  ble-face -s vim_airline_b                            fg=255,bg=239 # fg=#f5f5f5,bg=#505050
  ble-face -s vim_airline_b_inactive                   fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_c                            fg=202,bg=236 # fg=#fc6d24,bg=#303030
  ble-face -s vim_airline_c_inactive                   fg=254,bg=236 # fg=#e0e0e0,bg=#303030
}
