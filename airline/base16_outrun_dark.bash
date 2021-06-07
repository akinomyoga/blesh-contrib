# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_outrun_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Outrun Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Hugo Delahousse (http://github.com/hugodelahousse/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_outrun_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=146  # fg=#20204a,bg=#b0b0da
  ble-face -s vim_airline_a_inactive                   fg=17,bg=17   # fg=#20204a,bg=#20204a
  ble-face -s vim_airline_a_insert                     fg=17,bg=84   # fg=#20204a,bg=#59f176
  ble-face -s vim_airline_a_replace                    fg=17,bg=198  # fg=#20204a,bg=#f10596
  ble-face -s vim_airline_a_visual                     fg=17,bg=208  # fg=#20204a,bg=#fc8d28
  ble-face -s vim_airline_b                            fg=146,bg=237 # fg=#b0b0da,bg=#30305a
  ble-face -s vim_airline_b_inactive                   fg=146,bg=17  # fg=#b0b0da,bg=#20204a
  ble-face -s vim_airline_c                            fg=146,bg=17  # fg=#b0b0da,bg=#20204a
  ble-face -s vim_airline_c_inactive                   fg=189,bg=17  # fg=#d0d0fa,bg=#20204a
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=17  # fg=#f5f5ff,bg=#20204a
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=17  # fg=#f5f5ff,bg=#20204a
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=17  # fg=#f5f5ff,bg=#20204a
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=17  # fg=#f5f5ff,bg=#20204a
}
