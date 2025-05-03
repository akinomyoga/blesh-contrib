# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_dracula.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Dracula vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_dracula/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=80  # fg=#3a3c4e,bg=#62d6e8
  ble-face -s vim_airline_a_inactive                   fg=238,bg=238 # fg=#3a3c4e,bg=#3a3c4e
  ble-face -s vim_airline_a_insert                     fg=238,bg=228 # fg=#3a3c4e,bg=#ebff87
  ble-face -s vim_airline_a_replace                    fg=238,bg=134 # fg=#3a3c4e,bg=#b45bcf
  ble-face -s vim_airline_a_visual                     fg=238,bg=134 # fg=#3a3c4e,bg=#b45bcf
  ble-face -s vim_airline_b                            fg=80,bg=240  # fg=#62d6e8,bg=#4d4f68
  ble-face -s vim_airline_b_inactive                   fg=80,bg=238  # fg=#62d6e8,bg=#3a3c4e
  ble-face -s vim_airline_c                            fg=80,bg=238  # fg=#62d6e8,bg=#3a3c4e
  ble-face -s vim_airline_c_inactive                   fg=189,bg=238 # fg=#e9e9f4,bg=#3a3c4e
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=238 # fg=#f7f7fb,bg=#3a3c4e
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=238 # fg=#f7f7fb,bg=#3a3c4e
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=238 # fg=#f7f7fb,bg=#3a3c4e
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=238 # fg=#f7f7fb,bg=#3a3c4e
}
