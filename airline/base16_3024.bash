# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_3024.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 3024 Scheme by Jan T. Sott (http://github.com/idleberg)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_3024/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=35  # fg=#3a3432,bg=#01a252
  ble-face -s vim_airline_a_inactive                   fg=248,bg=237 # fg=#a5a2a2,bg=#3a3432
  ble-face -s vim_airline_a_insert                     fg=237,bg=38  # fg=#3a3432,bg=#01a0e4
  ble-face -s vim_airline_a_replace                    fg=237,bg=160 # fg=#3a3432,bg=#db2d20
  ble-face -s vim_airline_a_visual                     fg=237,bg=132 # fg=#3a3432,bg=#a16a94
  ble-face -s vim_airline_b                            fg=189,bg=238 # fg=#d6d5d4,bg=#4a4543
  ble-face -s vim_airline_b_inactive                   fg=248,bg=237 # fg=#a5a2a2,bg=#3a3432
  ble-face -s vim_airline_c                            fg=182,bg=237 # fg=#e8bbd0,bg=#3a3432
  ble-face -s vim_airline_c_inactive                   fg=248,bg=237 # fg=#a5a2a2,bg=#3a3432
}
