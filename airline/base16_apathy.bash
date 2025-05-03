# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_apathy.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Apathy Scheme by Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_apathy/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=96   # fg=#0b342d,bg=#883e96
  ble-face -s vim_airline_a_inactive                   fg=109,bg=22  # fg=#81b5ac,bg=#0b342d
  ble-face -s vim_airline_a_insert                     fg=22,bg=101  # fg=#0b342d,bg=#96883e
  ble-face -s vim_airline_a_replace                    fg=22,bg=66   # fg=#0b342d,bg=#3e9688
  ble-face -s vim_airline_a_visual                     fg=22,bg=65   # fg=#0b342d,bg=#4c963e
  ble-face -s vim_airline_b                            fg=152,bg=23  # fg=#a7cec8,bg=#184e45
  ble-face -s vim_airline_b_inactive                   fg=109,bg=22  # fg=#81b5ac,bg=#0b342d
  ble-face -s vim_airline_c                            fg=66,bg=22   # fg=#3e7996,bg=#0b342d
  ble-face -s vim_airline_c_inactive                   fg=109,bg=22  # fg=#81b5ac,bg=#0b342d
}
