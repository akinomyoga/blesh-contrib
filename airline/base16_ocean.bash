# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_ocean.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Ocean Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_ocean/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=144 # fg=#343d46,bg=#a3be8c
  ble-face -s vim_airline_a_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
  ble-face -s vim_airline_a_insert                     fg=237,bg=109 # fg=#343d46,bg=#8fa1b3
  ble-face -s vim_airline_a_replace                    fg=237,bg=131 # fg=#343d46,bg=#bf616a
  ble-face -s vim_airline_a_visual                     fg=237,bg=139 # fg=#343d46,bg=#b48ead
  ble-face -s vim_airline_b                            fg=254,bg=240 # fg=#dfe1e8,bg=#4f5b66
  ble-face -s vim_airline_b_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
  ble-face -s vim_airline_c                            fg=173,bg=237 # fg=#d08770,bg=#343d46
  ble-face -s vim_airline_c_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
}
