# From github:vim-airline/vim-airline-themes/autoload/airline/themes/peaksea.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# peaksea Airline theme
#
# Author:       Jonathan Dion <https://github.com/jonathandion/>
# Version:      1.0
# License:      MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:peaksea/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=153 # fg=#3a3a3a,bg=#c0d8f8
  ble-face -s vim_airline_a_inactive                   fg=241,bg=235 # fg=#666666,bg=#262626
  ble-face -s vim_airline_a_insert                     fg=237,bg=84  # fg=#3a3a3a,bg=#60f080
  ble-face -s vim_airline_a_replace                    fg=237,bg=186 # fg=#3a3a3a,bg=#d0d090
  ble-face -s vim_airline_a_visual                     fg=237,bg=219 # fg=#3a3a3a,bg=#f0c0f0
  ble-face -s vim_airline_b                            fg=254,bg=239 # fg=#e4e4e4,bg=#4e4e4e
  ble-face -s vim_airline_b_inactive                   fg=241,bg=235 # fg=#666666,bg=#262626
  ble-face -s vim_airline_c                            fg=255,bg=235 # fg=#eeeeee,bg=#262626
  ble-face -s vim_airline_c_inactive                   fg=241,bg=235 # fg=#666666,bg=#262626
  ble-face -s vim_airline_error                        fg=234,bg=167 # fg=#1c1c1c,bg=167
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_term                         fg=234,bg=237 # fg=#1c1c1c,bg=#3a3a3a
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_warning                      fg=234,bg=179 # fg=#1c1c1c,bg=#e0c060
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
