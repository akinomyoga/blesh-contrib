# From github:vim-airline/vim-airline-themes/autoload/airline/themes/fruit_punch.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Fruitpunch - A fruity airline theme!
# vim: tw=80 et sw=2 ts=2

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:fruit_punch/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=217 # fg=#303030,bg=#f29db4
  ble-face -s vim_airline_a_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_a_insert                     fg=236,bg=222 # fg=#303030,bg=#fce78d
  ble-face -s vim_airline_a_replace                    fg=236,bg=203 # fg=#303030,bg=#f97070
  ble-face -s vim_airline_a_visual                     fg=236,bg=116 # fg=#303030,bg=#79e5e0
  ble-face -s vim_airline_b                            fg=249,bg=237 # fg=#b2b2b2,bg=#3a3a3a
  ble-face -s vim_airline_b_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c                            fg=217,bg=238 # fg=#f29db4,bg=#444444
  ble-face -s vim_airline_c_inactive                   fg=249,bg=238 # fg=#b2b2b2,bg=#444444
  ble-face -s vim_airline_c_insert                     fg=222,bg=238 # fg=#fce78d,bg=#444444
  ble-face -s vim_airline_c_normal_modified            fg=222,bg=238 # fg=#fce78d,bg=#444444
  ble-face -s vim_airline_c_replace                    fg=203,bg=238 # fg=#f97070,bg=#444444
  ble-face -s vim_airline_c_replace_modified           fg=222,bg=238 # fg=#fce78d,bg=#444444
  ble-face -s vim_airline_c_visual                     fg=116,bg=238 # fg=#79e5e0,bg=#444444
  ble-face -s vim_airline_c_visual_modified            fg=222,bg=238 # fg=#fce78d,bg=#444444
  ble-face -s vim_airline_warning                      fg=236,bg=179 # fg=#303030,bg=#e8a15a
}
