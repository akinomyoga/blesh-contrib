# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atlas.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atlas vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Alex Lende (https://ajlende.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atlas/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=246  # fg=#00384d,bg=#869696
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#00384d,bg=#00384d
  ble-face -s vim_airline_a_insert                     fg=23,bg=107  # fg=#00384d,bg=#7fc06e
  ble-face -s vim_airline_a_replace                    fg=23,bg=97   # fg=#00384d,bg=#9a70a4
  ble-face -s vim_airline_a_visual                     fg=23,bg=209  # fg=#00384d,bg=#f08e48
  ble-face -s vim_airline_b                            fg=246,bg=66  # fg=#869696,bg=#517f8d
  ble-face -s vim_airline_b_inactive                   fg=246,bg=23  # fg=#869696,bg=#00384d
  ble-face -s vim_airline_c                            fg=246,bg=23  # fg=#869696,bg=#00384d
  ble-face -s vim_airline_c_inactive                   fg=144,bg=23  # fg=#a1a19a,bg=#00384d
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#fafaf8,bg=#00384d
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#fafaf8,bg=#00384d
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#fafaf8,bg=#00384d
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#fafaf8,bg=#00384d
}
