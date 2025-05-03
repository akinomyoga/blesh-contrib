# From github:vim-airline/vim-airline-themes/autoload/airline/themes/molokai.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:molokai/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=232,bg=186 # fg=#080808,bg=#e6db74
  ble-face -s vim_airline_a_inactive                   fg=234,bg=239 # fg=#1b1d1e,bg=#465457
  ble-face -s vim_airline_a_insert                     fg=232,bg=81  # fg=#080808,bg=#66d9ef
  ble-face -s vim_airline_a_replace                    fg=232,bg=197 # fg=#080808,bg=#f92672
  ble-face -s vim_airline_a_visual                     fg=232,bg=148 # fg=#080808,bg=#a6e22e
  ble-face -s vim_airline_b                            fg=255,bg=235 # fg=#f8f8f0,bg=#232526
  ble-face -s vim_airline_b_inactive                   fg=234,bg=239 # fg=#1b1d1e,bg=#465457
  ble-face -s vim_airline_c                            fg=255,bg=239 # fg=#f8f8f0,bg=#465457
  ble-face -s vim_airline_c_inactive                   fg=234,bg=239 # fg=#1b1d1e,bg=#465457
  ble-face -s vim_airline_c_inactive_modified          fg=255,bg=16  # fg=#f8f8f0,bg=#000000
  ble-face -s vim_airline_c_insert_modified            fg=232,bg=81  # fg=#080808,bg=#66d9ef
  ble-face -s vim_airline_c_normal_modified            fg=232,bg=186 # fg=#080808,bg=#e6db74
  ble-face -s vim_airline_c_replace_modified           fg=232,bg=197 # fg=#080808,bg=#f92672
  ble-face -s vim_airline_c_visual_modified            fg=232,bg=148 # fg=#080808,bg=#a6e22e
}
