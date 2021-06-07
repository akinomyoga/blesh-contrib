# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_sulphurpool_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Sulphurpool Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_sulphurpool_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=189,bg=66  # fg=#dfe2f1,bg=#6b7394
  ble-face -s vim_airline_a_inactive                   fg=189,bg=189 # fg=#dfe2f1,bg=#dfe2f1
  ble-face -s vim_airline_a_insert                     fg=189,bg=137 # fg=#dfe2f1,bg=#ac9739
  ble-face -s vim_airline_a_replace                    fg=189,bg=68  # fg=#dfe2f1,bg=#6679cc
  ble-face -s vim_airline_a_visual                     fg=189,bg=166 # fg=#dfe2f1,bg=#c76b29
  ble-face -s vim_airline_b                            fg=66,bg=109  # fg=#6b7394,bg=#979db4
  ble-face -s vim_airline_b_inactive                   fg=66,bg=189  # fg=#6b7394,bg=#dfe2f1
  ble-face -s vim_airline_c                            fg=66,bg=189  # fg=#6b7394,bg=#dfe2f1
  ble-face -s vim_airline_c_inactive                   fg=60,bg=189  # fg=#5e6687,bg=#dfe2f1
  ble-face -s vim_airline_c_insert_modified            fg=17,bg=189  # fg=#202746,bg=#dfe2f1
  ble-face -s vim_airline_c_normal_modified            fg=17,bg=189  # fg=#202746,bg=#dfe2f1
  ble-face -s vim_airline_c_replace_modified           fg=17,bg=189  # fg=#202746,bg=#dfe2f1
  ble-face -s vim_airline_c_visual_modified            fg=17,bg=189  # fg=#202746,bg=#dfe2f1
}
