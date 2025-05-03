# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_phd.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 PhD vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Hennig Hasemann (http://leetless.de/vim.html)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_phd/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=103  # fg=#2a3448,bg=#9a99a3
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#2a3448,bg=#2a3448
  ble-face -s vim_airline_a_insert                     fg=23,bg=107  # fg=#2a3448,bg=#99bf52
  ble-face -s vim_airline_a_replace                    fg=23,bg=104  # fg=#2a3448,bg=#9989cc
  ble-face -s vim_airline_a_visual                     fg=23,bg=214  # fg=#2a3448,bg=#f0a000
  ble-face -s vim_airline_b                            fg=103,bg=240 # fg=#9a99a3,bg=#4d5666
  ble-face -s vim_airline_b_inactive                   fg=103,bg=23  # fg=#9a99a3,bg=#2a3448
  ble-face -s vim_airline_c                            fg=103,bg=23  # fg=#9a99a3,bg=#2a3448
  ble-face -s vim_airline_c_inactive                   fg=250,bg=23  # fg=#b8bbc2,bg=#2a3448
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#ffffff,bg=#2a3448
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#ffffff,bg=#2a3448
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#ffffff,bg=#2a3448
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#ffffff,bg=#2a3448
}
