# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_gigavolt.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Gigavolt vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Aidan Swope (http://github.com/Whillikers)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_gigavolt/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=189  # fg=#2d303d,bg=#cad3ff
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#2d303d,bg=#2d303d
  ble-face -s vim_airline_a_insert                     fg=23,bg=223  # fg=#2d303d,bg=#f2e6a9
  ble-face -s vim_airline_a_replace                    fg=23,bg=141  # fg=#2d303d,bg=#ae94f9
  ble-face -s vim_airline_a_visual                     fg=23,bg=48   # fg=#2d303d,bg=#19f988
  ble-face -s vim_airline_b                            fg=189,bg=63  # fg=#cad3ff,bg=#5a576e
  ble-face -s vim_airline_b_inactive                   fg=189,bg=23  # fg=#cad3ff,bg=#2d303d
  ble-face -s vim_airline_c                            fg=189,bg=23  # fg=#cad3ff,bg=#2d303d
  ble-face -s vim_airline_c_inactive                   fg=254,bg=23  # fg=#e9e7e1,bg=#2d303d
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#f2fbff,bg=#2d303d
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#f2fbff,bg=#2d303d
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#f2fbff,bg=#2d303d
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#f2fbff,bg=#2d303d
}
