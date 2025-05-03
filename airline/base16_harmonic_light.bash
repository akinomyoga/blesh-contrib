# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_harmonic_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Harmonic16 Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jannik Siebert (https://github.com/janniks)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_harmonic_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=195,bg=66  # fg=#e5ebf1,bg=#627e99
  ble-face -s vim_airline_a_inactive                   fg=195,bg=195 # fg=#e5ebf1,bg=#e5ebf1
  ble-face -s vim_airline_a_insert                     fg=195,bg=72  # fg=#e5ebf1,bg=#56bf8b
  ble-face -s vim_airline_a_replace                    fg=195,bg=132 # fg=#e5ebf1,bg=#bf568b
  ble-face -s vim_airline_a_visual                     fg=195,bg=143 # fg=#e5ebf1,bg=#bfbf56
  ble-face -s vim_airline_b                            fg=66,bg=190  # fg=#627e99,bg=#cbd6e2
  ble-face -s vim_airline_b_inactive                   fg=66,bg=195  # fg=#627e99,bg=#e5ebf1
  ble-face -s vim_airline_c                            fg=66,bg=195  # fg=#627e99,bg=#e5ebf1
  ble-face -s vim_airline_c_inactive                   fg=60,bg=195  # fg=#405c79,bg=#e5ebf1
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=195 # fg=#0b1c2c,bg=#e5ebf1
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=195 # fg=#0b1c2c,bg=#e5ebf1
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=195 # fg=#0b1c2c,bg=#e5ebf1
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=195 # fg=#0b1c2c,bg=#e5ebf1
}
