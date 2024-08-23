# From github:vim-airline/vim-airline-themes/autoload/airline/themes/supernova.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:supernova/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=73  # fg=#262626,bg=#5fafaf
  ble-face -s vim_airline_a_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#444444
  ble-face -s vim_airline_a_insert                     fg=254,bg=54  # fg=#e4e4e4,bg=#5f0087
  ble-face -s vim_airline_a_replace                    fg=254,bg=89  # fg=#e4e4e4,bg=#87005f
  ble-face -s vim_airline_a_visual                     fg=235,bg=32  # fg=#262626,bg=#0087d7
  ble-face -s vim_airline_b                            fg=252,bg=240 # fg=#d0d0d0,bg=#585858
  ble-face -s vim_airline_b_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#444444
  ble-face -s vim_airline_b_visual                     fg=231,bg=240 # fg=#ffffff,bg=#585858
  ble-face -s vim_airline_c                            fg=248,bg=235 # fg=#a8a8a8,bg=#262626
  ble-face -s vim_airline_c_inactive                   fg=252,bg=240 # fg=#d0d0d0,bg=#585858
  ble-face -s vim_airline_c_inactive_modified          fg=255,bg=238 # fg=#eeeeee,bg=#444444
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#eeeeee,bg=#262626
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#eeeeee,bg=#262626
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#eeeeee,bg=#262626
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#eeeeee,bg=#262626
  ble-face -s vim_airline_x_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#444444
}
