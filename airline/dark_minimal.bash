# From github:vim-airline/vim-airline-themes/autoload/airline/themes/dark_minimal.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:dark_minimal/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=190  # fg=#00005f,bg=#dfff00
  ble-face -s vim_airline_b                            fg=231,bg=238 # fg=#ffffff,bg=#444444
  ble-face -s vim_airline_c                            fg=158,bg=234 # fg=#9cffd3,bg=#202020
}
