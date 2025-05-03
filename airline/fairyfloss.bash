# From github:vim-airline/vim-airline-themes/autoload/airline/themes/fairyfloss.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Color palette

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:fairyfloss/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=141 # fg=#f8f8f0,bg=#ae81ff
  ble-face -s vim_airline_a_inactive                   fg=103,bg=238 # fg=#8076aa,bg=#49483e
  ble-face -s vim_airline_a_insert                     fg=238,bg=121 # fg=#49483e,bg=#80ffbd
  ble-face -s vim_airline_a_replace                    fg=197,bg=238 # fg=#f92672,bg=#49483e
  ble-face -s vim_airline_a_visual                     fg=255,bg=197 # fg=#f8f8f0,bg=#f92672
  ble-face -s vim_airline_b                            fg=255,bg=238 # fg=#f8f8f0,bg=#49483e
  ble-face -s vim_airline_b_inactive                   fg=103,bg=237 # fg=#8076aa,bg=#3b3a32
  ble-face -s vim_airline_c                            fg=237,bg=141 # fg=#3b3a32,bg=#ae81ff
  ble-face -s vim_airline_c_inactive                   fg=103,bg=237 # fg=#8076aa,bg=#3b3a32
  ble-face -s vim_airline_c_inactive_modified          fg=218,bg=16  # fg=#ffb8d1,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=255,bg=238 # fg=#f8f8f0,bg=#49483e
  ble-face -s vim_airline_c_insert_modified            fg=218,bg=16  # fg=#ffb8d1,bg=#000000
  ble-face -s vim_airline_c_normal_modified            fg=218,bg=16  # fg=#ffb8d1,bg=#000000
  ble-face -s vim_airline_c_replace_modified           fg=218,bg=16  # fg=#ffb8d1,bg=#000000
  ble-face -s vim_airline_c_visual                     fg=255,bg=238 # fg=#f8f8f0,bg=#49483e
  ble-face -s vim_airline_c_visual_modified            fg=218,bg=16  # fg=#ffb8d1,bg=#000000
}
