# From github:vim-airline/vim-airline-themes/autoload/airline/themes/selenized.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# MIT License. Copyright (c) 2021 novenary
# vim: et ts=2 sts=2 sw=2 tw=80

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:selenized/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=64  # fg=#e9e4d0,bg=#489100
  ble-face -s vim_airline_a_inactive                   fg=246,bg=187 # fg=#909995,bg=#cfcebe
  ble-face -s vim_airline_a_insert                     fg=254,bg=26  # fg=#e9e4d0,bg=#0072d4
  ble-face -s vim_airline_a_replace                    fg=254,bg=160 # fg=#e9e4d0,bg=#d2212d
  ble-face -s vim_airline_a_visual                     fg=254,bg=98  # fg=#e9e4d0,bg=#8762c6
  ble-face -s vim_airline_b                            fg=241,bg=187 # fg=#53676d,bg=#cfcebe
  ble-face -s vim_airline_b_inactive                   fg=246,bg=187 # fg=#909995,bg=#cfcebe
  ble-face -s vim_airline_c                            fg=246,bg=254 # fg=#909995,bg=#e9e4d0
  ble-face -s vim_airline_c_inactive                   fg=246,bg=187 # fg=#909995,bg=#cfcebe
  ble-face -s vim_airline_c_inactive_modified          fg=136,bg=187 # fg=#ad8900,bg=#cfcebe
  ble-face -s vim_airline_c_insert_modified            fg=136,bg=254 # fg=#ad8900,bg=#e9e4d0
  ble-face -s vim_airline_c_normal_modified            fg=136,bg=254 # fg=#ad8900,bg=#e9e4d0
  ble-face -s vim_airline_c_replace_modified           fg=136,bg=254 # fg=#ad8900,bg=#e9e4d0
  ble-face -s vim_airline_c_visual_modified            fg=136,bg=254 # fg=#ad8900,bg=#e9e4d0
  ble-face -s vim_airline_error                        fg=254,bg=160 # fg=#e9e4d0,bg=#cc1729
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=254,bg=136 # fg=#e9e4d0,bg=#a78300
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
