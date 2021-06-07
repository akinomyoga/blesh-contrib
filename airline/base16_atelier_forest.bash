# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_forest.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Forest vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_forest/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=138 # fg=#2c2421,bg=#9c9491
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#2c2421,bg=#2c2421
  ble-face -s vim_airline_a_insert                     fg=235,bg=100 # fg=#2c2421,bg=#7b9726
  ble-face -s vim_airline_a_replace                    fg=235,bg=62  # fg=#2c2421,bg=#6666ea
  ble-face -s vim_airline_a_visual                     fg=235,bg=166 # fg=#2c2421,bg=#df5320
  ble-face -s vim_airline_b                            fg=138,bg=241 # fg=#9c9491,bg=#68615e
  ble-face -s vim_airline_b_inactive                   fg=138,bg=235 # fg=#9c9491,bg=#2c2421
  ble-face -s vim_airline_c                            fg=138,bg=235 # fg=#9c9491,bg=#2c2421
  ble-face -s vim_airline_c_inactive                   fg=248,bg=235 # fg=#a8a19f,bg=#2c2421
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#f1efee,bg=#2c2421
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#f1efee,bg=#2c2421
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#f1efee,bg=#2c2421
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#f1efee,bg=#2c2421
}
