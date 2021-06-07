# From github:vim-airline/vim-airline-themes/autoload/airline/themes/selenized.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# MIT License. Copyright (c) 2021 novenary
# vim: et ts=2 sts=2 sw=2 tw=80

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:selenized/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=187,bg=64  # fg=#e7ddc0,bg=#3f8100
  ble-face -s vim_airline_a_inactive                   fg=244,bg=181 # fg=#7e8783,bg=#cbc2a6
  ble-face -s vim_airline_a_insert                     fg=187,bg=26  # fg=#e7ddc0,bg=#005dcc
  ble-face -s vim_airline_a_replace                    fg=187,bg=124 # fg=#e7ddc0,bg=#c00221
  ble-face -s vim_airline_a_visual                     fg=187,bg=61  # fg=#e7ddc0,bg=#714cbc
  ble-face -s vim_airline_b                            fg=239,bg=181 # fg=#43545a,bg=#cbc2a6
  ble-face -s vim_airline_b_inactive                   fg=244,bg=181 # fg=#7e8783,bg=#cbc2a6
  ble-face -s vim_airline_c                            fg=244,bg=187 # fg=#7e8783,bg=#e7ddc0
  ble-face -s vim_airline_c_inactive                   fg=244,bg=181 # fg=#7e8783,bg=#cbc2a6
  ble-face -s vim_airline_c_inactive_modified          fg=136,bg=181 # fg=#9b7600,bg=#cbc2a6
  ble-face -s vim_airline_c_insert_modified            fg=136,bg=187 # fg=#9b7600,bg=#e7ddc0
  ble-face -s vim_airline_c_normal_modified            fg=136,bg=187 # fg=#9b7600,bg=#e7ddc0
  ble-face -s vim_airline_c_replace_modified           fg=136,bg=187 # fg=#9b7600,bg=#e7ddc0
  ble-face -s vim_airline_c_visual_modified            fg=136,bg=187 # fg=#9b7600,bg=#e7ddc0
  ble-face -s vim_airline_error                        fg=187,bg=124 # fg=#e7ddc0,bg=#b9001e
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=187,bg=94  # fg=#e7ddc0,bg=#957000
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
