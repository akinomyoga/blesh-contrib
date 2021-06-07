# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_classic_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Classic Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jason Heeris (http://heeris.id.au)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_classic_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=149 # fg=#202020,bg=#b0b0b0
  ble-face -s vim_airline_a_inactive                   fg=234,bg=234 # fg=#202020,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=107 # fg=#202020,bg=#90a959
  ble-face -s vim_airline_a_replace                    fg=234,bg=139 # fg=#202020,bg=#aa759f
  ble-face -s vim_airline_a_visual                     fg=234,bg=173 # fg=#202020,bg=#d28445
  ble-face -s vim_airline_b                            fg=149,bg=236 # fg=#b0b0b0,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=149,bg=234 # fg=#b0b0b0,bg=#202020
  ble-face -s vim_airline_c                            fg=149,bg=234 # fg=#b0b0b0,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=234 # fg=#f5f5f5,bg=#202020
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=234 # fg=#f5f5f5,bg=#202020
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=234 # fg=#f5f5f5,bg=#202020
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=234 # fg=#f5f5f5,bg=#202020
}
