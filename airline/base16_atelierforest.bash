# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelierforest.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Atelier Forest Scheme by Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/forest)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelierforest/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=16,bg=71   # fg=#2c2421,bg=#5ab738
  ble-face -s vim_airline_a_inactive                   fg=145,bg=16  # fg=#a8a19f,bg=#2c2421
  ble-face -s vim_airline_a_insert                     fg=16,bg=68   # fg=#2c2421,bg=#407ee7
  ble-face -s vim_airline_a_replace                    fg=16,bg=197  # fg=#2c2421,bg=#f22c40
  ble-face -s vim_airline_a_visual                     fg=16,bg=62   # fg=#2c2421,bg=#6666ea
  ble-face -s vim_airline_b                            fg=188,bg=59  # fg=#e6e2e0,bg=#68615e
  ble-face -s vim_airline_b_inactive                   fg=145,bg=16  # fg=#a8a19f,bg=#2c2421
  ble-face -s vim_airline_c                            fg=166,bg=16  # fg=#df5320,bg=#2c2421
  ble-face -s vim_airline_c_inactive                   fg=145,bg=16  # fg=#a8a19f,bg=#2c2421
}
