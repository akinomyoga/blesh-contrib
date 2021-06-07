# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_xcode_dusk.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 XCode Dusk vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Elsa Gonsiorowski (https://github.com/gonsie)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_xcode_dusk/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=244 # fg=#3d4048,bg=#7e8086
  ble-face -s vim_airline_a_inactive                   fg=238,bg=238 # fg=#3d4048,bg=#3d4048
  ble-face -s vim_airline_a_insert                     fg=238,bg=160 # fg=#3d4048,bg=#df0002
  ble-face -s vim_airline_a_replace                    fg=238,bg=126 # fg=#3d4048,bg=#b21889
  ble-face -s vim_airline_a_visual                     fg=238,bg=98  # fg=#3d4048,bg=#786dc5
  ble-face -s vim_airline_b                            fg=244,bg=240 # fg=#7e8086,bg=#53555d
  ble-face -s vim_airline_b_inactive                   fg=244,bg=238 # fg=#7e8086,bg=#3d4048
  ble-face -s vim_airline_c                            fg=244,bg=238 # fg=#7e8086,bg=#3d4048
  ble-face -s vim_airline_c_inactive                   fg=246,bg=238 # fg=#939599,bg=#3d4048
  ble-face -s vim_airline_c_insert_modified            fg=250,bg=238 # fg=#bebfc2,bg=#3d4048
  ble-face -s vim_airline_c_normal_modified            fg=250,bg=238 # fg=#bebfc2,bg=#3d4048
  ble-face -s vim_airline_c_replace_modified           fg=250,bg=238 # fg=#bebfc2,bg=#3d4048
  ble-face -s vim_airline_c_visual_modified            fg=250,bg=238 # fg=#bebfc2,bg=#3d4048
}
