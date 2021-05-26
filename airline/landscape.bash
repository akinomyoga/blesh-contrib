# From github:itchyny/landscape.vim/autoload/airline/themes/landscape.vim
#   The MIT License (MIT)
#   Copyright (c) 2012-2015 itchyny.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:landscape/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=21,bg=231  # fg=#0000ff,bg=#ffffff
  ble-face -s vim_airline_a_inactive                   fg=236,bg=233 # fg=#303030,bg=#121212
  ble-face -s vim_airline_a_insert                     fg=22,bg=231  # fg=#005f00,bg=#ffffff
  ble-face -s vim_airline_a_replace                    fg=124,bg=231 # fg=#af0000,bg=#ffffff
  ble-face -s vim_airline_a_visual                     fg=57,bg=231  # fg=#5f00ff,bg=#ffffff
  ble-face -s vim_airline_b                            fg=231,bg=21  # fg=#ffffff,bg=#0000ff
  ble-face -s vim_airline_b_inactive                   fg=236,bg=233 # fg=#303030,bg=#121212
  ble-face -s vim_airline_b_insert                     fg=231,bg=22  # fg=#ffffff,bg=#005f00
  ble-face -s vim_airline_b_replace                    fg=231,bg=124 # fg=#ffffff,bg=#af0000
  ble-face -s vim_airline_b_visual                     fg=231,bg=57  # fg=#ffffff,bg=#5f00ff
  ble-face -s vim_airline_c                            fg=231,bg=236 # fg=#ffffff,bg=#303030
  ble-face -s vim_airline_c_inactive                   fg=236,bg=233 # fg=#303030,bg=#121212
  ble-face -s vim_airline_x_insert                     fg=250,bg=240 # fg=#bcbcbc,bg=#585858
  ble-face -s vim_airline_x_normal                     fg=250,bg=240 # fg=#bcbcbc,bg=#585858
  ble-face -s vim_airline_x_replace                    fg=250,bg=240 # fg=#bcbcbc,bg=#585858
  ble-face -s vim_airline_x_visual                     fg=250,bg=240 # fg=#bcbcbc,bg=#585858
  ble-face -s vim_airline_y_insert                     fg=236,bg=245 # fg=#303030,bg=#8a8a8a
  ble-face -s vim_airline_y_normal                     fg=236,bg=245 # fg=#303030,bg=#8a8a8a
  ble-face -s vim_airline_y_replace                    fg=236,bg=245 # fg=#303030,bg=#8a8a8a
  ble-face -s vim_airline_y_visual                     fg=236,bg=245 # fg=#303030,bg=#8a8a8a
  ble-face -s vim_airline_z_insert                     fg=236,bg=252 # fg=#303030,bg=#d0d0d0
  ble-face -s vim_airline_z_normal                     fg=236,bg=252 # fg=#303030,bg=#d0d0d0
  ble-face -s vim_airline_z_replace                    fg=236,bg=252 # fg=#303030,bg=#d0d0d0
  ble-face -s vim_airline_z_visual                     fg=236,bg=252 # fg=#303030,bg=#d0d0d0
}
