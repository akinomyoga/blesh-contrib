# From github:vim-airline/vim-airline-themes/autoload/airline/themes/cool.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:cool/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_b                            fg=254,bg=31  # fg=#e4e4e4,bg=#0087af
  ble-face -s vim_airline_b_inactive                   fg=254,bg=60  # fg=#e4e4e4,bg=#466d79
  ble-face -s vim_airline_b_insert                     fg=254,bg=70  # fg=#e4e4e4,bg=#47af00
  ble-face -s vim_airline_b_replace                    fg=254,bg=130 # fg=#e4e4e4,bg=#af5f00
  ble-face -s vim_airline_b_visual                     fg=254,bg=124 # fg=#e4e4e4,bg=#af2800
  ble-face -s vim_airline_c                            fg=255,bg=24  # fg=#eeeeee,bg=#005f87
  ble-face -s vim_airline_c_inactive                   fg=255,bg=238 # fg=#eeeeee,bg=#324e59
  ble-face -s vim_airline_c_insert                     fg=255,bg=28  # fg=#eeeeee,bg=#2e8700
  ble-face -s vim_airline_c_replace                    fg=255,bg=94  # fg=#eeeeee,bg=#875300
  ble-face -s vim_airline_c_visual                     fg=255,bg=88  # fg=#eeeeee,bg=#872800
  ble-face -s vim_airline_term                         fg=255,bg=24  # fg=#eeeeee,bg=#005f87
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_term_insert                  fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_term_visual                  fg=255,bg=88  # fg=#eeeeee,bg=#872800
}
