# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_grayscale_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Grayscale Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Alexandre Gavioli (https://github.com/Alexx2/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_grayscale_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=248 # fg=#252525,bg=#ababab
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#252525,bg=#252525
  ble-face -s vim_airline_a_insert                     fg=235,bg=245 # fg=#252525,bg=#8e8e8e
  ble-face -s vim_airline_a_replace                    fg=235,bg=243 # fg=#252525,bg=#747474
  ble-face -s vim_airline_a_visual                     fg=235,bg=247 # fg=#252525,bg=#999999
  ble-face -s vim_airline_b                            fg=248,bg=238 # fg=#ababab,bg=#464646
  ble-face -s vim_airline_b_inactive                   fg=248,bg=235 # fg=#ababab,bg=#252525
  ble-face -s vim_airline_c                            fg=248,bg=235 # fg=#ababab,bg=#252525
  ble-face -s vim_airline_c_inactive                   fg=250,bg=235 # fg=#b9b9b9,bg=#252525
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#f7f7f7,bg=#252525
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#f7f7f7,bg=#252525
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#f7f7f7,bg=#252525
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#f7f7f7,bg=#252525
}
