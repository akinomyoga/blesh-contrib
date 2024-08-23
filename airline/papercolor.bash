# From github:vim-airline/vim-airline-themes/autoload/airline/themes/papercolor.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:papercolor/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_a_replace                    fg=161,bg=254 # fg=#d7005f,bg=#e4e4e4
  ble-face -s vim_airline_a_visual                     fg=24,bg=254  # fg=#005f87,bg=#e4e4e4
  ble-face -s vim_airline_b                            fg=254,bg=31  # fg=#e4e4e4,bg=#0087af
  ble-face -s vim_airline_b_inactive                   fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_b_visual                     fg=231,bg=31  # fg=#ffffff,bg=#0087af
  ble-face -s vim_airline_c                            fg=255,bg=24  # fg=#eeeeee,bg=#005f87
  ble-face -s vim_airline_c_inactive                   fg=254,bg=31  # fg=#e4e4e4,bg=#0087af
  ble-face -s vim_airline_c_inactive_modified          fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_c_visual                     fg=254,bg=24  # fg=#e4e4e4,bg=#005f87
  ble-face -s vim_airline_x_inactive                   fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_z_replace                    fg=240,bg=254 # fg=#585858,bg=#e4e4e4
}
