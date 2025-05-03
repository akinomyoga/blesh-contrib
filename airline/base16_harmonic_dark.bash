# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_harmonic_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Harmonic16 Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_harmonic_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=146  # fg=#223b54,bg=#aabcce
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#223b54,bg=#223b54
  ble-face -s vim_airline_a_insert                     fg=23,bg=72   # fg=#223b54,bg=#56bf8b
  ble-face -s vim_airline_a_replace                    fg=23,bg=132  # fg=#223b54,bg=#bf568b
  ble-face -s vim_airline_a_visual                     fg=23,bg=143  # fg=#223b54,bg=#bfbf56
  ble-face -s vim_airline_b                            fg=146,bg=60  # fg=#aabcce,bg=#405c79
  ble-face -s vim_airline_b_inactive                   fg=146,bg=23  # fg=#aabcce,bg=#223b54
  ble-face -s vim_airline_c                            fg=146,bg=23  # fg=#aabcce,bg=#223b54
  ble-face -s vim_airline_c_inactive                   fg=190,bg=23  # fg=#cbd6e2,bg=#223b54
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#f7f9fb,bg=#223b54
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#f7f9fb,bg=#223b54
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#f7f9fb,bg=#223b54
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#f7f9fb,bg=#223b54
}
