# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_estuary_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Estuary Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_estuary_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=188,bg=59  # fg=#e7e6df,bg=#6c6b5a
  ble-face -s vim_airline_a_inactive                   fg=188,bg=188 # fg=#e7e6df,bg=#e7e6df
  ble-face -s vim_airline_a_insert                     fg=188,bg=100 # fg=#e7e6df,bg=#7d9726
  ble-face -s vim_airline_a_replace                    fg=188,bg=66  # fg=#e7e6df,bg=#5f9182
  ble-face -s vim_airline_a_visual                     fg=188,bg=136 # fg=#e7e6df,bg=#ae7313
  ble-face -s vim_airline_b                            fg=59,bg=102  # fg=#6c6b5a,bg=#929181
  ble-face -s vim_airline_b_inactive                   fg=59,bg=188  # fg=#6c6b5a,bg=#e7e6df
  ble-face -s vim_airline_c                            fg=59,bg=188  # fg=#6c6b5a,bg=#e7e6df
  ble-face -s vim_airline_c_inactive                   fg=59,bg=188  # fg=#5f5e4e,bg=#e7e6df
  ble-face -s vim_airline_c_insert_modified            fg=16,bg=188  # fg=#22221b,bg=#e7e6df
  ble-face -s vim_airline_c_normal_modified            fg=16,bg=188  # fg=#22221b,bg=#e7e6df
  ble-face -s vim_airline_c_replace_modified           fg=16,bg=188  # fg=#22221b,bg=#e7e6df
  ble-face -s vim_airline_c_visual_modified            fg=16,bg=188  # fg=#22221b,bg=#e7e6df
}
