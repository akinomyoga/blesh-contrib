# From github:vim-airline/vim-airline-themes/autoload/airline/themes/seagull.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Airline theme for Seabird/Seagull:
# https://github.com/nightsense/seabird/blob/master/colors/seagull.vim
#
# Based on Solarized theme code:
# https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/solarized.vim

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:seagull/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=189,bg=66  # fg=#e6eaed,bg=#6d767d
  ble-face -s vim_airline_a_inactive                   fg=189,bg=244 # fg=#e6eaed,bg=#787e82
  ble-face -s vim_airline_a_insert                     fg=189,bg=37  # fg=#e6eaed,bg=#00a5ab
  ble-face -s vim_airline_a_replace                    fg=189,bg=203 # fg=#e6eaed,bg=#ff4053
  ble-face -s vim_airline_a_visual                     fg=189,bg=34  # fg=#e6eaed,bg=#11ab00
  ble-face -s vim_airline_b                            fg=189,bg=102 # fg=#e6eaed,bg=#808487
  ble-face -s vim_airline_b_inactive                   fg=189,bg=244 # fg=#e6eaed,bg=#787e82
  ble-face -s vim_airline_c                            fg=102,bg=189 # fg=#808487,bg=#e6eaed
  ble-face -s vim_airline_c_inactive                   fg=189,bg=244 # fg=#e6eaed,bg=#787e82
  ble-face -s vim_airline_c_inactive_modified          fg=235,bg=231 # fg=#1d252b,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=60,bg=189  # fg=#61707a,bg=#e6eaed
  ble-face -s vim_airline_c_normal_modified            fg=60,bg=189  # fg=#61707a,bg=#e6eaed
  ble-face -s vim_airline_c_replace_modified           fg=60,bg=189  # fg=#61707a,bg=#e6eaed
  ble-face -s vim_airline_c_visual_modified            fg=60,bg=189  # fg=#61707a,bg=#e6eaed
  ble-face -s vim_airline_error                        fg=231,bg=202 # fg=#ffffff,bg=#ff6200
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_insert                 fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_normal_modified        fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_visual                 fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=231,bg=202 # fg=#ffffff,bg=#ff6200
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
