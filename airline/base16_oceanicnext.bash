# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_oceanicnext.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Oceanic Next Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_oceanicnext/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=114 # fg=#343d46,bg=#99c794
  ble-face -s vim_airline_a_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
  ble-face -s vim_airline_a_insert                     fg=237,bg=68  # fg=#343d46,bg=#6699cc
  ble-face -s vim_airline_a_replace                    fg=237,bg=203 # fg=#343d46,bg=#ec5f67
  ble-face -s vim_airline_a_visual                     fg=237,bg=176 # fg=#343d46,bg=#c594c5
  ble-face -s vim_airline_b                            fg=189,bg=240 # fg=#cdd3de,bg=#4f5b66
  ble-face -s vim_airline_b_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
  ble-face -s vim_airline_c                            fg=209,bg=237 # fg=#f99157,bg=#343d46
  ble-face -s vim_airline_c_inactive                   fg=152,bg=237 # fg=#c0c5ce,bg=#343d46
}
