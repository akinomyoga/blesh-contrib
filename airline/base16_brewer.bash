# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_brewer.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Brewer Scheme by Timothée Poisot (http://github.com/tpoisot)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_brewer/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=71   # fg=#2e2f30,bg=#31a354
  ble-face -s vim_airline_a_inactive                   fg=250,bg=17  # fg=#b7b8b9,bg=#2e2f30
  ble-face -s vim_airline_a_insert                     fg=17,bg=67   # fg=#2e2f30,bg=#3182bd
  ble-face -s vim_airline_a_replace                    fg=17,bg=160  # fg=#2e2f30,bg=#e31a1c
  ble-face -s vim_airline_a_visual                     fg=17,bg=97   # fg=#2e2f30,bg=#756bb1
  ble-face -s vim_airline_b                            fg=253,bg=239 # fg=#dadbdc,bg=#515253
  ble-face -s vim_airline_b_inactive                   fg=250,bg=17  # fg=#b7b8b9,bg=#2e2f30
  ble-face -s vim_airline_c                            fg=166,bg=17  # fg=#e6550d,bg=#2e2f30
  ble-face -s vim_airline_c_inactive                   fg=250,bg=17  # fg=#b7b8b9,bg=#2e2f30
}
