# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_unikitty_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Unikitty Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Josh W Lewis (@joshwlewis)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_unikitty_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=254,bg=245 # fg=#e1e1e2,bg=#89878b
  ble-face -s vim_airline_a_inactive                   fg=254,bg=254 # fg=#e1e1e2,bg=#e1e1e2
  ble-face -s vim_airline_a_insert                     fg=254,bg=36  # fg=#e1e1e2,bg=#17ad98
  ble-face -s vim_airline_a_replace                    fg=254,bg=128 # fg=#e1e1e2,bg=#aa17e6
  ble-face -s vim_airline_a_visual                     fg=254,bg=166 # fg=#e1e1e2,bg=#d65407
  ble-face -s vim_airline_b                            fg=245,bg=251 # fg=#89878b,bg=#c4c3c5
  ble-face -s vim_airline_b_inactive                   fg=245,bg=254 # fg=#89878b,bg=#e1e1e2
  ble-face -s vim_airline_c                            fg=245,bg=254 # fg=#89878b,bg=#e1e1e2
  ble-face -s vim_airline_c_inactive                   fg=242,bg=254 # fg=#6c696e,bg=#e1e1e2
  ble-face -s vim_airline_c_insert_modified            fg=53,bg=254  # fg=#322d34,bg=#e1e1e2
  ble-face -s vim_airline_c_normal_modified            fg=53,bg=254  # fg=#322d34,bg=#e1e1e2
  ble-face -s vim_airline_c_replace_modified           fg=53,bg=254  # fg=#322d34,bg=#e1e1e2
  ble-face -s vim_airline_c_visual_modified            fg=53,bg=254  # fg=#322d34,bg=#e1e1e2
}
