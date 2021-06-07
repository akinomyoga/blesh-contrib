# From github:vim-airline/vim-airline-themes/autoload/airline/themes/serene.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:serene/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=45,bg=232  # fg=#00dfff,bg=#080808
  ble-face -s vim_airline_a_inactive                   fg=239,bg=232 # fg=#4e4e4e,bg=#080808
  ble-face -s vim_airline_a_insert                     fg=82,bg=232  # fg=#5fff00,bg=#080808
  ble-face -s vim_airline_a_replace                    fg=82,bg=124  # fg=#5fff00,bg=#af0000
  ble-face -s vim_airline_a_visual                     fg=184,bg=232 # fg=#dfdf00,bg=#080808
  ble-face -s vim_airline_b                            fg=202,bg=232 # fg=#ff5f00,bg=#080808
  ble-face -s vim_airline_b_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c                            fg=243,bg=232 # fg=#767676,bg=#080808
  ble-face -s vim_airline_c_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c_inactive_modified          fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_insert_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_normal_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_replace_modified           fg=160,bg=232 # fg=#df0000,bg=#080808
  ble-face -s vim_airline_c_visual_modified            fg=160,bg=232 # fg=#df0000,bg=#080808
}
