# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_classic.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Classic Scheme by Jason Heeris (http://heeris.id.au)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_classic/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=107 # fg=#202020,bg=#90a959
  ble-face -s vim_airline_a_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_a_insert                     fg=234,bg=73  # fg=#202020,bg=#6a9fb5
  ble-face -s vim_airline_a_replace                    fg=234,bg=131 # fg=#202020,bg=#ac4142
  ble-face -s vim_airline_a_visual                     fg=234,bg=139 # fg=#202020,bg=#aa759f
  ble-face -s vim_airline_b                            fg=254,bg=236 # fg=#e0e0e0,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
  ble-face -s vim_airline_c                            fg=173,bg=234 # fg=#d28445,bg=#202020
  ble-face -s vim_airline_c_inactive                   fg=252,bg=234 # fg=#d0d0d0,bg=#202020
}
