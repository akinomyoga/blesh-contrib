# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_gruvbox_dark_pale.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Gruvbox dark, pale vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_gruvbox_dark_pale/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=246 # fg=#3a3a3a,bg=#949494
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#3a3a3a,bg=#3a3a3a
  ble-face -s vim_airline_a_insert                     fg=237,bg=142 # fg=#3a3a3a,bg=#afaf00
  ble-face -s vim_airline_a_replace                    fg=237,bg=175 # fg=#3a3a3a,bg=#d485ad
  ble-face -s vim_airline_a_visual                     fg=237,bg=208 # fg=#3a3a3a,bg=#ff8700
  ble-face -s vim_airline_b                            fg=246,bg=239 # fg=#949494,bg=#4e4e4e
  ble-face -s vim_airline_b_inactive                   fg=246,bg=237 # fg=#949494,bg=#3a3a3a
  ble-face -s vim_airline_c                            fg=246,bg=237 # fg=#949494,bg=#3a3a3a
  ble-face -s vim_airline_c_inactive                   fg=180,bg=237 # fg=#dab997,bg=#3a3a3a
  ble-face -s vim_airline_c_insert_modified            fg=223,bg=237 # fg=#ebdbb2,bg=#3a3a3a
  ble-face -s vim_airline_c_normal_modified            fg=223,bg=237 # fg=#ebdbb2,bg=#3a3a3a
  ble-face -s vim_airline_c_replace_modified           fg=223,bg=237 # fg=#ebdbb2,bg=#3a3a3a
  ble-face -s vim_airline_c_visual_modified            fg=223,bg=237 # fg=#ebdbb2,bg=#3a3a3a
}
