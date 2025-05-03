# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_papercolor_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 PaperColor Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jon Leopard (http://github.com/jonleopard) based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_papercolor_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=124,bg=31  # fg=#af0000,bg=#0087af
  ble-face -s vim_airline_a_inactive                   fg=124,bg=124 # fg=#af0000,bg=#af0000
  ble-face -s vim_airline_a_insert                     fg=124,bg=91  # fg=#af0000,bg=#8700af
  ble-face -s vim_airline_a_replace                    fg=124,bg=25  # fg=#af0000,bg=#005faf
  ble-face -s vim_airline_a_visual                     fg=124,bg=160 # fg=#af0000,bg=#d70000
  ble-face -s vim_airline_b                            fg=31,bg=28   # fg=#0087af,bg=#008700
  ble-face -s vim_airline_b_inactive                   fg=31,bg=124  # fg=#0087af,bg=#af0000
  ble-face -s vim_airline_c                            fg=31,bg=124  # fg=#0087af,bg=#af0000
  ble-face -s vim_airline_c_inactive                   fg=105,bg=124 # fg=#878787,bg=#af0000
  ble-face -s vim_airline_c_insert_modified            fg=238,bg=124 # fg=#444444,bg=#af0000
  ble-face -s vim_airline_c_normal_modified            fg=238,bg=124 # fg=#444444,bg=#af0000
  ble-face -s vim_airline_c_replace_modified           fg=238,bg=124 # fg=#444444,bg=#af0000
  ble-face -s vim_airline_c_visual_modified            fg=238,bg=124 # fg=#444444,bg=#af0000
}
