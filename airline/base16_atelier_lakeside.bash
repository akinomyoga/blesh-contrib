# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_lakeside.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Lakeside vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_lakeside/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=67  # fg=#1f292e,bg=#7195a8
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#1f292e,bg=#1f292e
  ble-face -s vim_airline_a_insert                     fg=235,bg=65  # fg=#1f292e,bg=#568c3b
  ble-face -s vim_airline_a_replace                    fg=235,bg=61  # fg=#1f292e,bg=#6b6bb8
  ble-face -s vim_airline_a_visual                     fg=235,bg=94  # fg=#1f292e,bg=#935c25
  ble-face -s vim_airline_b                            fg=67,bg=60   # fg=#7195a8,bg=#516d7b
  ble-face -s vim_airline_b_inactive                   fg=67,bg=235  # fg=#7195a8,bg=#1f292e
  ble-face -s vim_airline_c                            fg=67,bg=235  # fg=#7195a8,bg=#1f292e
  ble-face -s vim_airline_c_inactive                   fg=109,bg=235 # fg=#7ea2b4,bg=#1f292e
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#ebf8ff,bg=#1f292e
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#ebf8ff,bg=#1f292e
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#ebf8ff,bg=#1f292e
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#ebf8ff,bg=#1f292e
}
