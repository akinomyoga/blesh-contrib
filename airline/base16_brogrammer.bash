# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_brogrammer.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Brogrammer vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Vik Ramanujam (http://github.com/piggyslasher)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_brogrammer/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=196,bg=32  # fg=#f81118,bg=#2a84d2
  ble-face -s vim_airline_a_inactive                   fg=196,bg=196 # fg=#f81118,bg=#f81118
  ble-face -s vim_airline_a_insert                     fg=196,bg=214 # fg=#f81118,bg=#f3bd09
  ble-face -s vim_airline_a_replace                    fg=196,bg=32  # fg=#f81118,bg=#0f7ddb
  ble-face -s vim_airline_a_visual                     fg=196,bg=166 # fg=#f81118,bg=#de352e
  ble-face -s vim_airline_b                            fg=32,bg=41   # fg=#2a84d2,bg=#2dc55e
  ble-face -s vim_airline_b_inactive                   fg=32,bg=196  # fg=#2a84d2,bg=#f81118
  ble-face -s vim_airline_c                            fg=32,bg=196  # fg=#2a84d2,bg=#f81118
  ble-face -s vim_airline_c_inactive                   fg=61,bg=196  # fg=#4e5ab7,bg=#f81118
  ble-face -s vim_airline_c_insert_modified            fg=253,bg=196 # fg=#d6dbe5,bg=#f81118
  ble-face -s vim_airline_c_normal_modified            fg=253,bg=196 # fg=#d6dbe5,bg=#f81118
  ble-face -s vim_airline_c_replace_modified           fg=253,bg=196 # fg=#d6dbe5,bg=#f81118
  ble-face -s vim_airline_c_visual_modified            fg=253,bg=196 # fg=#d6dbe5,bg=#f81118
}
