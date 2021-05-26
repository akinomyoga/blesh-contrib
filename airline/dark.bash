# From github:vim-airline/vim-airline-themes/autoload/airline/themes/dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=190  # fg=#00005f,bg=#dfff00
  ble-face -s vim_airline_a_commandline                fg=17,bg=40   # fg=#00005f,bg=#00d700
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=17,bg=45   # fg=#00005f,bg=#00dfff
  ble-face -s vim_airline_a_replace                    fg=231,bg=124 # fg=#ffffff,bg=#af0000
  ble-face -s vim_airline_a_visual                     fg=16,bg=214  # fg=#000000,bg=#ffaf00
  ble-face -s vim_airline_b                            fg=231,bg=238 # fg=#ffffff,bg=#444444
  ble-face -s vim_airline_b_inactive                   fg=239,bg=235 # fg=#4e4e4e,bg=#262626
  ble-face -s vim_airline_b_insert                     fg=231,bg=27  # fg=#ffffff,bg=#005fff
  ble-face -s vim_airline_b_visual                     fg=16,bg=202  # fg=#000000,bg=#ff5f00
  ble-face -s vim_airline_c                            fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c_inactive_modified          fg=97,bg=0    # fg=#875faf,bg=0
  ble-face -s vim_airline_c_insert                     fg=231,bg=18  # fg=#ffffff,bg=#000080
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_c_visual                     fg=231,bg=52  # fg=#ffffff,bg=#5f0000
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=53  # fg=#ffffff,bg=#5f005f
  ble-face -s vim_airline_z_replace                    fg=17,bg=45   # fg=#00005f,bg=#00dfff
}
