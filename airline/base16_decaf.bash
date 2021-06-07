# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_decaf.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Decaf vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Alex Mirrington (https://github.com/alexmirrington)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_decaf/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=249 # fg=#393939,bg=#b4b7b4
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#393939,bg=#393939
  ble-face -s vim_airline_a_insert                     fg=237,bg=150 # fg=#393939,bg=#beda78
  ble-face -s vim_airline_a_replace                    fg=237,bg=219 # fg=#393939,bg=#efb3f7
  ble-face -s vim_airline_a_visual                     fg=237,bg=215 # fg=#393939,bg=#ffbf70
  ble-face -s vim_airline_b                            fg=249,bg=239 # fg=#b4b7b4,bg=#515151
  ble-face -s vim_airline_b_inactive                   fg=249,bg=237 # fg=#b4b7b4,bg=#393939
  ble-face -s vim_airline_c                            fg=249,bg=237 # fg=#b4b7b4,bg=#393939
  ble-face -s vim_airline_c_inactive                   fg=252,bg=237 # fg=#cccccc,bg=#393939
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=237 # fg=#ffffff,bg=#393939
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=237 # fg=#ffffff,bg=#393939
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=237 # fg=#ffffff,bg=#393939
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=237 # fg=#ffffff,bg=#393939
}
