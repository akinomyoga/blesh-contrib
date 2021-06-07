# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_solarized_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Solarized Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Ethan Schoonover (modified by aramisgithub)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_solarized_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=224,bg=66  # fg=#eee8d5,bg=#657b83
  ble-face -s vim_airline_a_inactive                   fg=224,bg=224 # fg=#eee8d5,bg=#eee8d5
  ble-face -s vim_airline_a_insert                     fg=224,bg=100 # fg=#eee8d5,bg=#859900
  ble-face -s vim_airline_a_replace                    fg=224,bg=62  # fg=#eee8d5,bg=#6c71c4
  ble-face -s vim_airline_a_visual                     fg=224,bg=166 # fg=#eee8d5,bg=#cb4b16
  ble-face -s vim_airline_b                            fg=66,bg=109  # fg=#657b83,bg=#93a1a1
  ble-face -s vim_airline_b_inactive                   fg=66,bg=224  # fg=#657b83,bg=#eee8d5
  ble-face -s vim_airline_c                            fg=66,bg=224  # fg=#657b83,bg=#eee8d5
  ble-face -s vim_airline_c_inactive                   fg=60,bg=224  # fg=#586e75,bg=#eee8d5
  ble-face -s vim_airline_c_insert_modified            fg=17,bg=224  # fg=#002b36,bg=#eee8d5
  ble-face -s vim_airline_c_normal_modified            fg=17,bg=224  # fg=#002b36,bg=#eee8d5
  ble-face -s vim_airline_c_replace_modified           fg=17,bg=224  # fg=#002b36,bg=#eee8d5
  ble-face -s vim_airline_c_visual_modified            fg=17,bg=224  # fg=#002b36,bg=#eee8d5
}
