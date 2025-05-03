# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ubaryd.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of Ubaryd
# (https://github.com/Donearm/Ubaryd)
#
# Author:       Gianluca fiore <https://github.com/Donearm/>
# Version:      1.12
# License:      MIT

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ubaryd/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=255  # fg=#005f00,bg=#f8f6f2
  ble-face -s vim_airline_a_inactive                   fg=22,bg=235  # fg=#005f00,bg=#242321
  ble-face -s vim_airline_a_insert                     fg=255,bg=168 # fg=#f8f6f2,bg=#e25a74
  ble-face -s vim_airline_a_insert_modified            fg=255,bg=222 # fg=#f8f6f2,bg=#f4cf86
  ble-face -s vim_airline_a_normal_modified            fg=22,bg=22   # fg=#005f00,bg=#005f00
  ble-face -s vim_airline_a_replace                    fg=235,bg=255 # fg=#242321,bg=#f8f6f2
  ble-face -s vim_airline_a_replace_modified           fg=235,bg=214 # fg=#242321,bg=#ffa724
  ble-face -s vim_airline_a_visual                     fg=60,bg=255  # fg=#416389,bg=#f8f6f2
  ble-face -s vim_airline_a_visual_modified            fg=60,bg=94   # fg=#416389,bg=#9a4820
  ble-face -s vim_airline_b                            fg=255,bg=22  # fg=#f8f6f2,bg=#005f00
  ble-face -s vim_airline_b_inactive                   fg=22,bg=235  # fg=#005f00,bg=#242321
  ble-face -s vim_airline_b_insert                     fg=235,bg=131 # fg=#242321,bg=#c14c3d
  ble-face -s vim_airline_b_insert_modified            fg=222,bg=235 # fg=#f4cf86,bg=#242321
  ble-face -s vim_airline_b_normal_modified            fg=22,bg=235  # fg=#005f00,bg=#242321
  ble-face -s vim_airline_b_replace                    fg=214,bg=241 # fg=#ffa724,bg=#666462
  ble-face -s vim_airline_b_replace_modified           fg=214,bg=235 # fg=#ffa724,bg=#242321
  ble-face -s vim_airline_b_visual                     fg=60,bg=222  # fg=#416389,bg=#f4cf86
  ble-face -s vim_airline_b_visual_modified            fg=94,bg=235  # fg=#9a4820,bg=#242321
  ble-face -s vim_airline_c                            fg=137,bg=235 # fg=#b88853,bg=#242321
  ble-face -s vim_airline_c_inactive                   fg=22,bg=235  # fg=#005f00,bg=#242321
  ble-face -s vim_airline_c_inactive_modified          fg=22,bg=231  # fg=#005f00,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=222,bg=235 # fg=#f4cf86,bg=#242321
  ble-face -s vim_airline_c_normal_modified            fg=22,bg=235  # fg=#005f00,bg=#242321
  ble-face -s vim_airline_c_replace                    fg=255,bg=208 # fg=#f8f6f2,bg=#ff7400
  ble-face -s vim_airline_c_replace_modified           fg=214,bg=235 # fg=#ffa724,bg=#242321
  ble-face -s vim_airline_c_visual                     fg=94,bg=255  # fg=#9a4820,bg=#f8f6f2
  ble-face -s vim_airline_c_visual_modified            fg=94,bg=235  # fg=#9a4820,bg=#242321
}
