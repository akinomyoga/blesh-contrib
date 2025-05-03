# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_black_metal_venom.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Black Metal (Venom) vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By metalelf0 (https://github.com/metalelf0)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_black_metal_venom/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=247 # fg=#121212,bg=#999999
  ble-face -s vim_airline_a_inactive                   fg=233,bg=233 # fg=#121212,bg=#121212
  ble-face -s vim_airline_a_insert                     fg=233,bg=255 # fg=#121212,bg=#f8f7f2
  ble-face -s vim_airline_a_replace                    fg=233,bg=247 # fg=#121212,bg=#999999
  ble-face -s vim_airline_a_visual                     fg=233,bg=248 # fg=#121212,bg=#aaaaaa
  ble-face -s vim_airline_b                            fg=247,bg=235 # fg=#999999,bg=#222222
  ble-face -s vim_airline_b_inactive                   fg=247,bg=233 # fg=#999999,bg=#121212
  ble-face -s vim_airline_c                            fg=247,bg=233 # fg=#999999,bg=#121212
  ble-face -s vim_airline_c_inactive                   fg=251,bg=233 # fg=#c1c1c1,bg=#121212
  ble-face -s vim_airline_c_insert_modified            fg=251,bg=233 # fg=#c1c1c1,bg=#121212
  ble-face -s vim_airline_c_normal_modified            fg=251,bg=233 # fg=#c1c1c1,bg=#121212
  ble-face -s vim_airline_c_replace_modified           fg=251,bg=233 # fg=#c1c1c1,bg=#121212
  ble-face -s vim_airline_c_visual_modified            fg=251,bg=233 # fg=#c1c1c1,bg=#121212
}
