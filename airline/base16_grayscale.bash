# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_grayscale.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Grayscale Scheme by Alexandre Gavioli (https://github.com/Alexx2/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_grayscale/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=245 # fg=#252525,bg=#8e8e8e
  ble-face -s vim_airline_a_inactive                   fg=250,bg=235 # fg=#b9b9b9,bg=#252525
  ble-face -s vim_airline_a_insert                     fg=235,bg=242 # fg=#252525,bg=#686868
  ble-face -s vim_airline_a_replace                    fg=235,bg=244 # fg=#252525,bg=#7c7c7c
  ble-face -s vim_airline_a_visual                     fg=235,bg=243 # fg=#252525,bg=#747474
  ble-face -s vim_airline_b                            fg=254,bg=238 # fg=#e3e3e3,bg=#464646
  ble-face -s vim_airline_b_inactive                   fg=250,bg=235 # fg=#b9b9b9,bg=#252525
  ble-face -s vim_airline_c                            fg=247,bg=235 # fg=#999999,bg=#252525
  ble-face -s vim_airline_c_inactive                   fg=250,bg=235 # fg=#b9b9b9,bg=#252525
}
