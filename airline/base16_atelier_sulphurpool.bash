# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_sulphurpool.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Sulphurpool vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_sulphurpool/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=103  # fg=#293256,bg=#898ea4
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#293256,bg=#293256
  ble-face -s vim_airline_a_insert                     fg=23,bg=137  # fg=#293256,bg=#ac9739
  ble-face -s vim_airline_a_replace                    fg=23,bg=68   # fg=#293256,bg=#6679cc
  ble-face -s vim_airline_a_visual                     fg=23,bg=166  # fg=#293256,bg=#c76b29
  ble-face -s vim_airline_b                            fg=103,bg=60  # fg=#898ea4,bg=#5e6687
  ble-face -s vim_airline_b_inactive                   fg=103,bg=23  # fg=#898ea4,bg=#293256
  ble-face -s vim_airline_c                            fg=103,bg=23  # fg=#898ea4,bg=#293256
  ble-face -s vim_airline_c_inactive                   fg=109,bg=23  # fg=#979db4,bg=#293256
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#f5f7ff,bg=#293256
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#f5f7ff,bg=#293256
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#f5f7ff,bg=#293256
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#f5f7ff,bg=#293256
}
