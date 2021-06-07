# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_eighties.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Eighties Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_eighties/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=114 # fg=#393939,bg=#99cc99
  ble-face -s vim_airline_a_inactive                   fg=252,bg=237 # fg=#d3d0c8,bg=#393939
  ble-face -s vim_airline_a_insert                     fg=237,bg=68  # fg=#393939,bg=#6699cc
  ble-face -s vim_airline_a_replace                    fg=237,bg=210 # fg=#393939,bg=#f2777a
  ble-face -s vim_airline_a_visual                     fg=237,bg=176 # fg=#393939,bg=#cc99cc
  ble-face -s vim_airline_b                            fg=254,bg=239 # fg=#e8e6df,bg=#515151
  ble-face -s vim_airline_b_inactive                   fg=252,bg=237 # fg=#d3d0c8,bg=#393939
  ble-face -s vim_airline_c                            fg=209,bg=237 # fg=#f99157,bg=#393939
  ble-face -s vim_airline_c_inactive                   fg=252,bg=237 # fg=#d3d0c8,bg=#393939
}
