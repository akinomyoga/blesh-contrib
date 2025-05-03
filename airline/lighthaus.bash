# From github:vim-airline/vim-airline-themes/autoload/airline/themes/lighthaus.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Lighthaus Color theme for Vim Airline
# GIT: https://github.com/lighthaus-theme/vim
# Author: Adhiraj Sirohi (https://github.com/brutuski)
#         Vasundhara Sharma (https://github.com/vasundhasauras)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:lighthaus/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=37  # fg=#21252d,bg=#00bfa4
  ble-face -s vim_airline_a_inactive                   fg=252,bg=235 # fg=#cccccc,bg=#21252d
  ble-face -s vim_airline_a_insert                     fg=235,bg=71  # fg=#21252d,bg=#50c16e
  ble-face -s vim_airline_a_replace                    fg=235,bg=203 # fg=#21252d,bg=#ff5050
  ble-face -s vim_airline_a_visual                     fg=235,bg=202 # fg=#21252d,bg=#ed722e
  ble-face -s vim_airline_b                            fg=230,bg=233 # fg=#fffade,bg=#090b26
  ble-face -s vim_airline_b_inactive                   fg=252,bg=235 # fg=#cccccc,bg=#21252d
  ble-face -s vim_airline_c                            fg=37,bg=235  # fg=#00bfa4,bg=#21252d
  ble-face -s vim_airline_c_inactive                   fg=252,bg=235 # fg=#cccccc,bg=#21252d
  ble-face -s vim_airline_c_insert                     fg=71,bg=235  # fg=#50c16e,bg=#21252d
  ble-face -s vim_airline_c_insert_modified            fg=166,bg=235 # fg=#e25600,bg=#21252d
  ble-face -s vim_airline_c_normal_modified            fg=175,bg=235 # fg=#d68eb2,bg=#21252d
  ble-face -s vim_airline_c_replace                    fg=203,bg=235 # fg=#ff5050,bg=#21252d
  ble-face -s vim_airline_c_replace_modified           fg=226,bg=235 # fg=#ffff00,bg=#21252d
  ble-face -s vim_airline_c_visual                     fg=202,bg=235 # fg=#ed722e,bg=#21252d
  ble-face -s vim_airline_c_visual_modified            fg=202,bg=235 # fg=#ff4d00,bg=#21252d
}
