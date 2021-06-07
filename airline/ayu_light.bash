# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ayu_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Normal mode
# (Dark)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ayu_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=66,bg=106  # fg=#6c7680,bg=#86b300
  ble-face -s vim_airline_a_inactive                   fg=106,bg=231 # fg=#86b300,bg=#fafafa
  ble-face -s vim_airline_a_insert                     fg=66,bg=74   # fg=#6c7680,bg=#55b4d4
  ble-face -s vim_airline_a_replace                    fg=66,bg=196  # fg=#6c7680,bg=#f51818
  ble-face -s vim_airline_a_visual                     fg=66,bg=209  # fg=#6c7680,bg=#fa8d3e
  ble-face -s vim_airline_b                            fg=106,bg=66  # fg=#86b300,bg=#6c7680
  ble-face -s vim_airline_b_inactive                   fg=106,bg=231 # fg=#86b300,bg=#fafafa
  ble-face -s vim_airline_b_insert                     fg=74,bg=66   # fg=#55b4d4,bg=#6c7680
  ble-face -s vim_airline_b_replace                    fg=106,bg=66  # fg=#86b300,bg=#6c7680
  ble-face -s vim_airline_b_visual                     fg=209,bg=66  # fg=#fa8d3e,bg=#6c7680
  ble-face -s vim_airline_c                            fg=66,bg=231  # fg=#6c7680,bg=#fafafa
  ble-face -s vim_airline_c_inactive                   fg=106,bg=231 # fg=#86b300,bg=#fafafa
  ble-face -s vim_airline_z_replace                    fg=66,bg=106  # fg=#6c7680,bg=#86b300
}
