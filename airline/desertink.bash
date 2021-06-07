# From github:vim-airline/vim-airline-themes/autoload/airline/themes/desertink.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Based on powerlinish
#
# Theme to mimic the default colorscheme of powerline
# Not 100% the same so it's powerline... ish.
#
# Differences from default powerline:
# * Paste indicator isn't colored different
# * Far right hand section matches the color of the mode indicator
#
# Differences from other airline themes:
# * No color differences when you're in a modified buffer
# * Visual mode only changes the mode section. Otherwise
#   it appears the same as normal mode

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:desertink/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=148  # fg=#005f00,bg=#afd700
  ble-face -s vim_airline_a_inactive                   fg=243,bg=239 # fg=#777777,bg=#4a4a4a
  ble-face -s vim_airline_a_insert                     fg=231,bg=23  # fg=#ffffff,bg=#004866
  ble-face -s vim_airline_a_normal_modified            fg=88,bg=208  # fg=#870000,bg=#ff8700
  ble-face -s vim_airline_a_replace                    fg=231,bg=167 # fg=#ffffff,bg=#d74444
  ble-face -s vim_airline_a_visual                     fg=232,bg=214 # fg=#080808,bg=#ffaf00
  ble-face -s vim_airline_b                            fg=250,bg=238 # fg=#bbbbbb,bg=#444444
  ble-face -s vim_airline_b_inactive                   fg=243,bg=237 # fg=#777777,bg=#3a3a3a
  ble-face -s vim_airline_b_insert                     fg=117,bg=31  # fg=#99ddff,bg=#0087af
  ble-face -s vim_airline_b_replace                    fg=250,bg=238 # fg=#bbbbbb,bg=#444444
  ble-face -s vim_airline_c                            fg=231,bg=236 # fg=#ffffff,bg=#303030
  ble-face -s vim_airline_c_inactive                   fg=247,bg=236 # fg=#999999,bg=#303030
  ble-face -s vim_airline_z_normal_modified            fg=88,bg=208  # fg=#870000,bg=#ff8700
}
