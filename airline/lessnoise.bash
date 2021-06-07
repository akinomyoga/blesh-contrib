# From github:vim-airline/vim-airline-themes/autoload/airline/themes/lessnoise.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim: et:ts=2:sts:sw=2
# Author: @bekcpear
# https://gist.github.com/bekcpear/41fb86e0817dfb6620b757daf1e2aab0

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:lessnoise/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=159 # fg=#121212,bg=#afffff
  ble-face -s vim_airline_a_inactive                   fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_a_insert                     fg=233,bg=218 # fg=#121212,bg=#ffafd7
  ble-face -s vim_airline_a_replace                    fg=233,bg=203 # fg=#121212,bg=#ff5f5f
  ble-face -s vim_airline_a_visual                     fg=233,bg=229 # fg=#121212,bg=#ffffaf
  ble-face -s vim_airline_b                            fg=255,bg=236 # fg=#eeeeee,bg=#303030
  ble-face -s vim_airline_b_commandline                fg=159,bg=159 # fg=#afffff,bg=#afffff
  ble-face -s vim_airline_b_inactive                   fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_c                            fg=247,bg=236 # fg=#9e9e9e,bg=#303030
  ble-face -s vim_airline_c_commandline                fg=233,bg=159 # fg=#121212,bg=#afffff
  ble-face -s vim_airline_c_inactive                   fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_c_inactive_modified          fg=249,bg=236 # fg=#b2b2b2,bg=#303030
  ble-face -s vim_airline_c_insert_modified            fg=249,bg=236 # fg=#b2b2b2,bg=#303030
  ble-face -s vim_airline_c_normal_modified            fg=249,bg=236 # fg=#b2b2b2,bg=#303030
  ble-face -s vim_airline_c_replace_modified           fg=249,bg=236 # fg=#b2b2b2,bg=#303030
  ble-face -s vim_airline_c_visual_modified            fg=249,bg=236 # fg=#b2b2b2,bg=#303030
  ble-face -s vim_airline_x_insert                     fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_x_normal                     fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_x_replace                    fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_x_visual                     fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_y_inactive                   fg=236,bg=236 # fg=#303030,bg=#303030
  ble-face -s vim_airline_y_insert                     fg=236,bg=236 # fg=#303030,bg=#303030
  ble-face -s vim_airline_y_normal                     fg=236,bg=236 # fg=#303030,bg=#303030
  ble-face -s vim_airline_y_replace                    fg=236,bg=236 # fg=#303030,bg=#303030
  ble-face -s vim_airline_y_visual                     fg=236,bg=236 # fg=#303030,bg=#303030
  ble-face -s vim_airline_z_insert                     fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_z_normal                     fg=242,bg=236 # fg=#6c6c6c,bg=#303030
  ble-face -s vim_airline_z_replace                    fg=242,bg=236 # fg=#6c6c6c,bg=#303030
}
