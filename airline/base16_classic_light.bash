# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_classic_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Classic Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jason Heeris (http://heeris.id.au)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_classic_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=239 # fg=#e0e0e0,bg=#505050
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e0e0e0,bg=#e0e0e0
  ble-face -s vim_airline_a_insert                     fg=254,bg=107 # fg=#e0e0e0,bg=#90a959
  ble-face -s vim_airline_a_replace                    fg=254,bg=139 # fg=#e0e0e0,bg=#aa759f
  ble-face -s vim_airline_a_visual                     fg=254,bg=173 # fg=#e0e0e0,bg=#d28445
  ble-face -s vim_airline_b                            fg=239,bg=252 # fg=#505050,bg=#d0d0d0
  ble-face -s vim_airline_b_inactive                   fg=239,bg=254 # fg=#505050,bg=#e0e0e0
  ble-face -s vim_airline_c                            fg=239,bg=254 # fg=#505050,bg=#e0e0e0
  ble-face -s vim_airline_c_inactive                   fg=236,bg=254 # fg=#303030,bg=#e0e0e0
  ble-face -s vim_airline_c_insert_modified            fg=233,bg=254 # fg=#151515,bg=#e0e0e0
  ble-face -s vim_airline_c_normal_modified            fg=233,bg=254 # fg=#151515,bg=#e0e0e0
  ble-face -s vim_airline_c_replace_modified           fg=233,bg=254 # fg=#151515,bg=#e0e0e0
  ble-face -s vim_airline_c_visual_modified            fg=233,bg=254 # fg=#151515,bg=#e0e0e0
}
