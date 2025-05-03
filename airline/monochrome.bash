# From github:vim-airline/vim-airline-themes/autoload/airline/themes/monochrome.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:monochrome/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_b                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_error                        fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_term                         fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_warning                      fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
