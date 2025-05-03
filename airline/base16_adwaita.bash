# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_adwaita.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Adwaita Scheme by Rory Bradford (https://github.com/roryrjb)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_adwaita/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=84  # fg=#33393b,bg=#6fee91
  ble-face -s vim_airline_a_inactive                   fg=251,bg=237 # fg=#c5c6c5,bg=#33393b
  ble-face -s vim_airline_a_insert                     fg=237,bg=97  # fg=#33393b,bg=#916fb4
  ble-face -s vim_airline_a_replace                    fg=237,bg=214 # fg=#33393b,bg=#ffa500
  ble-face -s vim_airline_a_visual                     fg=237,bg=204 # fg=#33393b,bg=#ee6f91
  ble-face -s vim_airline_b                            fg=188,bg=239 # fg=#d3d4d5,bg=#4b5356
  ble-face -s vim_airline_b_inactive                   fg=251,bg=237 # fg=#c5c6c5,bg=#33393b
  ble-face -s vim_airline_c                            fg=227,bg=237 # fg=#ffff60,bg=#33393b
  ble-face -s vim_airline_c_inactive                   fg=251,bg=237 # fg=#c5c6c5,bg=#33393b
}
