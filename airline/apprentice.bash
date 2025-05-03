# From github:vim-airline/vim-airline-themes/autoload/airline/themes/apprentice.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline theme for Apprentice <https://github.com/romainl/Apprentice>
#
# Author:  pt307 (based on work by romainl)
# License: MIT License

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:apprentice/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=101 # fg=#262626,bg=#87875f
  ble-face -s vim_airline_a_inactive                   fg=235,bg=240 # fg=#262626,bg=#585858
  ble-face -s vim_airline_a_insert                     fg=235,bg=65  # fg=#262626,bg=#5f875f
  ble-face -s vim_airline_a_replace                    fg=235,bg=131 # fg=#262626,bg=#af5f5f
  ble-face -s vim_airline_a_visual                     fg=235,bg=229 # fg=#262626,bg=#ffffaf
  ble-face -s vim_airline_b                            fg=235,bg=240 # fg=#262626,bg=#585858
  ble-face -s vim_airline_b_inactive                   fg=240,bg=235 # fg=#585858,bg=#262626
  ble-face -s vim_airline_c                            fg=250,bg=235 # fg=#bcbcbc,bg=#262626
  ble-face -s vim_airline_c_inactive                   fg=240,bg=235 # fg=#585858,bg=#262626
  ble-face -s vim_airline_c_inactive_modified          fg=208,bg=16  # fg=#ff8700,bg=#000000
  ble-face -s vim_airline_c_insert_modified            fg=208,bg=16  # fg=#ff8700,bg=#000000
  ble-face -s vim_airline_c_normal_modified            fg=208,bg=16  # fg=#ff8700,bg=#000000
  ble-face -s vim_airline_c_replace_modified           fg=208,bg=16  # fg=#ff8700,bg=#000000
  ble-face -s vim_airline_c_visual_modified            fg=208,bg=16  # fg=#ff8700,bg=#000000
  ble-face -s vim_airline_error                        fg=235,bg=131 # fg=#262626,bg=#af5f5f
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_inactive_modified      fg=235,bg=131 # fg=#262626,bg=#af5f5f
  ble-face -s vim_airline_warning                      fg=235,bg=208 # fg=#262626,bg=#ff8700
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_warning_inactive_modified    fg=235,bg=208 # fg=#262626,bg=#ff8700
}
