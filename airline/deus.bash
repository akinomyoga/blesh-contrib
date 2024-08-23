# From github:vim-airline/vim-airline-themes/autoload/airline/themes/deus.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:deus/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=114  # fg=#282c34,bg=#98c379
  ble-face -s vim_airline_a_inactive                   fg=17,bg=249  # fg=#282c34,bg=#abb2bf
  ble-face -s vim_airline_a_insert                     fg=17,bg=75   # fg=#282c34,bg=#61afef
  ble-face -s vim_airline_a_replace                    fg=17,bg=168  # fg=#282c34,bg=#e06c75
  ble-face -s vim_airline_a_visual                     fg=17,bg=176  # fg=#282c34,bg=#c678dd
  ble-face -s vim_airline_b                            fg=249,bg=238 # fg=#abb2bf,bg=#3e4452
  ble-face -s vim_airline_c                            fg=114,bg=17  # fg=#98c379,bg=#282c34
  ble-face -s vim_airline_c_inactive                   fg=249,bg=238 # fg=#abb2bf,bg=#3e4452
  ble-face -s vim_airline_c_inactive_modified          fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_insert                     fg=75,bg=17   # fg=#61afef,bg=#282c34
  ble-face -s vim_airline_c_insert_modified            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_normal_modified            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_replace                    fg=168,bg=17  # fg=#e06c75,bg=#282c34
  ble-face -s vim_airline_c_replace_modified           fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_visual                     fg=176,bg=17  # fg=#c678dd,bg=#282c34
  ble-face -s vim_airline_c_visual_modified            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_error                        fg=17,bg=168  # fg=#282c34,bg=#e06c75
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=17,bg=180  # fg=#282c34,bg=#e5c07b
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
