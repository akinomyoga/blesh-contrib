# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_unikitty_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Unikitty Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Josh W Lewis (@joshwlewis)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_unikitty_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=239,bg=247 # fg=#4a464d,bg=#9f9da2
  ble-face -s vim_airline_a_inactive                   fg=239,bg=239 # fg=#4a464d,bg=#4a464d
  ble-face -s vim_airline_a_insert                     fg=239,bg=36  # fg=#4a464d,bg=#17ad98
  ble-face -s vim_airline_a_replace                    fg=239,bg=134 # fg=#4a464d,bg=#bb60ea
  ble-face -s vim_airline_a_visual                     fg=239,bg=166 # fg=#4a464d,bg=#d65407
  ble-face -s vim_airline_b                            fg=247,bg=241 # fg=#9f9da2,bg=#666369
  ble-face -s vim_airline_b_inactive                   fg=247,bg=239 # fg=#9f9da2,bg=#4a464d
  ble-face -s vim_airline_c                            fg=247,bg=239 # fg=#9f9da2,bg=#4a464d
  ble-face -s vim_airline_c_inactive                   fg=250,bg=239 # fg=#bcbabe,bg=#4a464d
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=239 # fg=#f5f4f7,bg=#4a464d
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=239 # fg=#f5f4f7,bg=#4a464d
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=239 # fg=#f5f4f7,bg=#4a464d
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=239 # fg=#f5f4f7,bg=#4a464d
}
