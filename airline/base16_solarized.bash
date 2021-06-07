# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_solarized.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Solarized Scheme by Ethan Schoonover (http://ethanschoonover.com/solarized)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_solarized/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=100  # fg=#073642,bg=#859900
  ble-face -s vim_airline_a_inactive                   fg=109,bg=23  # fg=#93a1a1,bg=#073642
  ble-face -s vim_airline_a_insert                     fg=23,bg=32   # fg=#073642,bg=#268bd2
  ble-face -s vim_airline_a_replace                    fg=23,bg=166  # fg=#073642,bg=#dc322f
  ble-face -s vim_airline_a_visual                     fg=23,bg=62   # fg=#073642,bg=#6c71c4
  ble-face -s vim_airline_b                            fg=224,bg=60  # fg=#eee8d5,bg=#586e75
  ble-face -s vim_airline_b_inactive                   fg=109,bg=23  # fg=#93a1a1,bg=#073642
  ble-face -s vim_airline_c                            fg=166,bg=23  # fg=#cb4b16,bg=#073642
  ble-face -s vim_airline_c_inactive                   fg=109,bg=23  # fg=#93a1a1,bg=#073642
}
