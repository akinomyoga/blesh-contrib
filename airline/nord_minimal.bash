# From github:vim-airline/vim-airline-themes/autoload/airline/themes/nord_minimal.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:nord_minimal/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=109,bg=239 # fg=#81a1c1,bg=#434c5e
  ble-face -s vim_airline_b                            fg=109,bg=239 # fg=#81a1c1,bg=#434c5e
  ble-face -s vim_airline_c                            fg=109,bg=239 # fg=#81a1c1,bg=#434c5e
}
