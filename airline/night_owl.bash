# From github:vim-airline/vim-airline-themes/autoload/airline/themes/night_owl.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Port/inspired from https://github.com/sdras/night-owl-vscode-theme
# Jared Ramirez 

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:night_owl/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=116  # fg=#282c34,bg=#83dcc8
  ble-face -s vim_airline_a_inactive                   fg=17,bg=176  # fg=#282c34,bg=#c792ea
  ble-face -s vim_airline_a_insert                     fg=17,bg=149  # fg=#282c34,bg=#afd75f
  ble-face -s vim_airline_a_replace                    fg=17,bg=222  # fg=#282c34,bg=#ffd787
  ble-face -s vim_airline_a_visual                     fg=17,bg=111  # fg=#282c34,bg=#81aaff
  ble-face -s vim_airline_b                            fg=17,bg=73   # fg=#282c34,bg=#68b0a0
  ble-face -s vim_airline_b_inactive                   fg=176,bg=17  # fg=#c792ea,bg=#282c34
  ble-face -s vim_airline_b_insert                     fg=17,bg=107  # fg=#282c34,bg=#8cac4c
  ble-face -s vim_airline_b_replace                    fg=17,bg=179  # fg=#282c34,bg=#ccac6c
  ble-face -s vim_airline_b_visual                     fg=17,bg=68   # fg=#282c34,bg=#6788cc
  ble-face -s vim_airline_c                            fg=116,bg=17  # fg=#83dcc8,bg=#282c34
  ble-face -s vim_airline_c_inactive                   fg=176,bg=17  # fg=#c792ea,bg=#282c34
  ble-face -s vim_airline_c_insert                     fg=149,bg=17  # fg=#afd75f,bg=#282c34
  ble-face -s vim_airline_c_replace                    fg=222,bg=17  # fg=#ffd787,bg=#282c34
  ble-face -s vim_airline_c_visual                     fg=111,bg=17  # fg=#81aaff,bg=#282c34
}
