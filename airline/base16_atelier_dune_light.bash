# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_dune_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Dune Light vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_dune_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=253,bg=101 # fg=#e8e4cf,bg=#7d7a68
  ble-face -s vim_airline_a_inactive                   fg=253,bg=253 # fg=#e8e4cf,bg=#e8e4cf
  ble-face -s vim_airline_a_insert                     fg=253,bg=71  # fg=#e8e4cf,bg=#60ac39
  ble-face -s vim_airline_a_replace                    fg=253,bg=134 # fg=#e8e4cf,bg=#b854d4
  ble-face -s vim_airline_a_visual                     fg=253,bg=130 # fg=#e8e4cf,bg=#b65611
  ble-face -s vim_airline_b                            fg=101,bg=144 # fg=#7d7a68,bg=#a6a28c
  ble-face -s vim_airline_b_inactive                   fg=101,bg=253 # fg=#7d7a68,bg=#e8e4cf
  ble-face -s vim_airline_c                            fg=101,bg=253 # fg=#7d7a68,bg=#e8e4cf
  ble-face -s vim_airline_c_inactive                   fg=242,bg=253 # fg=#6e6b5e,bg=#e8e4cf
  ble-face -s vim_airline_c_insert_modified            fg=234,bg=253 # fg=#20201d,bg=#e8e4cf
  ble-face -s vim_airline_c_normal_modified            fg=234,bg=253 # fg=#20201d,bg=#e8e4cf
  ble-face -s vim_airline_c_replace_modified           fg=234,bg=253 # fg=#20201d,bg=#e8e4cf
  ble-face -s vim_airline_c_visual_modified            fg=234,bg=253 # fg=#20201d,bg=#e8e4cf
}
