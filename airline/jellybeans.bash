# From github:vim-airline/vim-airline-themes/autoload/airline/themes/jellybeans.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Color palette

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:jellybeans/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=25  # fg=#d8dee9,bg=#0d61ac
  ble-face -s vim_airline_a_inactive                   fg=241,bg=235 # fg=#666666,bg=#262626
  ble-face -s vim_airline_a_insert                     fg=231,bg=58  # fg=#ffffff,bg=#437019
  ble-face -s vim_airline_a_replace                    fg=88,bg=233  # fg=#870000,bg=#151515
  ble-face -s vim_airline_a_visual                     fg=231,bg=88  # fg=#ffffff,bg=#870000
  ble-face -s vim_airline_b                            fg=231,bg=235 # fg=#ffffff,bg=#262626
  ble-face -s vim_airline_b_inactive                   fg=240,bg=233 # fg=#4f5b66,bg=#151515
  ble-face -s vim_airline_c                            fg=240,bg=233 # fg=#4f5b66,bg=#151515
  ble-face -s vim_airline_c_inactive_modified          fg=215,bg=16  # fg=#ffb964,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=231,bg=233 # fg=#ffffff,bg=#151515
  ble-face -s vim_airline_c_insert_modified            fg=215,bg=16  # fg=#ffb964,bg=#000000
  ble-face -s vim_airline_c_normal_modified            fg=215,bg=16  # fg=#ffb964,bg=#000000
  ble-face -s vim_airline_c_replace_modified           fg=215,bg=16  # fg=#ffb964,bg=#000000
  ble-face -s vim_airline_c_visual                     fg=231,bg=233 # fg=#ffffff,bg=#151515
  ble-face -s vim_airline_c_visual_modified            fg=215,bg=16  # fg=#ffb964,bg=#000000
}
