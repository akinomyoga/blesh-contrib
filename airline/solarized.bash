# From github:vim-airline/vim-airline-themes/autoload/airline/themes/solarized.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:solarized/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=224,bg=66  # fg=#eee8d5,bg=#657b83
  ble-face -s vim_airline_a_inactive                   fg=224,bg=102 # fg=#eee8d5,bg=#839496
  ble-face -s vim_airline_a_insert                     fg=224,bg=136 # fg=#eee8d5,bg=#b58900
  ble-face -s vim_airline_a_replace                    fg=224,bg=166 # fg=#eee8d5,bg=#dc322f
  ble-face -s vim_airline_a_visual                     fg=224,bg=168 # fg=#eee8d5,bg=#d33682
  ble-face -s vim_airline_b                            fg=224,bg=109 # fg=#eee8d5,bg=#93a1a1
  ble-face -s vim_airline_b_inactive                   fg=224,bg=102 # fg=#eee8d5,bg=#839496
  ble-face -s vim_airline_c                            fg=109,bg=224 # fg=#93a1a1,bg=#eee8d5
  ble-face -s vim_airline_c_inactive                   fg=224,bg=102 # fg=#eee8d5,bg=#839496
  ble-face -s vim_airline_c_inactive_modified          fg=23,bg=0    # fg=#073642,bg=0
  ble-face -s vim_airline_c_insert_modified            fg=60,bg=224  # fg=#586e75,bg=#eee8d5
  ble-face -s vim_airline_c_normal_modified            fg=60,bg=224  # fg=#586e75,bg=#eee8d5
  ble-face -s vim_airline_c_replace_modified           fg=60,bg=224  # fg=#586e75,bg=#eee8d5
  ble-face -s vim_airline_c_visual_modified            fg=60,bg=224  # fg=#586e75,bg=#eee8d5
  ble-face -s vim_airline_error                        fg=230,bg=166 # fg=#fdf6e3,bg=#cb4b16
  ble-face -s vim_airline_error_default                fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_insert                 fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_normal_modified        fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_visual                 fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=230,bg=166 # fg=#fdf6e3,bg=#cb4b16
  ble-face -s vim_airline_warning_default              fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
