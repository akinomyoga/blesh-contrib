# From github:vim-airline/vim-airline-themes/autoload/airline/themes/simple.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:simple/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=232,bg=45  # fg=#080808,bg=#00dfff
  ble-face -s vim_airline_a_inactive                   fg=239,bg=232 # fg=#4e4e4e,bg=#080808
  ble-face -s vim_airline_a_insert                     fg=232,bg=82  # fg=#080808,bg=#5fff00
  ble-face -s vim_airline_a_replace                    fg=232,bg=124 # fg=#080808,bg=#af0000
  ble-face -s vim_airline_a_visual                     fg=232,bg=184 # fg=#080808,bg=#dfdf00
  ble-face -s vim_airline_b                            fg=202,bg=234 # fg=#ff5f00,bg=#1c1c1c
  ble-face -s vim_airline_b_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c                            fg=243,bg=232 # fg=#767676,bg=#080808
  ble-face -s vim_airline_c_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive_modified          fg=160,bg=231 # fg=#df0000,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_normal_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_replace_modified           fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_visual_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
}
