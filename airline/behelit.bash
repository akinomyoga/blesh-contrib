# From github:vim-airline/vim-airline-themes/autoload/airline/themes/behelit.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:behelit/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=69  # fg=#121212,bg=#5f87ff
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=233,bg=48  # fg=#121212,bg=#00ff87
  ble-face -s vim_airline_a_replace                    fg=233,bg=161 # fg=#121212,bg=#d70057
  ble-face -s vim_airline_a_visual                     fg=233,bg=83  # fg=#121212,bg=#5fff5f
  ble-face -s vim_airline_b                            fg=69,bg=235  # fg=#5f87ff,bg=#262626
  ble-face -s vim_airline_b_inactive                   fg=239,bg=235 # fg=#4e4e4e,bg=#262626
  ble-face -s vim_airline_c                            fg=69,bg=234  # fg=#5f87ff,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive_modified          fg=60,bg=234  # fg=#5f5f87,bg=#1c1c1c
  ble-face -s vim_airline_c_insert_modified            fg=161,bg=234 # fg=#d7005f,bg=#1c1c1c
  ble-face -s vim_airline_c_normal_modified            fg=161,bg=234 # fg=#d7005f,bg=#1c1c1c
  ble-face -s vim_airline_c_replace_modified           fg=161,bg=234 # fg=#d7005f,bg=#1c1c1c
  ble-face -s vim_airline_c_visual_modified            fg=161,bg=234 # fg=#d7005f,bg=#1c1c1c
  ble-face -s vim_airline_warning                      fg=233,bg=161 # fg=#121212,bg=#d7005f
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_z_replace                    fg=233,bg=48  # fg=#121212,bg=#00ff87
}
