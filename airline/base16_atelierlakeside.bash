# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelierlakeside.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Atelier Lakeside Scheme by Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/lakeside/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelierlakeside/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=65  # fg=#1f292e,bg=#568c3b
  ble-face -s vim_airline_a_inactive                   fg=109,bg=235 # fg=#7ea2b4,bg=#1f292e
  ble-face -s vim_airline_a_insert                     fg=235,bg=31  # fg=#1f292e,bg=#257fad
  ble-face -s vim_airline_a_replace                    fg=235,bg=161 # fg=#1f292e,bg=#d22d72
  ble-face -s vim_airline_a_visual                     fg=235,bg=61  # fg=#1f292e,bg=#5d5db1
  ble-face -s vim_airline_b                            fg=153,bg=60  # fg=#c1e4f6,bg=#516d7b
  ble-face -s vim_airline_b_inactive                   fg=109,bg=235 # fg=#7ea2b4,bg=#1f292e
  ble-face -s vim_airline_c                            fg=94,bg=235  # fg=#935c25,bg=#1f292e
  ble-face -s vim_airline_c_inactive                   fg=109,bg=235 # fg=#7ea2b4,bg=#1f292e
}
