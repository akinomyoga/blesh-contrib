# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelierdune.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Atelier Dune Scheme by Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/dune)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelierdune/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=71  # fg=#292824,bg=#60ac39
  ble-face -s vim_airline_a_inactive                   fg=144,bg=235 # fg=#a6a28c,bg=#292824
  ble-face -s vim_airline_a_insert                     fg=235,bg=68  # fg=#292824,bg=#6684e1
  ble-face -s vim_airline_a_replace                    fg=235,bg=167 # fg=#292824,bg=#d73737
  ble-face -s vim_airline_a_visual                     fg=235,bg=134 # fg=#292824,bg=#b854d4
  ble-face -s vim_airline_b                            fg=253,bg=242 # fg=#e8e4cf,bg=#6e6b5e
  ble-face -s vim_airline_b_inactive                   fg=144,bg=235 # fg=#a6a28c,bg=#292824
  ble-face -s vim_airline_c                            fg=130,bg=235 # fg=#b65611,bg=#292824
  ble-face -s vim_airline_c_inactive                   fg=144,bg=235 # fg=#a6a28c,bg=#292824
  ble-face -s vim_airline_error                        fg=231,bg=167 # fg=#fefbec,bg=#d73737
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=235,bg=178 # fg=#292824,bg=#cfb017
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
