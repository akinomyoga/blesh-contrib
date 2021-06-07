# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_ia_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 iA Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By iA Inc. (modified by aramisgithub)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_ia_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=253,bg=243 # fg=#dedede,bg=#767676
  ble-face -s vim_airline_a_inactive                   fg=253,bg=253 # fg=#dedede,bg=#dedede
  ble-face -s vim_airline_a_insert                     fg=253,bg=64  # fg=#dedede,bg=#38781c
  ble-face -s vim_airline_a_replace                    fg=253,bg=132 # fg=#dedede,bg=#a94598
  ble-face -s vim_airline_a_visual                     fg=253,bg=166 # fg=#dedede,bg=#c43e18
  ble-face -s vim_airline_b                            fg=243,bg=153 # fg=#767676,bg=#bde5f2
  ble-face -s vim_airline_b_inactive                   fg=243,bg=253 # fg=#767676,bg=#dedede
  ble-face -s vim_airline_c                            fg=243,bg=253 # fg=#767676,bg=#dedede
  ble-face -s vim_airline_c_inactive                   fg=234,bg=253 # fg=#181818,bg=#dedede
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=253 # fg=#f8f8f8,bg=#dedede
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=253 # fg=#f8f8f8,bg=#dedede
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=253 # fg=#f8f8f8,bg=#dedede
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=253 # fg=#f8f8f8,bg=#dedede
}
