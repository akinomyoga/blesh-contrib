# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_one_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 One Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Daniel Pfeifer (http://github.com/purpleKarrot)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_one_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=60  # fg=#f0f0f1,bg=#696c77
  ble-face -s vim_airline_a_inactive                   fg=255,bg=255 # fg=#f0f0f1,bg=#f0f0f1
  ble-face -s vim_airline_a_insert                     fg=255,bg=71  # fg=#f0f0f1,bg=#50a14f
  ble-face -s vim_airline_a_replace                    fg=255,bg=127 # fg=#f0f0f1,bg=#a626a4
  ble-face -s vim_airline_a_visual                     fg=255,bg=166 # fg=#f0f0f1,bg=#d75f00
  ble-face -s vim_airline_b                            fg=60,bg=254  # fg=#696c77,bg=#e5e5e6
  ble-face -s vim_airline_b_inactive                   fg=60,bg=255  # fg=#696c77,bg=#f0f0f1
  ble-face -s vim_airline_c                            fg=60,bg=255  # fg=#696c77,bg=#f0f0f1
  ble-face -s vim_airline_c_inactive                   fg=237,bg=255 # fg=#383a42,bg=#f0f0f1
  ble-face -s vim_airline_c_insert_modified            fg=232,bg=255 # fg=#090a0b,bg=#f0f0f1
  ble-face -s vim_airline_c_normal_modified            fg=232,bg=255 # fg=#090a0b,bg=#f0f0f1
  ble-face -s vim_airline_c_replace_modified           fg=232,bg=255 # fg=#090a0b,bg=#f0f0f1
  ble-face -s vim_airline_c_visual_modified            fg=232,bg=255 # fg=#090a0b,bg=#f0f0f1
}
