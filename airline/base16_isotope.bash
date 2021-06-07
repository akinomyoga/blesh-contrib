# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_isotope.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Isotope Scheme by Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_isotope/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=82  # fg=#404040,bg=#33ff00
  ble-face -s vim_airline_a_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#404040
  ble-face -s vim_airline_a_insert                     fg=238,bg=27  # fg=#404040,bg=#0066ff
  ble-face -s vim_airline_a_replace                    fg=238,bg=196 # fg=#404040,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=238,bg=165 # fg=#404040,bg=#cc00ff
  ble-face -s vim_airline_b                            fg=254,bg=63  # fg=#e0e0e0,bg=#606060
  ble-face -s vim_airline_b_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#404040
  ble-face -s vim_airline_c                            fg=208,bg=238 # fg=#ff9900,bg=#404040
  ble-face -s vim_airline_c_inactive                   fg=252,bg=238 # fg=#d0d0d0,bg=#404040
}
