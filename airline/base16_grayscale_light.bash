# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_grayscale_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Grayscale Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Alexandre Gavioli (https://github.com/Alexx2/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_grayscale_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=239 # fg=#e3e3e3,bg=#525252
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e3e3e3,bg=#e3e3e3
  ble-face -s vim_airline_a_insert                     fg=254,bg=245 # fg=#e3e3e3,bg=#8e8e8e
  ble-face -s vim_airline_a_replace                    fg=254,bg=243 # fg=#e3e3e3,bg=#747474
  ble-face -s vim_airline_a_visual                     fg=254,bg=247 # fg=#e3e3e3,bg=#999999
  ble-face -s vim_airline_b                            fg=239,bg=250 # fg=#525252,bg=#b9b9b9
  ble-face -s vim_airline_b_inactive                   fg=239,bg=254 # fg=#525252,bg=#e3e3e3
  ble-face -s vim_airline_c                            fg=239,bg=254 # fg=#525252,bg=#e3e3e3
  ble-face -s vim_airline_c_inactive                   fg=238,bg=254 # fg=#464646,bg=#e3e3e3
  ble-face -s vim_airline_c_insert_modified            fg=233,bg=254 # fg=#101010,bg=#e3e3e3
  ble-face -s vim_airline_c_normal_modified            fg=233,bg=254 # fg=#101010,bg=#e3e3e3
  ble-face -s vim_airline_c_replace_modified           fg=233,bg=254 # fg=#101010,bg=#e3e3e3
  ble-face -s vim_airline_c_visual_modified            fg=233,bg=254 # fg=#101010,bg=#e3e3e3
}
