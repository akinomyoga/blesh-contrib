# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_mexico_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Mexico Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Sheldon Johnson

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_mexico_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=240 # fg=#e8e8e8,bg=#585858
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e8e8e8,bg=#e8e8e8
  ble-face -s vim_airline_a_insert                     fg=254,bg=65  # fg=#e8e8e8,bg=#538947
  ble-face -s vim_airline_a_replace                    fg=254,bg=97  # fg=#e8e8e8,bg=#96609e
  ble-face -s vim_airline_a_visual                     fg=254,bg=173 # fg=#e8e8e8,bg=#dc9656
  ble-face -s vim_airline_b                            fg=240,bg=192 # fg=#585858,bg=#d8d8d8
  ble-face -s vim_airline_b_inactive                   fg=240,bg=254 # fg=#585858,bg=#e8e8e8
  ble-face -s vim_airline_c                            fg=240,bg=254 # fg=#585858,bg=#e8e8e8
  ble-face -s vim_airline_c_inactive                   fg=237,bg=254 # fg=#383838,bg=#e8e8e8
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=254 # fg=#181818,bg=#e8e8e8
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=254 # fg=#181818,bg=#e8e8e8
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=254 # fg=#181818,bg=#e8e8e8
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=254 # fg=#181818,bg=#e8e8e8
}
