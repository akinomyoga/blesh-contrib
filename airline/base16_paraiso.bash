# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_paraiso.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Paraiso Scheme by Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_paraiso/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=72  # fg=#41323f,bg=#48b685
  ble-face -s vim_airline_a_inactive                   fg=247,bg=237 # fg=#a39e9b,bg=#41323f
  ble-face -s vim_airline_a_insert                     fg=237,bg=39  # fg=#41323f,bg=#06b6ef
  ble-face -s vim_airline_a_replace                    fg=237,bg=203 # fg=#41323f,bg=#ef6155
  ble-face -s vim_airline_a_visual                     fg=237,bg=97  # fg=#41323f,bg=#815ba4
  ble-face -s vim_airline_b                            fg=249,bg=239 # fg=#b9b6b0,bg=#4f424c
  ble-face -s vim_airline_b_inactive                   fg=247,bg=237 # fg=#a39e9b,bg=#41323f
  ble-face -s vim_airline_c                            fg=214,bg=237 # fg=#f99b15,bg=#41323f
  ble-face -s vim_airline_c_inactive                   fg=247,bg=237 # fg=#a39e9b,bg=#41323f
}
