# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_github.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Github vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Defman21

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_github/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=254 # fg=#f5f5f5,bg=#e8e8e8
  ble-face -s vim_airline_a_inactive                   fg=255,bg=255 # fg=#f5f5f5,bg=#f5f5f5
  ble-face -s vim_airline_a_insert                     fg=255,bg=24  # fg=#f5f5f5,bg=#183691
  ble-face -s vim_airline_a_replace                    fg=255,bg=125 # fg=#f5f5f5,bg=#a71d5d
  ble-face -s vim_airline_a_visual                     fg=255,bg=31  # fg=#f5f5f5,bg=#0086b3
  ble-face -s vim_airline_b                            fg=254,bg=189 # fg=#e8e8e8,bg=#c8c8fa
  ble-face -s vim_airline_b_inactive                   fg=254,bg=255 # fg=#e8e8e8,bg=#f5f5f5
  ble-face -s vim_airline_c                            fg=254,bg=255 # fg=#e8e8e8,bg=#f5f5f5
  ble-face -s vim_airline_c_inactive                   fg=236,bg=255 # fg=#333333,bg=#f5f5f5
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=255 # fg=#ffffff,bg=#f5f5f5
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=255 # fg=#ffffff,bg=#f5f5f5
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=255 # fg=#ffffff,bg=#f5f5f5
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=255 # fg=#ffffff,bg=#f5f5f5
}
