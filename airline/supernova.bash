# From github:vim-airline/vim-airline-themes/autoload/airline/themes/supernova.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:supernova/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_a_replace                    fg=161,bg=254 # fg=#d7005f,bg=#e4e4e4
  ble-face -s vim_airline_a_visual                     fg=235,bg=254 # fg=#1d2529,bg=#e4e4e4
  ble-face -s vim_airline_b                            fg=254,bg=17  # fg=#e4e4e4,bg=#242e33
  ble-face -s vim_airline_b_inactive                   fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_b_visual                     fg=0,bg=17    # fg=0,bg=#242e33
  ble-face -s vim_airline_c                            fg=255,bg=235 # fg=#eeeeee,bg=#1d2529
  ble-face -s vim_airline_c_inactive                   fg=254,bg=17  # fg=#e4e4e4,bg=#242e33
  ble-face -s vim_airline_c_inactive_modified          fg=59,bg=254  # fg=#585864,bg=#e4e4e4
  ble-face -s vim_airline_c_visual                     fg=254,bg=235 # fg=#e4e4e4,bg=#1d2529
  ble-face -s vim_airline_x_inactive                   fg=240,bg=254 # fg=#585858,bg=#e4e4e4
  ble-face -s vim_airline_z_replace                    fg=240,bg=254 # fg=#585858,bg=#e4e4e4
}
