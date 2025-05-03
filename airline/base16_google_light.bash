# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_google_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Google Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Seth Wright (http://sethawright.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_google_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=246 # fg=#e0e0e0,bg=#969896
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e0e0e0,bg=#e0e0e0
  ble-face -s vim_airline_a_insert                     fg=254,bg=29  # fg=#e0e0e0,bg=#198844
  ble-face -s vim_airline_a_replace                    fg=254,bg=134 # fg=#e0e0e0,bg=#a36ac7
  ble-face -s vim_airline_a_visual                     fg=254,bg=203 # fg=#e0e0e0,bg=#f96a38
  ble-face -s vim_airline_b                            fg=246,bg=251 # fg=#969896,bg=#c5c8c6
  ble-face -s vim_airline_b_inactive                   fg=246,bg=254 # fg=#969896,bg=#e0e0e0
  ble-face -s vim_airline_c                            fg=246,bg=254 # fg=#969896,bg=#e0e0e0
  ble-face -s vim_airline_c_inactive                   fg=237,bg=254 # fg=#373b41,bg=#e0e0e0
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#1d1f21,bg=#e0e0e0
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#1d1f21,bg=#e0e0e0
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#1d1f21,bg=#e0e0e0
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#1d1f21,bg=#e0e0e0
}
