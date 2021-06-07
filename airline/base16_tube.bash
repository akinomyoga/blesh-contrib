# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_tube.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 London Tube vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_tube/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=24,bg=109  # fg=#1c3f95,bg=#959ca1
  ble-face -s vim_airline_a_inactive                   fg=24,bg=24   # fg=#1c3f95,bg=#1c3f95
  ble-face -s vim_airline_a_insert                     fg=24,bg=29   # fg=#1c3f95,bg=#00853e
  ble-face -s vim_airline_a_replace                    fg=24,bg=89   # fg=#1c3f95,bg=#98005d
  ble-face -s vim_airline_a_visual                     fg=24,bg=211  # fg=#1c3f95,bg=#f386a1
  ble-face -s vim_airline_b                            fg=109,bg=240 # fg=#959ca1,bg=#5a5758
  ble-face -s vim_airline_b_inactive                   fg=109,bg=24  # fg=#959ca1,bg=#1c3f95
  ble-face -s vim_airline_c                            fg=109,bg=24  # fg=#959ca1,bg=#1c3f95
  ble-face -s vim_airline_c_inactive                   fg=192,bg=24  # fg=#d9d8d8,bg=#1c3f95
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=24  # fg=#ffffff,bg=#1c3f95
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=24  # fg=#ffffff,bg=#1c3f95
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=24  # fg=#ffffff,bg=#1c3f95
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=24  # fg=#ffffff,bg=#1c3f95
}
