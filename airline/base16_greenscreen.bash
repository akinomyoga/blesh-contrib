# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_greenscreen.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Green Screen Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_greenscreen/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=34   # fg=#003300,bg=#00bb00
  ble-face -s vim_airline_a_inactive                   fg=34,bg=22   # fg=#00bb00,bg=#003300
  ble-face -s vim_airline_a_insert                     fg=22,bg=28   # fg=#003300,bg=#009900
  ble-face -s vim_airline_a_replace                    fg=22,bg=28   # fg=#003300,bg=#007700
  ble-face -s vim_airline_b                            fg=40,bg=22   # fg=#00dd00,bg=#005500
  ble-face -s vim_airline_b_inactive                   fg=34,bg=22   # fg=#00bb00,bg=#003300
  ble-face -s vim_airline_c                            fg=28,bg=22   # fg=#009900,bg=#003300
  ble-face -s vim_airline_c_inactive                   fg=34,bg=22   # fg=#00bb00,bg=#003300
}
