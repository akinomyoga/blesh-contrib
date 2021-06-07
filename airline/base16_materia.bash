# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_materia.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Materia vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Defman21

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_materia/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=23,bg=252  # fg=#2c393f,bg=#c9ccd3
  ble-face -s vim_airline_a_inactive                   fg=23,bg=23   # fg=#2c393f,bg=#2c393f
  ble-face -s vim_airline_a_insert                     fg=23,bg=113  # fg=#2c393f,bg=#8bd649
  ble-face -s vim_airline_a_replace                    fg=23,bg=111  # fg=#2c393f,bg=#82aaff
  ble-face -s vim_airline_a_visual                     fg=23,bg=173  # fg=#2c393f,bg=#ea9560
  ble-face -s vim_airline_b                            fg=252,bg=238 # fg=#c9ccd3,bg=#37474f
  ble-face -s vim_airline_b_inactive                   fg=252,bg=23  # fg=#c9ccd3,bg=#2c393f
  ble-face -s vim_airline_c                            fg=252,bg=23  # fg=#c9ccd3,bg=#2c393f
  ble-face -s vim_airline_c_inactive                   fg=189,bg=23  # fg=#cdd3de,bg=#2c393f
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=23  # fg=#ffffff,bg=#2c393f
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=23  # fg=#ffffff,bg=#2c393f
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=23  # fg=#ffffff,bg=#2c393f
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=23  # fg=#ffffff,bg=#2c393f
}
