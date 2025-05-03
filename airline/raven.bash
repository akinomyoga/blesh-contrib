# From github:vim-airline/vim-airline-themes/autoload/airline/themes/raven.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:raven/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=251,bg=236 # fg=#c8c8c8,bg=#2e2e2e
  ble-face -s vim_airline_a_inactive                   fg=61,bg=235  # fg=#5e5e5e,bg=#222222
  ble-face -s vim_airline_a_insert                     fg=36,bg=236  # fg=#11c279,bg=#2e2e2e
  ble-face -s vim_airline_a_replace                    fg=160,bg=236 # fg=#e60000,bg=#2e2e2e
  ble-face -s vim_airline_a_visual                     fg=63,bg=236  # fg=#6565ff,bg=#2e2e2e
  ble-face -s vim_airline_b                            fg=251,bg=236 # fg=#c8c8c8,bg=#2e2e2e
  ble-face -s vim_airline_b_inactive                   fg=61,bg=235  # fg=#5e5e5e,bg=#222222
  ble-face -s vim_airline_b_insert                     fg=36,bg=236  # fg=#11c279,bg=#2e2e2e
  ble-face -s vim_airline_b_visual                     fg=63,bg=236  # fg=#6565ff,bg=#2e2e2e
  ble-face -s vim_airline_c                            fg=251,bg=236 # fg=#c8c8c8,bg=#2e2e2e
  ble-face -s vim_airline_c_inactive                   fg=61,bg=235  # fg=#5e5e5e,bg=#222222
  ble-face -s vim_airline_c_inactive_modified          fg=166,bg=16  # fg=#e25000,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=36,bg=236  # fg=#11c279,bg=#2e2e2e
  ble-face -s vim_airline_c_insert_modified            fg=166,bg=236 # fg=#e25000,bg=#2e2e2e
  ble-face -s vim_airline_c_normal_modified            fg=166,bg=236 # fg=#e25000,bg=#2e2e2e
  ble-face -s vim_airline_c_replace_modified           fg=166,bg=236 # fg=#e25000,bg=#2e2e2e
  ble-face -s vim_airline_c_visual                     fg=63,bg=236  # fg=#6565ff,bg=#2e2e2e
  ble-face -s vim_airline_c_visual_modified            fg=166,bg=236 # fg=#e25000,bg=#2e2e2e
  ble-face -s vim_airline_warning                      fg=196,bg=236 # fg=#ff0000,bg=#2e2e2e
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
