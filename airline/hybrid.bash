# From github:vim-airline/vim-airline-themes/autoload/airline/themes/hybrid.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of Hybrid
# (https://github.com/w0ng/vim-hybrid)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:hybrid/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=16,bg=152  # fg=#000000,bg=#add8e6
  ble-face -s vim_airline_a_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_insert                     fg=231,bg=196 # fg=#ffffff,bg=#ff0000
  ble-face -s vim_airline_a_replace                    fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_a_visual                     fg=16,bg=195  # fg=#000000,bg=#e0ffff
  ble-face -s vim_airline_b                            fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_b_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c                            fg=16,bg=213  # fg=#000000,bg=#ff8bff
  ble-face -s vim_airline_c_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_warning                      fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_warning_inactive_modified    fg=-1,bg=-1   # fg=-1,bg=-1
}
