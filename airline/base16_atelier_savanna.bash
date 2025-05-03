# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_savanna.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Savanna vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_savanna/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=244 # fg=#232a25,bg=#78877d
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#232a25,bg=#232a25
  ble-face -s vim_airline_a_insert                     fg=235,bg=65  # fg=#232a25,bg=#489963
  ble-face -s vim_airline_a_replace                    fg=235,bg=67  # fg=#232a25,bg=#55859b
  ble-face -s vim_airline_a_visual                     fg=235,bg=131 # fg=#232a25,bg=#9f713c
  ble-face -s vim_airline_b                            fg=244,bg=240 # fg=#78877d,bg=#526057
  ble-face -s vim_airline_b_inactive                   fg=244,bg=235 # fg=#78877d,bg=#232a25
  ble-face -s vim_airline_c                            fg=244,bg=235 # fg=#78877d,bg=#232a25
  ble-face -s vim_airline_c_inactive                   fg=245,bg=235 # fg=#87928a,bg=#232a25
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#ecf4ee,bg=#232a25
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#ecf4ee,bg=#232a25
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#ecf4ee,bg=#232a25
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#ecf4ee,bg=#232a25
}
