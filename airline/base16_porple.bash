# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_porple.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Porple vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Niek den Breeje (https://github.com/AuditeMarlow)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_porple/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=250 # fg=#333344,bg=#b8b8b8
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#333344,bg=#333344
  ble-face -s vim_airline_a_insert                     fg=237,bg=113 # fg=#333344,bg=#95c76f
  ble-face -s vim_airline_a_replace                    fg=237,bg=132 # fg=#333344,bg=#b74989
  ble-face -s vim_airline_a_visual                     fg=237,bg=173 # fg=#333344,bg=#d28e5d
  ble-face -s vim_airline_b                            fg=250,bg=239 # fg=#b8b8b8,bg=#474160
  ble-face -s vim_airline_b_inactive                   fg=250,bg=237 # fg=#b8b8b8,bg=#333344
  ble-face -s vim_airline_c                            fg=250,bg=237 # fg=#b8b8b8,bg=#333344
  ble-face -s vim_airline_c_inactive                   fg=192,bg=237 # fg=#d8d8d8,bg=#333344
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=237 # fg=#f8f8f8,bg=#333344
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=237 # fg=#f8f8f8,bg=#333344
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=237 # fg=#f8f8f8,bg=#333344
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=237 # fg=#f8f8f8,bg=#333344
}
