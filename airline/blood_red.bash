# From github:vim-airline/vim-airline-themes/autoload/airline/themes/blood_red.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:blood_red/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=250,bg=160 # fg=#bcbcbc,bg=#d62929
  ble-face -s vim_airline_a_inactive                   fg=160,bg=237 # fg=#d62929,bg=#3a3a3a
  ble-face -s vim_airline_a_insert                     fg=231,bg=88  # fg=#fffdfa,bg=#8b0000
  ble-face -s vim_airline_a_replace                    fg=251,bg=161 # fg=#c6c6c6,bg=#d62962
  ble-face -s vim_airline_a_visual                     fg=231,bg=161 # fg=#fffdfa,bg=#d62962
  ble-face -s vim_airline_b                            fg=231,bg=88  # fg=#ffffff,bg=#8b0000
  ble-face -s vim_airline_b_inactive                   fg=160,bg=237 # fg=#d62929,bg=#3a3a3a
  ble-face -s vim_airline_b_insert                     fg=231,bg=160 # fg=#ffffff,bg=#c50000
  ble-face -s vim_airline_b_replace                    fg=231,bg=88  # fg=#ffffff,bg=#8b0000
  ble-face -s vim_airline_c                            fg=251,bg=237 # fg=#c6c6c6,bg=#3a3a3a
  ble-face -s vim_airline_c_inactive                   fg=160,bg=237 # fg=#d62929,bg=#3a3a3a
  ble-face -s vim_airline_z_replace                    fg=250,bg=160 # fg=#bcbcbc,bg=#d62929
}
