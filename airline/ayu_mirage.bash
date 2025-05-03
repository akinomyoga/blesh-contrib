# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ayu_mirage.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Normal mode
# (Dark)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ayu_mirage/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=150  # fg=#212733,bg=#bbe67e
  ble-face -s vim_airline_a_inactive                   fg=150,bg=17  # fg=#bbe67e,bg=#212733
  ble-face -s vim_airline_a_insert                     fg=17,bg=117  # fg=#212733,bg=#80d4ff
  ble-face -s vim_airline_a_replace                    fg=17,bg=204  # fg=#212733,bg=#f07178
  ble-face -s vim_airline_a_visual                     fg=17,bg=215  # fg=#212733,bg=#ffae57
  ble-face -s vim_airline_b                            fg=150,bg=17  # fg=#bbe67e,bg=#212733
  ble-face -s vim_airline_b_insert                     fg=117,bg=17  # fg=#80d4ff,bg=#212733
  ble-face -s vim_airline_b_replace                    fg=150,bg=17  # fg=#bbe67e,bg=#212733
  ble-face -s vim_airline_b_visual                     fg=215,bg=17  # fg=#ffae57,bg=#212733
  ble-face -s vim_airline_c                            fg=253,bg=17  # fg=#e6e1cf,bg=#212733
  ble-face -s vim_airline_c_inactive                   fg=150,bg=17  # fg=#bbe67e,bg=#212733
  ble-face -s vim_airline_z_replace                    fg=17,bg=150  # fg=#212733,bg=#bbe67e
}
