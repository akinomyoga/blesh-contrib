# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_forest_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Forest Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_forest_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=95  # fg=#e6e2e0,bg=#766e6b
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e6e2e0,bg=#e6e2e0
  ble-face -s vim_airline_a_insert                     fg=254,bg=100 # fg=#e6e2e0,bg=#7b9726
  ble-face -s vim_airline_a_replace                    fg=254,bg=62  # fg=#e6e2e0,bg=#6666ea
  ble-face -s vim_airline_a_visual                     fg=254,bg=166 # fg=#e6e2e0,bg=#df5320
  ble-face -s vim_airline_b                            fg=95,bg=248  # fg=#766e6b,bg=#a8a19f
  ble-face -s vim_airline_b_inactive                   fg=95,bg=254  # fg=#766e6b,bg=#e6e2e0
  ble-face -s vim_airline_c                            fg=95,bg=254  # fg=#766e6b,bg=#e6e2e0
  ble-face -s vim_airline_c_inactive                   fg=241,bg=254 # fg=#68615e,bg=#e6e2e0
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#1b1918,bg=#e6e2e0
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#1b1918,bg=#e6e2e0
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#1b1918,bg=#e6e2e0
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#1b1918,bg=#e6e2e0
}
