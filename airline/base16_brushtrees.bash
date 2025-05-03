# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_brushtrees.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Brush Trees vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Abraham White &lt;abelincoln.white@gmail.com&gt;

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_brushtrees/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=189,bg=103 # fg=#c9dbdc,bg=#8299a1
  ble-face -s vim_airline_a_inactive                   fg=189,bg=189 # fg=#c9dbdc,bg=#c9dbdc
  ble-face -s vim_airline_a_insert                     fg=189,bg=108 # fg=#c9dbdc,bg=#87b386
  ble-face -s vim_airline_a_replace                    fg=189,bg=139 # fg=#c9dbdc,bg=#b386b2
  ble-face -s vim_airline_a_visual                     fg=189,bg=181 # fg=#c9dbdc,bg=#d8bba2
  ble-face -s vim_airline_b                            fg=103,bg=152 # fg=#8299a1,bg=#b0c5c8
  ble-face -s vim_airline_b_inactive                   fg=103,bg=189 # fg=#8299a1,bg=#c9dbdc
  ble-face -s vim_airline_c                            fg=103,bg=189 # fg=#8299a1,bg=#c9dbdc
  ble-face -s vim_airline_c_inactive                   fg=66,bg=189  # fg=#6d828e,bg=#c9dbdc
  ble-face -s vim_airline_c_insert_modified            fg=240,bg=189 # fg=#485867,bg=#c9dbdc
  ble-face -s vim_airline_c_normal_modified            fg=240,bg=189 # fg=#485867,bg=#c9dbdc
  ble-face -s vim_airline_c_replace_modified           fg=240,bg=189 # fg=#485867,bg=#c9dbdc
  ble-face -s vim_airline_c_visual_modified            fg=240,bg=189 # fg=#485867,bg=#c9dbdc
}
