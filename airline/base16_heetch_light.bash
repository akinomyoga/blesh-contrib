# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_heetch_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Heetch Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Geoffrey Teale (tealeg@gmail.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_heetch_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=53,bg=253  # fg=#392551,bg=#ddd6e5
  ble-face -s vim_airline_a_inactive                   fg=53,bg=53   # fg=#392551,bg=#392551
  ble-face -s vim_airline_a_insert                     fg=53,bg=197  # fg=#392551,bg=#f80059
  ble-face -s vim_airline_a_replace                    fg=53,bg=125  # fg=#392551,bg=#bd0152
  ble-face -s vim_airline_a_visual                     fg=53,bg=146  # fg=#392551,bg=#bdb6c5
  ble-face -s vim_airline_b                            fg=253,bg=96  # fg=#ddd6e5,bg=#7b6d8b
  ble-face -s vim_airline_b_inactive                   fg=253,bg=53  # fg=#ddd6e5,bg=#392551
  ble-face -s vim_airline_c                            fg=253,bg=53  # fg=#ddd6e5,bg=#392551
  ble-face -s vim_airline_c_inactive                   fg=240,bg=53  # fg=#5a496e,bg=#392551
  ble-face -s vim_airline_c_insert_modified            fg=17,bg=53   # fg=#190134,bg=#392551
  ble-face -s vim_airline_c_normal_modified            fg=17,bg=53   # fg=#190134,bg=#392551
  ble-face -s vim_airline_c_replace_modified           fg=17,bg=53   # fg=#190134,bg=#392551
  ble-face -s vim_airline_c_visual_modified            fg=17,bg=53   # fg=#190134,bg=#392551
}
