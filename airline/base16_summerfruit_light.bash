# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_summerfruit_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Summerfruit Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Christopher Corley (http://christop.club/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_summerfruit_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=16  # fg=#e0e0e0,bg=#000000
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e0e0e0,bg=#e0e0e0
  ble-face -s vim_airline_a_insert                     fg=254,bg=40  # fg=#e0e0e0,bg=#00c918
  ble-face -s vim_airline_a_replace                    fg=254,bg=127 # fg=#e0e0e0,bg=#ad00a1
  ble-face -s vim_airline_a_visual                     fg=254,bg=208 # fg=#e0e0e0,bg=#fd8900
  ble-face -s vim_airline_b                            fg=16,bg=252  # fg=#000000,bg=#d0d0d0
  ble-face -s vim_airline_b_inactive                   fg=16,bg=254  # fg=#000000,bg=#e0e0e0
  ble-face -s vim_airline_c                            fg=16,bg=254  # fg=#000000,bg=#e0e0e0
  ble-face -s vim_airline_c_inactive                   fg=233,bg=254 # fg=#101010,bg=#e0e0e0
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#202020,bg=#e0e0e0
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#202020,bg=#e0e0e0
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#202020,bg=#e0e0e0
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#202020,bg=#e0e0e0
}
