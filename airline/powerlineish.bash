# From github:vim-airline/vim-airline-themes/autoload/airline/themes/powerlineish.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
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

function ble/lib/vim-airline/theme:powerlineish/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=148  # fg=#005f00,bg=#afd700
  ble-face -s vim_airline_a_inactive                   fg=247,bg=233 # fg=#9e9e9e,bg=#121212
  ble-face -s vim_airline_a_insert                     fg=23,bg=231  # fg=#005f5f,bg=#ffffff
  ble-face -s vim_airline_a_replace                    fg=231,bg=160 # fg=#ffffff,bg=#d70000
  ble-face -s vim_airline_a_visual                     fg=232,bg=214 # fg=#080808,bg=#ffaf00
  ble-face -s vim_airline_b                            fg=247,bg=236 # fg=#9e9e9e,bg=#303030
  ble-face -s vim_airline_b_inactive                   fg=247,bg=233 # fg=#9e9e9e,bg=#121212
  ble-face -s vim_airline_b_insert                     fg=74,bg=31   # fg=#5fafd7,bg=#0087af
  ble-face -s vim_airline_b_replace                    fg=247,bg=236 # fg=#9e9e9e,bg=#303030
  ble-face -s vim_airline_c                            fg=231,bg=233 # fg=#ffffff,bg=#121212
  ble-face -s vim_airline_c_inactive                   fg=247,bg=233 # fg=#9e9e9e,bg=#121212
  ble-face -s vim_airline_c_insert                     fg=117,bg=24  # fg=#87d7ff,bg=#005f87
  ble-face -s vim_airline_c_replace                    fg=231,bg=233 # fg=#ffffff,bg=#121212
}
