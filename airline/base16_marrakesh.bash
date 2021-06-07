# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_marrakesh.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Marrakesh Scheme by Alexandre Gavioli (http://github.com/Alexx2/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_marrakesh/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=52,bg=29   # fg=#302e00,bg=#18974e
  ble-face -s vim_airline_a_inactive                   fg=101,bg=52  # fg=#948e48,bg=#302e00
  ble-face -s vim_airline_a_insert                     fg=52,bg=67   # fg=#302e00,bg=#477ca1
  ble-face -s vim_airline_a_replace                    fg=52,bg=167  # fg=#302e00,bg=#c35359
  ble-face -s vim_airline_a_visual                     fg=52,bg=97   # fg=#302e00,bg=#8868b3
  ble-face -s vim_airline_b                            fg=186,bg=58  # fg=#ccc37a,bg=#5f5b17
  ble-face -s vim_airline_b_inactive                   fg=101,bg=52  # fg=#948e48,bg=#302e00
  ble-face -s vim_airline_c                            fg=131,bg=52  # fg=#b36144,bg=#302e00
  ble-face -s vim_airline_c_inactive                   fg=101,bg=52  # fg=#948e48,bg=#302e00
}
