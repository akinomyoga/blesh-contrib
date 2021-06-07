# From github:vim-airline/vim-airline-themes/autoload/airline/themes/selenized_bw.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# MIT License. Copyright (c) 2021 novenary
# vim: et ts=2 sts=2 sw=2 tw=80

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:selenized_bw/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=28  # fg=#ebebeb,bg=#1d9700
  ble-face -s vim_airline_a_inactive                   fg=105,bg=252 # fg=#878787,bg=#cdcdcd
  ble-face -s vim_airline_a_insert                     fg=255,bg=26  # fg=#ebebeb,bg=#0064e4
  ble-face -s vim_airline_a_replace                    fg=255,bg=160 # fg=#ebebeb,bg=#d6000c
  ble-face -s vim_airline_a_visual                     fg=255,bg=98  # fg=#ebebeb,bg=#7f51d6
  ble-face -s vim_airline_b                            fg=238,bg=252 # fg=#474747,bg=#cdcdcd
  ble-face -s vim_airline_b_inactive                   fg=105,bg=252 # fg=#878787,bg=#cdcdcd
  ble-face -s vim_airline_c                            fg=105,bg=255 # fg=#878787,bg=#ebebeb
  ble-face -s vim_airline_c_inactive                   fg=105,bg=252 # fg=#878787,bg=#cdcdcd
  ble-face -s vim_airline_c_inactive_modified          fg=172,bg=252 # fg=#c49700,bg=#cdcdcd
  ble-face -s vim_airline_c_insert_modified            fg=172,bg=255 # fg=#c49700,bg=#ebebeb
  ble-face -s vim_airline_c_normal_modified            fg=172,bg=255 # fg=#c49700,bg=#ebebeb
  ble-face -s vim_airline_c_replace_modified           fg=172,bg=255 # fg=#c49700,bg=#ebebeb
  ble-face -s vim_airline_c_visual_modified            fg=172,bg=255 # fg=#c49700,bg=#ebebeb
  ble-face -s vim_airline_error                        fg=255,bg=124 # fg=#ebebeb,bg=#bf0000
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=255,bg=136 # fg=#ebebeb,bg=#af8500
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
