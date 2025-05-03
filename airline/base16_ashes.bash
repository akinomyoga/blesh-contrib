# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_ashes.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Ashes Scheme by Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_ashes/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=115 # fg=#393f45,bg=#95c7ae
  ble-face -s vim_airline_a_inactive                   fg=252,bg=238 # fg=#c7ccd1,bg=#393f45
  ble-face -s vim_airline_a_insert                     fg=238,bg=140 # fg=#393f45,bg=#ae95c7
  ble-face -s vim_airline_a_replace                    fg=238,bg=180 # fg=#393f45,bg=#c7ae95
  ble-face -s vim_airline_a_visual                     fg=238,bg=175 # fg=#393f45,bg=#c795ae
  ble-face -s vim_airline_b                            fg=254,bg=61  # fg=#dfe2e5,bg=#565e65
  ble-face -s vim_airline_b_inactive                   fg=252,bg=238 # fg=#c7ccd1,bg=#393f45
  ble-face -s vim_airline_c                            fg=186,bg=238 # fg=#c7c795,bg=#393f45
  ble-face -s vim_airline_c_inactive                   fg=252,bg=238 # fg=#c7ccd1,bg=#393f45
}
