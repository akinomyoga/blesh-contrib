# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_icy.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Icy Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By icyphox (https://icyphox.ga)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_icy/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=23  # fg=#031619,bg=#064048
  ble-face -s vim_airline_a_inactive                   fg=233,bg=233 # fg=#031619,bg=#031619
  ble-face -s vim_airline_a_insert                     fg=233,bg=80  # fg=#031619,bg=#4dd0e1
  ble-face -s vim_airline_a_replace                    fg=233,bg=37  # fg=#031619,bg=#00acc1
  ble-face -s vim_airline_a_visual                     fg=233,bg=159 # fg=#031619,bg=#b3ebf2
  ble-face -s vim_airline_b                            fg=23,bg=234  # fg=#064048,bg=#041f23
  ble-face -s vim_airline_b_inactive                   fg=23,bg=233  # fg=#064048,bg=#031619
  ble-face -s vim_airline_c                            fg=23,bg=233  # fg=#064048,bg=#031619
  ble-face -s vim_airline_c_inactive                   fg=23,bg=233  # fg=#095b67,bg=#031619
  ble-face -s vim_airline_c_insert_modified            fg=37,bg=233  # fg=#109cb0,bg=#031619
  ble-face -s vim_airline_c_normal_modified            fg=37,bg=233  # fg=#109cb0,bg=#031619
  ble-face -s vim_airline_c_replace_modified           fg=37,bg=233  # fg=#109cb0,bg=#031619
  ble-face -s vim_airline_c_visual_modified            fg=37,bg=233  # fg=#109cb0,bg=#031619
}
