# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_circus.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Circus vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_circus/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=239 # fg=#202020,bg=#505050
  ble-face -s vim_airline_a_inactive                   fg=234,bg=234 # fg=#202020,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=108 # fg=#202020,bg=#84b97c
  ble-face -s vim_airline_a_replace                    fg=234,bg=140 # fg=#202020,bg=#b888e2
  ble-face -s vim_airline_a_visual                     fg=234,bg=73  # fg=#202020,bg=#4bb1a7
  ble-face -s vim_airline_b                            fg=239,bg=236 # fg=#505050,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=239,bg=234 # fg=#505050,bg=#202020
  ble-face -s vim_airline_c                            fg=239,bg=234 # fg=#505050,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=248,bg=234 # fg=#a7a7a7,bg=#202020
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=234 # fg=#ffffff,bg=#202020
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=234 # fg=#ffffff,bg=#202020
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=234 # fg=#ffffff,bg=#202020
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=234 # fg=#ffffff,bg=#202020
}
