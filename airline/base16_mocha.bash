# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_mocha.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Mocha Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_mocha/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=143 # fg=#534636,bg=#beb55b
  ble-face -s vim_airline_a_inactive                   fg=251,bg=238 # fg=#d0c8c6,bg=#534636
  ble-face -s vim_airline_a_insert                     fg=238,bg=109 # fg=#534636,bg=#8ab3b5
  ble-face -s vim_airline_a_replace                    fg=238,bg=168 # fg=#534636,bg=#cb6077
  ble-face -s vim_airline_a_visual                     fg=238,bg=248 # fg=#534636,bg=#a89bb9
  ble-face -s vim_airline_b                            fg=254,bg=239 # fg=#e9e1dd,bg=#645240
  ble-face -s vim_airline_b_inactive                   fg=251,bg=238 # fg=#d0c8c6,bg=#534636
  ble-face -s vim_airline_c                            fg=173,bg=238 # fg=#d28b71,bg=#534636
  ble-face -s vim_airline_c_inactive                   fg=251,bg=238 # fg=#d0c8c6,bg=#534636
}
