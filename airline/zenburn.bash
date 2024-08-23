# From github:vim-airline/vim-airline-themes/autoload/airline/themes/zenburn.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:zenburn/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=18  # fg=#ffffff,bg=#00008b
  ble-face -s vim_airline_a_inactive                   fg=21,bg=231  # fg=#0000ff,bg=#ffffff
  ble-face -s vim_airline_a_insert                     fg=231,bg=201 # fg=#ffffff,bg=#ff00ff
  ble-face -s vim_airline_a_replace                    fg=231,bg=21  # fg=#ffffff,bg=#0000ff
  ble-face -s vim_airline_a_visual                     fg=231,bg=30  # fg=#ffffff,bg=#008b8b
  ble-face -s vim_airline_b                            fg=18,bg=252  # fg=#00008b,bg=#d3d3d3
  ble-face -s vim_airline_b_inactive                   fg=21,bg=231  # fg=#0000ff,bg=#ffffff
  ble-face -s vim_airline_b_insert                     fg=201,bg=252 # fg=#ff00ff,bg=#d3d3d3
  ble-face -s vim_airline_b_replace                    fg=21,bg=252  # fg=#0000ff,bg=#d3d3d3
  ble-face -s vim_airline_b_visual                     fg=30,bg=252  # fg=#008b8b,bg=#d3d3d3
  ble-face -s vim_airline_c                            fg=21,bg=231  # fg=#0000ff,bg=#ffffff
}
