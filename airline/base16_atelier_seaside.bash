# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_seaside.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Seaside vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_seaside/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=106 # fg=#242924,bg=#809980
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#242924,bg=#242924
  ble-face -s vim_airline_a_insert                     fg=235,bg=34  # fg=#242924,bg=#29a329
  ble-face -s vim_airline_a_replace                    fg=235,bg=129 # fg=#242924,bg=#ad2bee
  ble-face -s vim_airline_a_visual                     fg=235,bg=94  # fg=#242924,bg=#87711d
  ble-face -s vim_airline_b                            fg=106,bg=241 # fg=#809980,bg=#5e6e5e
  ble-face -s vim_airline_b_inactive                   fg=106,bg=235 # fg=#809980,bg=#242924
  ble-face -s vim_airline_c                            fg=106,bg=235 # fg=#809980,bg=#242924
  ble-face -s vim_airline_c_inactive                   fg=108,bg=235 # fg=#8ca68c,bg=#242924
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#f4fbf4,bg=#242924
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#f4fbf4,bg=#242924
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#f4fbf4,bg=#242924
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#f4fbf4,bg=#242924
}
