# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_woodland.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Woodland vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jay Cornwall (https://jcornwall.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_woodland/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=52,bg=144  # fg=#302b25,bg=#b4a490
  ble-face -s vim_airline_a_inactive                   fg=52,bg=52   # fg=#302b25,bg=#302b25
  ble-face -s vim_airline_a_insert                     fg=52,bg=143  # fg=#302b25,bg=#b7ba53
  ble-face -s vim_airline_a_replace                    fg=52,bg=140  # fg=#302b25,bg=#bb90e2
  ble-face -s vim_airline_a_visual                     fg=52,bg=173  # fg=#302b25,bg=#ca7f32
  ble-face -s vim_airline_b                            fg=144,bg=238 # fg=#b4a490,bg=#48413a
  ble-face -s vim_airline_b_inactive                   fg=144,bg=52  # fg=#b4a490,bg=#302b25
  ble-face -s vim_airline_c                            fg=144,bg=52  # fg=#b4a490,bg=#302b25
  ble-face -s vim_airline_c_inactive                   fg=181,bg=52  # fg=#cabcb1,bg=#302b25
  ble-face -s vim_airline_c_insert_modified            fg=189,bg=52  # fg=#e4d4c8,bg=#302b25
  ble-face -s vim_airline_c_normal_modified            fg=189,bg=52  # fg=#e4d4c8,bg=#302b25
  ble-face -s vim_airline_c_replace_modified           fg=189,bg=52  # fg=#e4d4c8,bg=#302b25
  ble-face -s vim_airline_c_visual_modified            fg=189,bg=52  # fg=#e4d4c8,bg=#302b25
}
