# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_heath.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Heath vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_heath/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=139 # fg=#292329,bg=#9e8f9e
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#292329,bg=#292329
  ble-face -s vim_airline_a_insert                     fg=235,bg=101 # fg=#292329,bg=#918b3b
  ble-face -s vim_airline_a_replace                    fg=235,bg=97  # fg=#292329,bg=#7b59c0
  ble-face -s vim_airline_a_visual                     fg=235,bg=130 # fg=#292329,bg=#a65926
  ble-face -s vim_airline_b                            fg=139,bg=241 # fg=#9e8f9e,bg=#695d69
  ble-face -s vim_airline_b_inactive                   fg=139,bg=235 # fg=#9e8f9e,bg=#292329
  ble-face -s vim_airline_c                            fg=139,bg=235 # fg=#9e8f9e,bg=#292329
  ble-face -s vim_airline_c_inactive                   fg=248,bg=235 # fg=#ab9bab,bg=#292329
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#f7f3f7,bg=#292329
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#f7f3f7,bg=#292329
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#f7f3f7,bg=#292329
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#f7f3f7,bg=#292329
}
