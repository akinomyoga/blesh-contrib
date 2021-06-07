# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_railscasts.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Railscasts Scheme by Ryan Bates (http://railscasts.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_railscasts/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=143  # fg=#272935,bg=#a5c261
  ble-face -s vim_airline_a_inactive                   fg=254,bg=17  # fg=#e6e1dc,bg=#272935
  ble-face -s vim_airline_a_insert                     fg=17,bg=73   # fg=#272935,bg=#6d9cbe
  ble-face -s vim_airline_a_replace                    fg=17,bg=167  # fg=#272935,bg=#da4939
  ble-face -s vim_airline_a_visual                     fg=17,bg=147  # fg=#272935,bg=#b6b3eb
  ble-face -s vim_airline_b                            fg=255,bg=238 # fg=#f4f1ed,bg=#3a4055
  ble-face -s vim_airline_b_inactive                   fg=254,bg=17  # fg=#e6e1dc,bg=#272935
  ble-face -s vim_airline_c                            fg=173,bg=17  # fg=#cc7833,bg=#272935
  ble-face -s vim_airline_c_inactive                   fg=254,bg=17  # fg=#e6e1dc,bg=#272935
}
