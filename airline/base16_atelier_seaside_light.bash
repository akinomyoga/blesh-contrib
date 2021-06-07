# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_seaside_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Seaside Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_seaside_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=191,bg=65  # fg=#cfe8cf,bg=#687d68
  ble-face -s vim_airline_a_inactive                   fg=191,bg=191 # fg=#cfe8cf,bg=#cfe8cf
  ble-face -s vim_airline_a_insert                     fg=191,bg=34  # fg=#cfe8cf,bg=#29a329
  ble-face -s vim_airline_a_replace                    fg=191,bg=129 # fg=#cfe8cf,bg=#ad2bee
  ble-face -s vim_airline_a_visual                     fg=191,bg=94  # fg=#cfe8cf,bg=#87711d
  ble-face -s vim_airline_b                            fg=65,bg=108  # fg=#687d68,bg=#8ca68c
  ble-face -s vim_airline_b_inactive                   fg=65,bg=191  # fg=#687d68,bg=#cfe8cf
  ble-face -s vim_airline_c                            fg=65,bg=191  # fg=#687d68,bg=#cfe8cf
  ble-face -s vim_airline_c_inactive                   fg=241,bg=191 # fg=#5e6e5e,bg=#cfe8cf
  ble-face -s vim_airline_c_insert_modified            fg=233,bg=191 # fg=#131513,bg=#cfe8cf
  ble-face -s vim_airline_c_normal_modified            fg=233,bg=191 # fg=#131513,bg=#cfe8cf
  ble-face -s vim_airline_c_replace_modified           fg=233,bg=191 # fg=#131513,bg=#cfe8cf
  ble-face -s vim_airline_c_visual_modified            fg=233,bg=191 # fg=#131513,bg=#cfe8cf
}
