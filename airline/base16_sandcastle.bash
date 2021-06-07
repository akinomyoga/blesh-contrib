# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_sandcastle.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Sandcastle vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By George Essig (https://github.com/gessig)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_sandcastle/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=244  # fg=#2c323b,bg=#928374
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#2c323b,bg=#2c323b
  ble-face -s vim_airline_a_insert                     fg=23,bg=66   # fg=#2c323b,bg=#528b8b
  ble-face -s vim_airline_a_replace                    fg=23,bg=167  # fg=#2c323b,bg=#d75f5f
  ble-face -s vim_airline_a_visual                     fg=23,bg=137  # fg=#2c323b,bg=#a07e3b
  ble-face -s vim_airline_b                            fg=244,bg=238 # fg=#928374,bg=#3e4451
  ble-face -s vim_airline_b_inactive                   fg=244,bg=23  # fg=#928374,bg=#2c323b
  ble-face -s vim_airline_c                            fg=244,bg=23  # fg=#928374,bg=#2c323b
  ble-face -s vim_airline_c_inactive                   fg=138,bg=23  # fg=#a89984,bg=#2c323b
  ble-face -s vim_airline_c_insert_modified            fg=229,bg=23  # fg=#fdf4c1,bg=#2c323b
  ble-face -s vim_airline_c_normal_modified            fg=229,bg=23  # fg=#fdf4c1,bg=#2c323b
  ble-face -s vim_airline_c_replace_modified           fg=229,bg=23  # fg=#fdf4c1,bg=#2c323b
  ble-face -s vim_airline_c_visual_modified            fg=229,bg=23  # fg=#fdf4c1,bg=#2c323b
}
