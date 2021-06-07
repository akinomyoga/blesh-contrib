# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_codeschool.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Codeschool Scheme by brettof86

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_codeschool/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=30   # fg=#1c3657,bg=#237986
  ble-face -s vim_airline_a_inactive                   fg=248,bg=23  # fg=#9ea7a6,bg=#1c3657
  ble-face -s vim_airline_a_insert                     fg=23,bg=60   # fg=#1c3657,bg=#484d79
  ble-face -s vim_airline_a_replace                    fg=23,bg=24   # fg=#1c3657,bg=#2a5491
  ble-face -s vim_airline_a_visual                     fg=23,bg=172  # fg=#1c3657,bg=#c59820
  ble-face -s vim_airline_b                            fg=151,bg=23  # fg=#a7cfa3,bg=#2a343a
  ble-face -s vim_airline_b_inactive                   fg=248,bg=23  # fg=#9ea7a6,bg=#1c3657
  ble-face -s vim_airline_c                            fg=64,bg=23   # fg=#43820d,bg=#1c3657
  ble-face -s vim_airline_c_inactive                   fg=248,bg=23  # fg=#9ea7a6,bg=#1c3657
}
