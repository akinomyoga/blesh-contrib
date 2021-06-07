# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_edge_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Edge Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Sainnhepark (https://github.com/sainnhe)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_edge_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=107,bg=67  # fg=#7c9f4b,bg=#6587bf
  ble-face -s vim_airline_a_inactive                   fg=107,bg=107 # fg=#7c9f4b,bg=#7c9f4b
  ble-face -s vim_airline_a_insert                     fg=107,bg=107 # fg=#7c9f4b,bg=#7c9f4b
  ble-face -s vim_airline_a_replace                    fg=107,bg=134 # fg=#7c9f4b,bg=#b870ce
  ble-face -s vim_airline_a_visual                     fg=107,bg=167 # fg=#7c9f4b,bg=#db7070
  ble-face -s vim_airline_b                            fg=67,bg=172  # fg=#6587bf,bg=#d69822
  ble-face -s vim_airline_b_inactive                   fg=67,bg=107  # fg=#6587bf,bg=#7c9f4b
  ble-face -s vim_airline_c                            fg=67,bg=107  # fg=#6587bf,bg=#7c9f4b
  ble-face -s vim_airline_c_inactive                   fg=241,bg=107 # fg=#5e646f,bg=#7c9f4b
  ble-face -s vim_airline_c_insert_modified            fg=241,bg=107 # fg=#5e646f,bg=#7c9f4b
  ble-face -s vim_airline_c_normal_modified            fg=241,bg=107 # fg=#5e646f,bg=#7c9f4b
  ble-face -s vim_airline_c_replace_modified           fg=241,bg=107 # fg=#5e646f,bg=#7c9f4b
  ble-face -s vim_airline_c_visual_modified            fg=241,bg=107 # fg=#5e646f,bg=#7c9f4b
}
