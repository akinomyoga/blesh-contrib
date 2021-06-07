# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_onedark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 OneDark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Lalit Magant (http://github.com/tilal6991)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_onedark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=60  # fg=#353b45,bg=#565c64
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#353b45,bg=#353b45
  ble-face -s vim_airline_a_insert                     fg=237,bg=114 # fg=#353b45,bg=#98c379
  ble-face -s vim_airline_a_replace                    fg=237,bg=176 # fg=#353b45,bg=#c678dd
  ble-face -s vim_airline_a_visual                     fg=237,bg=173 # fg=#353b45,bg=#d19a66
  ble-face -s vim_airline_b                            fg=60,bg=238  # fg=#565c64,bg=#3e4451
  ble-face -s vim_airline_b_inactive                   fg=60,bg=237  # fg=#565c64,bg=#353b45
  ble-face -s vim_airline_c                            fg=60,bg=237  # fg=#565c64,bg=#353b45
  ble-face -s vim_airline_c_inactive                   fg=249,bg=237 # fg=#abb2bf,bg=#353b45
  ble-face -s vim_airline_c_insert_modified            fg=252,bg=237 # fg=#c8ccd4,bg=#353b45
  ble-face -s vim_airline_c_normal_modified            fg=252,bg=237 # fg=#c8ccd4,bg=#353b45
  ble-face -s vim_airline_c_replace_modified           fg=252,bg=237 # fg=#c8ccd4,bg=#353b45
  ble-face -s vim_airline_c_visual_modified            fg=252,bg=237 # fg=#c8ccd4,bg=#353b45
}
