# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_mellow_purple.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Mellow Purple vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By gidsi

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_mellow_purple/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=96  # fg=#1a092d,bg=#873582
  ble-face -s vim_airline_a_inactive                   fg=234,bg=234 # fg=#1a092d,bg=#1a092d
  ble-face -s vim_airline_a_insert                     fg=234,bg=40  # fg=#1a092d,bg=#05cb0d
  ble-face -s vim_airline_a_replace                    fg=234,bg=103 # fg=#1a092d,bg=#8991bb
  ble-face -s vim_airline_a_visual                     fg=234,bg=127 # fg=#1a092d,bg=#aa00a3
  ble-face -s vim_airline_b                            fg=96,bg=53   # fg=#873582,bg=#331354
  ble-face -s vim_airline_b_inactive                   fg=96,bg=234  # fg=#873582,bg=#1a092d
  ble-face -s vim_airline_c                            fg=96,bg=234  # fg=#873582,bg=#1a092d
  ble-face -s vim_airline_c_inactive                   fg=231,bg=234 # fg=#ffeeff,bg=#1a092d
  ble-face -s vim_airline_c_insert_modified            fg=219,bg=234 # fg=#f8c0ff,bg=#1a092d
  ble-face -s vim_airline_c_normal_modified            fg=219,bg=234 # fg=#f8c0ff,bg=#1a092d
  ble-face -s vim_airline_c_replace_modified           fg=219,bg=234 # fg=#f8c0ff,bg=#1a092d
  ble-face -s vim_airline_c_visual_modified            fg=219,bg=234 # fg=#f8c0ff,bg=#1a092d
}
