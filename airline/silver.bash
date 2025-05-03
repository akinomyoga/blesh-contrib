# From github:vim-airline/vim-airline-themes/autoload/airline/themes/silver.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:silver/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=254 # fg=#414141,bg=#e1e1e1
  ble-face -s vim_airline_a_inactive                   fg=247,bg=253 # fg=#a1a1a1,bg=#dddddd
  ble-face -s vim_airline_a_insert                     fg=29,bg=254  # fg=#0d935c,bg=#e1e1e1
  ble-face -s vim_airline_a_replace                    fg=124,bg=254 # fg=#b30000,bg=#e1e1e1
  ble-face -s vim_airline_a_visual                     fg=19,bg=254  # fg=#0000b3,bg=#e1e1e1
  ble-face -s vim_airline_b                            fg=238,bg=254 # fg=#414141,bg=#e1e1e1
  ble-face -s vim_airline_b_inactive                   fg=247,bg=253 # fg=#a1a1a1,bg=#dddddd
  ble-face -s vim_airline_b_insert                     fg=29,bg=254  # fg=#0d935c,bg=#e1e1e1
  ble-face -s vim_airline_b_visual                     fg=19,bg=254  # fg=#0000b3,bg=#e1e1e1
  ble-face -s vim_airline_c                            fg=238,bg=254 # fg=#414141,bg=#e1e1e1
  ble-face -s vim_airline_c_inactive                   fg=247,bg=253 # fg=#a1a1a1,bg=#dddddd
  ble-face -s vim_airline_c_inactive_modified          fg=166,bg=16  # fg=#e25000,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=29,bg=254  # fg=#0d935c,bg=#e1e1e1
  ble-face -s vim_airline_c_insert_modified            fg=166,bg=254 # fg=#e25000,bg=#e1e1e1
  ble-face -s vim_airline_c_normal_modified            fg=166,bg=254 # fg=#e25000,bg=#e1e1e1
  ble-face -s vim_airline_c_replace_modified           fg=166,bg=254 # fg=#e25000,bg=#e1e1e1
  ble-face -s vim_airline_c_visual                     fg=19,bg=254  # fg=#0000b3,bg=#e1e1e1
  ble-face -s vim_airline_c_visual_modified            fg=166,bg=254 # fg=#e25000,bg=#e1e1e1
  ble-face -s vim_airline_warning                      fg=196,bg=254 # fg=#ff0000,bg=#e1e1e1
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
