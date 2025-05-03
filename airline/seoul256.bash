# From github:vim-airline/vim-airline-themes/autoload/airline/themes/seoul256.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Created by JB Kopecky (https://github.com/jbkopecky), based on seoul256 themed
# by Junegunn Choi (https://github.com/junegunn/seoul256.vim)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:seoul256/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_inactive                   fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_a_replace                    fg=231,bg=29  # fg=#ffffff,bg=#2e8b57
  ble-face -s vim_airline_a_visual                     fg=231,bg=196 # fg=#ffffff,bg=#ff0000
  ble-face -s vim_airline_b                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_b_inactive                   fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_c                            fg=16,bg=254  # fg=#000000,bg=#e5e5e5
  ble-face -s vim_airline_c_inactive_modified          fg=62,bg=231  # fg=#6a5acd,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_insert_modified            fg=62,bg=231  # fg=#6a5acd,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=62,bg=231  # fg=#6a5acd,bg=#ffffff
  ble-face -s vim_airline_c_replace_modified           fg=62,bg=231  # fg=#6a5acd,bg=#ffffff
  ble-face -s vim_airline_c_visual                     fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_warning                      fg=136,bg=255 # fg=#af8500,bg=#ebebeb
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
