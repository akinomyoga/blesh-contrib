# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_gruvbox_light_soft.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Gruvbox light, soft vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_gruvbox_light_soft/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=223,bg=60  # fg=#ebdbb2,bg=#665c54
  ble-face -s vim_airline_a_inactive                   fg=223,bg=223 # fg=#ebdbb2,bg=#ebdbb2
  ble-face -s vim_airline_a_insert                     fg=223,bg=100 # fg=#ebdbb2,bg=#79740e
  ble-face -s vim_airline_a_replace                    fg=223,bg=95  # fg=#ebdbb2,bg=#8f3f71
  ble-face -s vim_airline_a_visual                     fg=223,bg=130 # fg=#ebdbb2,bg=#af3a03
  ble-face -s vim_airline_b                            fg=60,bg=187  # fg=#665c54,bg=#d5c4a1
  ble-face -s vim_airline_b_inactive                   fg=60,bg=223  # fg=#665c54,bg=#ebdbb2
  ble-face -s vim_airline_c                            fg=60,bg=223  # fg=#665c54,bg=#ebdbb2
  ble-face -s vim_airline_c_inactive                   fg=239,bg=223 # fg=#504945,bg=#ebdbb2
  ble-face -s vim_airline_c_insert_modified            fg=235,bg=223 # fg=#282828,bg=#ebdbb2
  ble-face -s vim_airline_c_normal_modified            fg=235,bg=223 # fg=#282828,bg=#ebdbb2
  ble-face -s vim_airline_c_replace_modified           fg=235,bg=223 # fg=#282828,bg=#ebdbb2
  ble-face -s vim_airline_c_visual_modified            fg=235,bg=223 # fg=#282828,bg=#ebdbb2
}
