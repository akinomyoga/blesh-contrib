# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_horizon_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Horizon Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Michaël Ball (http://github.com/michael-ball/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_horizon_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=224,bg=245 # fg=#fadad1,bg=#948c8a
  ble-face -s vim_airline_a_inactive                   fg=224,bg=224 # fg=#fadad1,bg=#fadad1
  ble-face -s vim_airline_a_insert                     fg=224,bg=115 # fg=#fadad1,bg=#94e1b0
  ble-face -s vim_airline_a_replace                    fg=224,bg=30  # fg=#fadad1,bg=#1d8991
  ble-face -s vim_airline_a_visual                     fg=224,bg=202 # fg=#fadad1,bg=#f6661e
  ble-face -s vim_airline_b                            fg=245,bg=223 # fg=#948c8a,bg=#f9cbbe
  ble-face -s vim_airline_b_inactive                   fg=245,bg=224 # fg=#948c8a,bg=#fadad1
  ble-face -s vim_airline_c                            fg=245,bg=224 # fg=#948c8a,bg=#fadad1
  ble-face -s vim_airline_c_inactive                   fg=237,bg=224 # fg=#403c3d,bg=#fadad1
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=224 # fg=#201c1d,bg=#fadad1
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=224 # fg=#201c1d,bg=#fadad1
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=224 # fg=#201c1d,bg=#fadad1
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=224 # fg=#201c1d,bg=#fadad1
}
