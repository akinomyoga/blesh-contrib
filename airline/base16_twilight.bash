# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_twilight.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Twilight Scheme by David Hart (http://hart-dev.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_twilight/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=107 # fg=#323537,bg=#8f9d6a
  ble-face -s vim_airline_a_inactive                   fg=248,bg=237 # fg=#a7a7a7,bg=#323537
  ble-face -s vim_airline_a_insert                     fg=237,bg=103 # fg=#323537,bg=#7587a6
  ble-face -s vim_airline_a_replace                    fg=237,bg=167 # fg=#323537,bg=#cf6a4c
  ble-face -s vim_airline_a_visual                     fg=237,bg=139 # fg=#323537,bg=#9b859d
  ble-face -s vim_airline_b                            fg=251,bg=239 # fg=#c3c3c3,bg=#464b50
  ble-face -s vim_airline_b_inactive                   fg=248,bg=237 # fg=#a7a7a7,bg=#323537
  ble-face -s vim_airline_c                            fg=179,bg=237 # fg=#cda869,bg=#323537
  ble-face -s vim_airline_c_inactive                   fg=248,bg=237 # fg=#a7a7a7,bg=#323537
}
