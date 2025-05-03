# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_horizon_terminal_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Horizon Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Michaël Ball (http://github.com/michael-ball/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_horizon_terminal_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=247  # fg=#232530,bg=#9da0a2
  ble-face -s vim_airline_a_inactive                   fg=17,bg=17   # fg=#232530,bg=#232530
  ble-face -s vim_airline_a_insert                     fg=17,bg=42   # fg=#232530,bg=#29d398
  ble-face -s vim_airline_a_replace                    fg=17,bg=205  # fg=#232530,bg=#ee64ac
  ble-face -s vim_airline_a_visual                     fg=17,bg=216  # fg=#232530,bg=#fab795
  ble-face -s vim_airline_b                            fg=247,bg=23  # fg=#9da0a2,bg=#2e303e
  ble-face -s vim_airline_b_inactive                   fg=247,bg=17  # fg=#9da0a2,bg=#232530
  ble-face -s vim_airline_c                            fg=247,bg=17  # fg=#9da0a2,bg=#232530
  ble-face -s vim_airline_c_inactive                   fg=252,bg=17  # fg=#cbced0,bg=#232530
  ble-face -s vim_airline_c_insert_modified            fg=189,bg=17  # fg=#e3e6ee,bg=#232530
  ble-face -s vim_airline_c_normal_modified            fg=189,bg=17  # fg=#e3e6ee,bg=#232530
  ble-face -s vim_airline_c_replace_modified           fg=189,bg=17  # fg=#e3e6ee,bg=#232530
  ble-face -s vim_airline_c_visual_modified            fg=189,bg=17  # fg=#e3e6ee,bg=#232530
}
