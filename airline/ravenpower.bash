# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ravenpower.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Pretty much powerlineish clone, and some
# of the hex colours was borrowed from raven

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ravenpower/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=234  # fg=#005f00,bg=#1d1f21
  ble-face -s vim_airline_a_inactive                   fg=236,bg=236 # fg=#303030,bg=#2e2e2e
  ble-face -s vim_airline_a_insert                     fg=117,bg=234 # fg=#87d7ff,bg=#1d1f21
  ble-face -s vim_airline_a_replace                    fg=231,bg=160 # fg=#ffffff,bg=#d70000
  ble-face -s vim_airline_a_visual                     fg=232,bg=214 # fg=#080808,bg=#ffaf00
  ble-face -s vim_airline_b                            fg=247,bg=236 # fg=#9e9e9e,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=236,bg=236 # fg=#303030,bg=#2e2e2e
  ble-face -s vim_airline_c                            fg=251,bg=236 # fg=#c8c8c8,bg=#2e2e2e
  ble-face -s vim_airline_c_inactive                   fg=236,bg=236 # fg=#303030,bg=#2e2e2e
  ble-face -s vim_airline_z_replace                    fg=22,bg=234  # fg=#005f00,bg=#1d1f21
}
