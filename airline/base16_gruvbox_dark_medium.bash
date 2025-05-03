# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_gruvbox_dark_medium.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Gruvbox dark, medium vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_gruvbox_dark_medium/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=144 # fg=#3c3836,bg=#bdae93
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#3c3836,bg=#3c3836
  ble-face -s vim_airline_a_insert                     fg=237,bg=142 # fg=#3c3836,bg=#b8bb26
  ble-face -s vim_airline_a_replace                    fg=237,bg=175 # fg=#3c3836,bg=#d3869b
  ble-face -s vim_airline_a_visual                     fg=237,bg=208 # fg=#3c3836,bg=#fe8019
  ble-face -s vim_airline_b                            fg=144,bg=239 # fg=#bdae93,bg=#504945
  ble-face -s vim_airline_b_inactive                   fg=144,bg=237 # fg=#bdae93,bg=#3c3836
  ble-face -s vim_airline_c                            fg=144,bg=237 # fg=#bdae93,bg=#3c3836
  ble-face -s vim_airline_c_inactive                   fg=187,bg=237 # fg=#d5c4a1,bg=#3c3836
  ble-face -s vim_airline_c_insert_modified            fg=230,bg=237 # fg=#fbf1c7,bg=#3c3836
  ble-face -s vim_airline_c_normal_modified            fg=230,bg=237 # fg=#fbf1c7,bg=#3c3836
  ble-face -s vim_airline_c_replace_modified           fg=230,bg=237 # fg=#fbf1c7,bg=#3c3836
  ble-face -s vim_airline_c_visual_modified            fg=230,bg=237 # fg=#fbf1c7,bg=#3c3836
}
