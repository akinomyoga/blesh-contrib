# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_flat.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Flat Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_flat/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=239,bg=41  # fg=#34495e,bg=#2ecc71
  ble-face -s vim_airline_a_inactive                   fg=254,bg=239 # fg=#e0e0e0,bg=#34495e
  ble-face -s vim_airline_a_insert                     fg=239,bg=68  # fg=#34495e,bg=#3498db
  ble-face -s vim_airline_a_replace                    fg=239,bg=167 # fg=#34495e,bg=#e74c3c
  ble-face -s vim_airline_a_visual                     fg=239,bg=133 # fg=#34495e,bg=#9b59b6
  ble-face -s vim_airline_b                            fg=255,bg=106 # fg=#f5f5f5,bg=#7f8c8d
  ble-face -s vim_airline_b_inactive                   fg=254,bg=239 # fg=#e0e0e0,bg=#34495e
  ble-face -s vim_airline_c                            fg=172,bg=239 # fg=#e67e22,bg=#34495e
  ble-face -s vim_airline_c_inactive                   fg=254,bg=239 # fg=#e0e0e0,bg=#34495e
}
