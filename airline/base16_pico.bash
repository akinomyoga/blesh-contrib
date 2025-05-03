# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_pico.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Pico vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By PICO-8 (http://www.lexaloffle.com/pico-8.php)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_pico/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=131  # fg=#1d2b53,bg=#ab5236
  ble-face -s vim_airline_a_inactive                   fg=17,bg=17   # fg=#1d2b53,bg=#1d2b53
  ble-face -s vim_airline_a_insert                     fg=17,bg=41   # fg=#1d2b53,bg=#00e756
  ble-face -s vim_airline_a_replace                    fg=17,bg=211  # fg=#1d2b53,bg=#ff77a8
  ble-face -s vim_airline_a_visual                     fg=17,bg=214  # fg=#1d2b53,bg=#ffa300
  ble-face -s vim_airline_b                            fg=131,bg=89  # fg=#ab5236,bg=#7e2553
  ble-face -s vim_airline_b_inactive                   fg=131,bg=17  # fg=#ab5236,bg=#1d2b53
  ble-face -s vim_airline_c                            fg=131,bg=17  # fg=#ab5236,bg=#1d2b53
  ble-face -s vim_airline_c_inactive                   fg=240,bg=17  # fg=#5f574f,bg=#1d2b53
  ble-face -s vim_airline_c_insert_modified            fg=230,bg=17  # fg=#fff1e8,bg=#1d2b53
  ble-face -s vim_airline_c_normal_modified            fg=230,bg=17  # fg=#fff1e8,bg=#1d2b53
  ble-face -s vim_airline_c_replace_modified           fg=230,bg=17  # fg=#fff1e8,bg=#1d2b53
  ble-face -s vim_airline_c_visual_modified            fg=230,bg=17  # fg=#fff1e8,bg=#1d2b53
}
