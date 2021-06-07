# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_embers.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Embers Scheme by Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_embers/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=65  # fg=#2c2620,bg=#57826d
  ble-face -s vim_airline_a_inactive                   fg=138,bg=235 # fg=#a39a90,bg=#2c2620
  ble-face -s vim_airline_a_insert                     fg=235,bg=60  # fg=#2c2620,bg=#6d5782
  ble-face -s vim_airline_a_replace                    fg=235,bg=95  # fg=#2c2620,bg=#826d57
  ble-face -s vim_airline_a_visual                     fg=235,bg=95  # fg=#2c2620,bg=#82576d
  ble-face -s vim_airline_b                            fg=249,bg=237 # fg=#beb6ae,bg=#433b32
  ble-face -s vim_airline_b_inactive                   fg=138,bg=235 # fg=#a39a90,bg=#2c2620
  ble-face -s vim_airline_c                            fg=101,bg=235 # fg=#828257,bg=#2c2620
  ble-face -s vim_airline_c_inactive                   fg=138,bg=235 # fg=#a39a90,bg=#2c2620
}
