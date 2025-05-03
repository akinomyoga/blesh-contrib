# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_framer.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Framer vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Framer (Maintained by Jesse Hoyos)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_framer/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=250 # fg=#151515,bg=#b9b9b9
  ble-face -s vim_airline_a_inactive                   fg=233,bg=233 # fg=#151515,bg=#151515
  ble-face -s vim_airline_a_insert                     fg=233,bg=80  # fg=#151515,bg=#32ccdc
  ble-face -s vim_airline_a_replace                    fg=233,bg=141 # fg=#151515,bg=#ba8cfc
  ble-face -s vim_airline_a_visual                     fg=233,bg=203 # fg=#151515,bg=#fc4769
  ble-face -s vim_airline_b                            fg=250,bg=238 # fg=#b9b9b9,bg=#464646
  ble-face -s vim_airline_b_inactive                   fg=250,bg=233 # fg=#b9b9b9,bg=#151515
  ble-face -s vim_airline_c                            fg=250,bg=233 # fg=#b9b9b9,bg=#151515
  ble-face -s vim_airline_c_inactive                   fg=252,bg=233 # fg=#d0d0d0,bg=#151515
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=233 # fg=#eeeeee,bg=#151515
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=233 # fg=#eeeeee,bg=#151515
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=233 # fg=#eeeeee,bg=#151515
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=233 # fg=#eeeeee,bg=#151515
}
