# From github:vim-airline/vim-airline-themes/autoload/airline/themes/kalisi.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
#
# Colorscheme: Kalisi for airline. Inspired by powerline.
# Arthur Jaron
# hifreeo@gmail.com
# 24.10.2014 

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:kalisi/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=148  # fg=#005f00,bg=#afd700
  ble-face -s vim_airline_a_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_insert                     fg=231,bg=160 # fg=#ffffff,bg=#e80000
  ble-face -s vim_airline_a_replace                    fg=171,bg=231 # fg=#d75fff,bg=#ffffff
  ble-face -s vim_airline_a_visual                     fg=33,bg=231  # fg=#0087ff,bg=#ffffff
  ble-face -s vim_airline_b                            fg=148,bg=22  # fg=#afd700,bg=#005f00
  ble-face -s vim_airline_b_inactive                   fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_b_insert                     fg=196,bg=52  # fg=#ff0000,bg=#5f0000
  ble-face -s vim_airline_b_replace                    fg=53,bg=171  # fg=#5f005f,bg=#d75fff
  ble-face -s vim_airline_b_visual                     fg=25,bg=75   # fg=#005faf,bg=#5fafff
  ble-face -s vim_airline_c                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_inactive_modified          fg=190,bg=16  # fg=#d7ff00,bg=#000000
  ble-face -s vim_airline_c_replace                    fg=213,bg=91  # fg=#ff87ff,bg=#8700af
  ble-face -s vim_airline_c_visual                     fg=117,bg=25  # fg=#87d7ff,bg=#005faf
}
