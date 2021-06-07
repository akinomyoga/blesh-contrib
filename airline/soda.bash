# From github:vim-airline/vim-airline-themes/autoload/airline/themes/soda.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:soda/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=97  # fg=#ffffff,bg=#875faf
  ble-face -s vim_airline_a_inactive                   fg=243,bg=231 # fg=#767676,bg=#ffffff
  ble-face -s vim_airline_a_insert                     fg=231,bg=22  # fg=#ffffff,bg=#005f00
  ble-face -s vim_airline_a_replace                    fg=243,bg=227 # fg=#767676,bg=#ffff5f
  ble-face -s vim_airline_a_visual                     fg=243,bg=227 # fg=#767676,bg=#ffff5f
  ble-face -s vim_airline_b                            fg=231,bg=96  # fg=#ffffff,bg=#875f87
  ble-face -s vim_airline_b_inactive                   fg=243,bg=231 # fg=#767676,bg=#ffffff
  ble-face -s vim_airline_b_insert                     fg=231,bg=28  # fg=#ffffff,bg=#008700
  ble-face -s vim_airline_b_visual                     fg=243,bg=221 # fg=#767676,bg=#ffd75f
  ble-face -s vim_airline_c                            fg=231,bg=54  # fg=#ffffff,bg=#5f0087
  ble-face -s vim_airline_c_inactive                   fg=243,bg=231 # fg=#767676,bg=#ffffff
  ble-face -s vim_airline_c_inactive_modified          fg=231,bg=160 # fg=#ffffff,bg=#df0000
  ble-face -s vim_airline_c_insert                     fg=231,bg=34  # fg=#ffffff,bg=#00af00
  ble-face -s vim_airline_c_visual                     fg=243,bg=215 # fg=#767676,bg=#ffaf5f
}
