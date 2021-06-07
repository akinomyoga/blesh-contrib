# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_material.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Material vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Nate Peterson

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_material/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=152  # fg=#2e3c43,bg=#b2ccd6
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#2e3c43,bg=#2e3c43
  ble-face -s vim_airline_a_insert                     fg=23,bg=186  # fg=#2e3c43,bg=#c3e88d
  ble-face -s vim_airline_a_replace                    fg=23,bg=176  # fg=#2e3c43,bg=#c792ea
  ble-face -s vim_airline_a_visual                     fg=23,bg=209  # fg=#2e3c43,bg=#f78c6c
  ble-face -s vim_airline_b                            fg=152,bg=238 # fg=#b2ccd6,bg=#314549
  ble-face -s vim_airline_b_inactive                   fg=152,bg=23  # fg=#b2ccd6,bg=#2e3c43
  ble-face -s vim_airline_c                            fg=152,bg=23  # fg=#b2ccd6,bg=#2e3c43
  ble-face -s vim_airline_c_inactive                   fg=231,bg=23  # fg=#eeffff,bg=#2e3c43
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#ffffff,bg=#2e3c43
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#ffffff,bg=#2e3c43
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#ffffff,bg=#2e3c43
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#ffffff,bg=#2e3c43
}
