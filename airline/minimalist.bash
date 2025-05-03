# From github:vim-airline/vim-airline-themes/autoload/airline/themes/minimalist.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Minimalist Airline - A Material Color Scheme
#
# Author:       Diki Ananta <diki1aap@gmail.com>
# Repository:   https://github.com/dikiaap/minimalist
# Version:      2.0
# License:      MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:minimalist/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=239,bg=249 # fg=#4d4d4d,bg=#b3b3b3
  ble-face -s vim_airline_a_inactive                   fg=235,bg=252 # fg=#262626,bg=#cccccc
  ble-face -s vim_airline_b                            fg=236,bg=247 # fg=#333333,bg=#999999
  ble-face -s vim_airline_b_inactive                   fg=235,bg=252 # fg=#262626,bg=#cccccc
  ble-face -s vim_airline_c                            fg=236,bg=252 # fg=#333333,bg=#cccccc
  ble-face -s vim_airline_c_inactive                   fg=235,bg=252 # fg=#262626,bg=#cccccc
  ble-face -s vim_airline_error                        fg=234,bg=167 # fg=#1c1c1c,bg=#d75f5f
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_term                         fg=234,bg=249 # fg=#1c1c1c,bg=#b3b3b3
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_warning                      fg=234,bg=215 # fg=#1c1c1c,bg=#ffaf5f
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
