# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_shapeshifter.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 shapeshifter Scheme by Tyler Benziger (http://tybenz.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_shapeshifter/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=232,bg=41  # fg=#040404,bg=#0ed839
  ble-face -s vim_airline_a_inactive                   fg=248,bg=232 # fg=#ababab,bg=#040404
  ble-face -s vim_airline_a_insert                     fg=232,bg=62  # fg=#040404,bg=#3b48e3
  ble-face -s vim_airline_a_replace                    fg=232,bg=160 # fg=#040404,bg=#e92f2f
  ble-face -s vim_airline_a_visual                     fg=232,bg=212 # fg=#040404,bg=#f996e2
  ble-face -s vim_airline_b                            fg=254,bg=234 # fg=#e0e0e0,bg=#102015
  ble-face -s vim_airline_b_inactive                   fg=248,bg=232 # fg=#ababab,bg=#040404
  ble-face -s vim_airline_c                            fg=173,bg=232 # fg=#e09448,bg=#040404
  ble-face -s vim_airline_c_inactive                   fg=248,bg=232 # fg=#ababab,bg=#040404
}
