# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_papercolor_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 PaperColor Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jon Leopard (http://github.com/jonleopard) based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_papercolor_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=125,bg=74  # fg=#af005f,bg=#5fafd7
  ble-face -s vim_airline_a_inactive                   fg=125,bg=125 # fg=#af005f,bg=#af005f
  ble-face -s vim_airline_a_insert                     fg=125,bg=140 # fg=#af005f,bg=#af87d7
  ble-face -s vim_airline_a_replace                    fg=125,bg=37  # fg=#af005f,bg=#00afaf
  ble-face -s vim_airline_a_visual                     fg=125,bg=71  # fg=#af005f,bg=#5faf5f
  ble-face -s vim_airline_b                            fg=74,bg=70   # fg=#5fafd7,bg=#5faf00
  ble-face -s vim_airline_b_inactive                   fg=74,bg=125  # fg=#5fafd7,bg=#af005f
  ble-face -s vim_airline_c                            fg=74,bg=125  # fg=#5fafd7,bg=#af005f
  ble-face -s vim_airline_c_inactive                   fg=244,bg=125 # fg=#808080,bg=#af005f
  ble-face -s vim_airline_c_insert_modified            fg=252,bg=125 # fg=#d0d0d0,bg=#af005f
  ble-face -s vim_airline_c_normal_modified            fg=252,bg=125 # fg=#d0d0d0,bg=#af005f
  ble-face -s vim_airline_c_replace_modified           fg=252,bg=125 # fg=#d0d0d0,bg=#af005f
  ble-face -s vim_airline_c_visual_modified            fg=252,bg=125 # fg=#d0d0d0,bg=#af005f
}
