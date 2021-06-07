# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_material_palenight.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Material Palenight vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Nate Peterson

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_material_palenight/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=239,bg=103 # fg=#444267,bg=#8796b0
  ble-face -s vim_airline_a_inactive                   fg=239,bg=239 # fg=#444267,bg=#444267
  ble-face -s vim_airline_a_insert                     fg=239,bg=186 # fg=#444267,bg=#c3e88d
  ble-face -s vim_airline_a_replace                    fg=239,bg=176 # fg=#444267,bg=#c792ea
  ble-face -s vim_airline_a_visual                     fg=239,bg=209 # fg=#444267,bg=#f78c6c
  ble-face -s vim_airline_b                            fg=103,bg=237 # fg=#8796b0,bg=#32374d
  ble-face -s vim_airline_b_inactive                   fg=103,bg=239 # fg=#8796b0,bg=#444267
  ble-face -s vim_airline_c                            fg=103,bg=239 # fg=#8796b0,bg=#444267
  ble-face -s vim_airline_c_inactive                   fg=110,bg=239 # fg=#959dcb,bg=#444267
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=239 # fg=#ffffff,bg=#444267
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=239 # fg=#ffffff,bg=#444267
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=239 # fg=#ffffff,bg=#444267
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=239 # fg=#ffffff,bg=#444267
}
