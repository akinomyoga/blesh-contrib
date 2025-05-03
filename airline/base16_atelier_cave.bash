# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_atelier_cave.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Atelier Cave vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Bram de Haan (http://atelierbramdehaan.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_atelier_cave/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=244 # fg=#26232a,bg=#7e7887
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#26232a,bg=#26232a
  ble-face -s vim_airline_a_insert                     fg=235,bg=30  # fg=#26232a,bg=#2a9292
  ble-face -s vim_airline_a_replace                    fg=235,bg=98  # fg=#26232a,bg=#955ae7
  ble-face -s vim_airline_a_visual                     fg=235,bg=131 # fg=#26232a,bg=#aa573c
  ble-face -s vim_airline_b                            fg=244,bg=240 # fg=#7e7887,bg=#585260
  ble-face -s vim_airline_b_inactive                   fg=244,bg=235 # fg=#7e7887,bg=#26232a
  ble-face -s vim_airline_c                            fg=244,bg=235 # fg=#7e7887,bg=#26232a
  ble-face -s vim_airline_c_inactive                   fg=245,bg=235 # fg=#8b8792,bg=#26232a
  ble-face -s vim_airline_c_insert_modified            fg=255,bg=235 # fg=#efecf4,bg=#26232a
  ble-face -s vim_airline_c_normal_modified            fg=255,bg=235 # fg=#efecf4,bg=#26232a
  ble-face -s vim_airline_c_replace_modified           fg=255,bg=235 # fg=#efecf4,bg=#26232a
  ble-face -s vim_airline_c_visual_modified            fg=255,bg=235 # fg=#efecf4,bg=#26232a
}
