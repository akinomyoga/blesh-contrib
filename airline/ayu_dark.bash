# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ayu_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Normal mode
# (Dark)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ayu_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=149 # fg=#3d424d,bg=#c2d94c
  ble-face -s vim_airline_a_inactive                   fg=149,bg=233 # fg=#c2d94c,bg=#0a0e14
  ble-face -s vim_airline_a_insert                     fg=238,bg=74  # fg=#3d424d,bg=#39bae6
  ble-face -s vim_airline_a_replace                    fg=238,bg=203 # fg=#3d424d,bg=#ff3333
  ble-face -s vim_airline_a_visual                     fg=238,bg=209 # fg=#3d424d,bg=#ff8f40
  ble-face -s vim_airline_b                            fg=149,bg=238 # fg=#c2d94c,bg=#304357
  ble-face -s vim_airline_b_inactive                   fg=149,bg=233 # fg=#c2d94c,bg=#0a0e14
  ble-face -s vim_airline_b_insert                     fg=74,bg=238  # fg=#39bae6,bg=#304357
  ble-face -s vim_airline_b_replace                    fg=149,bg=238 # fg=#c2d94c,bg=#304357
  ble-face -s vim_airline_b_visual                     fg=209,bg=238 # fg=#ff8f40,bg=#304357
  ble-face -s vim_airline_c                            fg=149,bg=233 # fg=#b3b1ad,bg=#0a0e14
  ble-face -s vim_airline_c_inactive                   fg=149,bg=233 # fg=#c2d94c,bg=#0a0e14
  ble-face -s vim_airline_z_replace                    fg=238,bg=149 # fg=#3d424d,bg=#c2d94c
}
