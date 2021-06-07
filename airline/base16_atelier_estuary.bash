# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_estuary.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Estuary vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_estuary/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=52,bg=244  # fg=#302f27,bg=#878573
  ble-face -s vim_airline_a_inactive                   fg=52,bg=52   # fg=#302f27,bg=#302f27
  ble-face -s vim_airline_a_insert                     fg=52,bg=100  # fg=#302f27,bg=#7d9726
  ble-face -s vim_airline_a_replace                    fg=52,bg=66   # fg=#302f27,bg=#5f9182
  ble-face -s vim_airline_a_visual                     fg=52,bg=136  # fg=#302f27,bg=#ae7313
  ble-face -s vim_airline_b                            fg=244,bg=240 # fg=#878573,bg=#5f5e4e
  ble-face -s vim_airline_b_inactive                   fg=244,bg=52  # fg=#878573,bg=#302f27
  ble-face -s vim_airline_c                            fg=244,bg=52  # fg=#878573,bg=#302f27
  ble-face -s vim_airline_c_inactive                   fg=245,bg=52  # fg=#929181,bg=#302f27
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=52  # fg=#f4f3ec,bg=#302f27
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=52  # fg=#f4f3ec,bg=#302f27
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=52  # fg=#f4f3ec,bg=#302f27
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=52  # fg=#f4f3ec,bg=#302f27
}
