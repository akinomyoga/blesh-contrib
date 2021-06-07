# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_nord.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline theme by gretzky (https://github.com/gretzky)
# nord scheme by arcticstudio
# (https://github.com/arcticicestudio/nord)
# base 16 from (https://github.com/ada-lovecraft/base16-nord-scheme/blob/master/nord.yaml)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_nord/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=131 # fg=#3b4252,bg=#bf616a
  ble-face -s vim_airline_a_inactive                   fg=189,bg=238 # fg=#e5e9f0,bg=#3b4252
  ble-face -s vim_airline_a_insert                     fg=238,bg=222 # fg=#3b4252,bg=#ebcb8b
  ble-face -s vim_airline_a_replace                    fg=238,bg=110 # fg=#3b4252,bg=#88c0d0
  ble-face -s vim_airline_a_visual                     fg=238,bg=144 # fg=#3b4252,bg=#a3be8c
  ble-face -s vim_airline_b                            fg=255,bg=239 # fg=#eceff4,bg=#434c5e
  ble-face -s vim_airline_b_inactive                   fg=189,bg=238 # fg=#e5e9f0,bg=#3b4252
  ble-face -s vim_airline_c                            fg=109,bg=238 # fg=#81a1c1,bg=#3b4252
  ble-face -s vim_airline_c_inactive                   fg=189,bg=238 # fg=#e5e9f0,bg=#3b4252
}
