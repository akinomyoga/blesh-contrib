# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_londontube.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 London Tube Scheme by Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_londontube/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=24,bg=29   # fg=#1c3f95,bg=#00853e
  ble-face -s vim_airline_a_inactive                   fg=192,bg=24  # fg=#d9d8d8,bg=#1c3f95
  ble-face -s vim_airline_a_insert                     fg=24,bg=38   # fg=#1c3f95,bg=#009ddc
  ble-face -s vim_airline_a_replace                    fg=24,bg=196  # fg=#1c3f95,bg=#ee2e24
  ble-face -s vim_airline_a_visual                     fg=24,bg=89   # fg=#1c3f95,bg=#98005d
  ble-face -s vim_airline_b                            fg=254,bg=240 # fg=#e7e7e8,bg=#5a5758
  ble-face -s vim_airline_b_inactive                   fg=192,bg=24  # fg=#d9d8d8,bg=#1c3f95
  ble-face -s vim_airline_c                            fg=211,bg=24  # fg=#f386a1,bg=#1c3f95
  ble-face -s vim_airline_c_inactive                   fg=192,bg=24  # fg=#d9d8d8,bg=#1c3f95
}
