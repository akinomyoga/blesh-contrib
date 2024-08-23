# From github:vim-airline/vim-airline-themes/autoload/airline/themes/laederon.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of Laederon
# (https://github.com/Donearm/Laederon)
#
# Author:       Gianluca fiore <https://github.com/Donearm/>
# Version:      1.12
# License:      MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:laederon/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=18,bg=255  # fg=#081c8c,bg=#f8f6f2
  ble-face -s vim_airline_a_inactive                   fg=255,bg=236 # fg=#f8f6f2,bg=#2e2d2a
  ble-face -s vim_airline_a_insert                     fg=255,bg=131 # fg=#f8f6f2,bg=#ab3e5b
  ble-face -s vim_airline_a_insert_modified            fg=255,bg=31  # fg=#f8f6f2,bg=#1693a5
  ble-face -s vim_airline_a_normal_modified            fg=18,bg=18   # fg=#081c8c,bg=#081c8c
  ble-face -s vim_airline_a_replace                    fg=108,bg=255 # fg=#90a680,bg=#f8f6f2
  ble-face -s vim_airline_a_replace_modified           fg=108,bg=108 # fg=#90a680,bg=#90a680
  ble-face -s vim_airline_a_visual                     fg=22,bg=255  # fg=#005f00,bg=#f8f6f2
  ble-face -s vim_airline_a_visual_modified            fg=22,bg=58   # fg=#005f00,bg=#594512
  ble-face -s vim_airline_b                            fg=31,bg=255  # fg=#1693a5,bg=#f8f6f2
  ble-face -s vim_airline_b_inactive                   fg=255,bg=236 # fg=#f8f6f2,bg=#2e2d2a
  ble-face -s vim_airline_b_insert                     fg=235,bg=131 # fg=#242321,bg=#ab3e5b
  ble-face -s vim_airline_b_insert_modified            fg=31,bg=235  # fg=#1693a5,bg=#242321
  ble-face -s vim_airline_b_normal_modified            fg=18,bg=235  # fg=#081c8c,bg=#242321
  ble-face -s vim_airline_b_replace                    fg=108,bg=235 # fg=#90a680,bg=#242321
  ble-face -s vim_airline_b_visual                     fg=255,bg=22  # fg=#f8f6f2,bg=#005f00
  ble-face -s vim_airline_b_visual_modified            fg=58,bg=235  # fg=#594512,bg=#242321
  ble-face -s vim_airline_c                            fg=108,bg=236 # fg=#90a680,bg=#2e2d2a
  ble-face -s vim_airline_c_inactive                   fg=255,bg=236 # fg=#f8f6f2,bg=#2e2d2a
  ble-face -s vim_airline_c_inactive_modified          fg=18,bg=231  # fg=#081c8c,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=31,bg=255  # fg=#1693a5,bg=#f8f6f2
  ble-face -s vim_airline_c_insert_modified            fg=31,bg=236  # fg=#1693a5,bg=#2e2d2a
  ble-face -s vim_airline_c_normal_modified            fg=18,bg=236  # fg=#081c8c,bg=#2e2d2a
  ble-face -s vim_airline_c_replace                    fg=255,bg=108 # fg=#f8f6f2,bg=#90a680
  ble-face -s vim_airline_c_replace_modified           fg=108,bg=236 # fg=#90a680,bg=#2e2d2a
  ble-face -s vim_airline_c_visual                     fg=58,bg=255  # fg=#594512,bg=#f8f6f2
  ble-face -s vim_airline_c_visual_modified            fg=58,bg=236  # fg=#594512,bg=#2e2d2a
}
