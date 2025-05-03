# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_rebecca.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Rebecca vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Victor Borja (http://github.com/vic) based on Rebecca Theme (http://github.com/vic/rebecca-theme)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_rebecca/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=60,bg=146  # fg=#663399,bg=#a0a0c5
  ble-face -s vim_airline_a_inactive                   fg=60,bg=60   # fg=#663399,bg=#663399
  ble-face -s vim_airline_a_insert                     fg=60,bg=86   # fg=#663399,bg=#6dfedf
  ble-face -s vim_airline_a_replace                    fg=60,bg=111  # fg=#663399,bg=#7aa5ff
  ble-face -s vim_airline_a_visual                     fg=60,bg=223  # fg=#663399,bg=#efe4a1
  ble-face -s vim_airline_b                            fg=146,bg=238 # fg=#a0a0c5,bg=#383a62
  ble-face -s vim_airline_b_inactive                   fg=146,bg=60  # fg=#a0a0c5,bg=#663399
  ble-face -s vim_airline_c                            fg=146,bg=60  # fg=#a0a0c5,bg=#663399
  ble-face -s vim_airline_c_inactive                   fg=255,bg=60  # fg=#f1eff8,bg=#663399
  ble-face -s vim_airline_c_insert_modified            fg=240,bg=60  # fg=#53495d,bg=#663399
  ble-face -s vim_airline_c_normal_modified            fg=240,bg=60  # fg=#53495d,bg=#663399
  ble-face -s vim_airline_c_replace_modified           fg=240,bg=60  # fg=#53495d,bg=#663399
  ble-face -s vim_airline_c_visual_modified            fg=240,bg=60  # fg=#53495d,bg=#663399
}
