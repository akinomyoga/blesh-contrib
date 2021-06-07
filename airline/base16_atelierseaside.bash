# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelierseaside.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Atelier Seaside Scheme by Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/seaside/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelierseaside/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=34  # fg=#242924,bg=#29a329
  ble-face -s vim_airline_a_inactive                   fg=108,bg=235 # fg=#8ca68c,bg=#242924
  ble-face -s vim_airline_a_insert                     fg=235,bg=63  # fg=#242924,bg=#3d62f5
  ble-face -s vim_airline_a_replace                    fg=235,bg=161 # fg=#242924,bg=#e6193c
  ble-face -s vim_airline_a_visual                     fg=235,bg=129 # fg=#242924,bg=#ad2bee
  ble-face -s vim_airline_b                            fg=191,bg=241 # fg=#cfe8cf,bg=#5e6e5e
  ble-face -s vim_airline_b_inactive                   fg=108,bg=235 # fg=#8ca68c,bg=#242924
  ble-face -s vim_airline_c                            fg=94,bg=235  # fg=#87711d,bg=#242924
  ble-face -s vim_airline_c_inactive                   fg=108,bg=235 # fg=#8ca68c,bg=#242924
}
