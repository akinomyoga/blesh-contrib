# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_cupertino.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Cupertino vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Defman21

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_cupertino/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=250,bg=244 # fg=#c0c0c0,bg=#808080
  ble-face -s vim_airline_a_inactive                   fg=250,bg=250 # fg=#c0c0c0,bg=#c0c0c0
  ble-face -s vim_airline_a_insert                     fg=250,bg=28  # fg=#c0c0c0,bg=#007400
  ble-face -s vim_airline_a_replace                    fg=250,bg=126 # fg=#c0c0c0,bg=#a90d91
  ble-face -s vim_airline_a_visual                     fg=250,bg=208 # fg=#c0c0c0,bg=#eb8500
  ble-face -s vim_airline_b                            fg=244,bg=250 # fg=#808080,bg=#c0c0c0
  ble-face -s vim_airline_c                            fg=244,bg=250 # fg=#808080,bg=#c0c0c0
  ble-face -s vim_airline_c_inactive                   fg=238,bg=250 # fg=#404040,bg=#c0c0c0
  ble-face -s vim_airline_c_insert_modified            fg=61,bg=250  # fg=#5e5e5e,bg=#c0c0c0
  ble-face -s vim_airline_c_normal_modified            fg=61,bg=250  # fg=#5e5e5e,bg=#c0c0c0
  ble-face -s vim_airline_c_replace_modified           fg=61,bg=250  # fg=#5e5e5e,bg=#c0c0c0
  ble-face -s vim_airline_c_visual_modified            fg=61,bg=250  # fg=#5e5e5e,bg=#c0c0c0
}
