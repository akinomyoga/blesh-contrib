# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelierheath.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Atelier Heath Scheme by Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/heath)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelierheath/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=65  # fg=#292329,bg=#379a37
  ble-face -s vim_airline_a_inactive                   fg=248,bg=235 # fg=#ab9bab,bg=#292329
  ble-face -s vim_airline_a_insert                     fg=235,bg=63  # fg=#292329,bg=#516aec
  ble-face -s vim_airline_a_replace                    fg=235,bg=166 # fg=#292329,bg=#ca402b
  ble-face -s vim_airline_a_visual                     fg=235,bg=97  # fg=#292329,bg=#7b59c0
  ble-face -s vim_airline_b                            fg=252,bg=241 # fg=#d8cad8,bg=#695d69
  ble-face -s vim_airline_b_inactive                   fg=248,bg=235 # fg=#ab9bab,bg=#292329
  ble-face -s vim_airline_c                            fg=130,bg=235 # fg=#a65926,bg=#292329
  ble-face -s vim_airline_c_inactive                   fg=248,bg=235 # fg=#ab9bab,bg=#292329
}
