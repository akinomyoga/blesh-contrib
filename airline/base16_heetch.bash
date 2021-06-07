# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_heetch.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Heetch Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Geoffrey Teale (tealeg@gmail.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_heetch/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=53,bg=139  # fg=#392551,bg=#9c92a8
  ble-face -s vim_airline_a_inactive                   fg=53,bg=53   # fg=#392551,bg=#392551
  ble-face -s vim_airline_a_insert                     fg=53,bg=168  # fg=#392551,bg=#c33678
  ble-face -s vim_airline_a_replace                    fg=53,bg=89   # fg=#392551,bg=#82034c
  ble-face -s vim_airline_a_visual                     fg=53,bg=73   # fg=#392551,bg=#5ba2b6
  ble-face -s vim_airline_b                            fg=139,bg=240 # fg=#9c92a8,bg=#5a496e
  ble-face -s vim_airline_b_inactive                   fg=139,bg=53  # fg=#9c92a8,bg=#392551
  ble-face -s vim_airline_c                            fg=139,bg=53  # fg=#9c92a8,bg=#392551
  ble-face -s vim_airline_c_inactive                   fg=146,bg=53  # fg=#bdb6c5,bg=#392551
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=53  # fg=#feffff,bg=#392551
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=53  # fg=#feffff,bg=#392551
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=53  # fg=#feffff,bg=#392551
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=53  # fg=#feffff,bg=#392551
}
