# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_solarized_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Solarized Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Ethan Schoonover (modified by aramisgithub)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_solarized_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=246  # fg=#073642,bg=#839496
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#073642,bg=#073642
  ble-face -s vim_airline_a_insert                     fg=23,bg=100  # fg=#073642,bg=#859900
  ble-face -s vim_airline_a_replace                    fg=23,bg=62   # fg=#073642,bg=#6c71c4
  ble-face -s vim_airline_a_visual                     fg=23,bg=166  # fg=#073642,bg=#cb4b16
  ble-face -s vim_airline_b                            fg=246,bg=60  # fg=#839496,bg=#586e75
  ble-face -s vim_airline_b_inactive                   fg=246,bg=23  # fg=#839496,bg=#073642
  ble-face -s vim_airline_c                            fg=246,bg=23  # fg=#839496,bg=#073642
  ble-face -s vim_airline_c_inactive                   fg=109,bg=23  # fg=#93a1a1,bg=#073642
  ble-face -s vim_airline_c_insert_modified            fg=230,bg=23  # fg=#fdf6e3,bg=#073642
  ble-face -s vim_airline_c_normal_modified            fg=230,bg=23  # fg=#fdf6e3,bg=#073642
  ble-face -s vim_airline_c_replace_modified           fg=230,bg=23  # fg=#fdf6e3,bg=#073642
  ble-face -s vim_airline_c_visual_modified            fg=230,bg=23  # fg=#fdf6e3,bg=#073642
}
