# From github:vim-airline/vim-airline-themes/autoload/airline/themes/ouo.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Author: Huang Po-Hsuan <https://github.com/aben20807>
# Filename: ouo.vim
# Last Modified: 2018-10-21 19:59:41
# Vim: enc=utf-8

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:ouo/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=27  # fg=#ffffff,bg=#005fff
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=231,bg=70  # fg=#ffffff,bg=#5faf00
  ble-face -s vim_airline_a_replace                    fg=231,bg=160 # fg=#ffffff,bg=#d70000
  ble-face -s vim_airline_a_visual                     fg=231,bg=166 # fg=#ffffff,bg=#d75f00
  ble-face -s vim_airline_b                            fg=144,bg=237 # fg=#afaf87,bg=#3a3a3a
  ble-face -s vim_airline_b_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c                            fg=39,bg=234  # fg=#00afff,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_c_inactive_modified          fg=124,bg=234 # fg=#af0000,bg=#1c1c1c
  ble-face -s vim_airline_c_insert                     fg=70,bg=234  # fg=#5faf00,bg=#1c1c1c
  ble-face -s vim_airline_c_insert_modified            fg=124,bg=234 # fg=#af0000,bg=#1c1c1c
  ble-face -s vim_airline_c_normal_modified            fg=124,bg=234 # fg=#af0000,bg=#1c1c1c
  ble-face -s vim_airline_c_replace                    fg=144,bg=234 # fg=#afaf87,bg=#1c1c1c
  ble-face -s vim_airline_c_replace_modified           fg=124,bg=234 # fg=#af0000,bg=#1c1c1c
  ble-face -s vim_airline_c_visual                     fg=166,bg=234 # fg=#d75f00,bg=#1c1c1c
  ble-face -s vim_airline_c_visual_modified            fg=124,bg=234 # fg=#af0000,bg=#1c1c1c
  ble-face -s vim_airline_error                        fg=231,bg=160 # fg=#ffffff,bg=#d70000
  ble-face -s vim_airline_error_inactive               fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_error_inactive_modified      fg=231,bg=160 # fg=#ffffff,bg=#d70000
  ble-face -s vim_airline_warning                      fg=231,bg=166 # fg=#ffffff,bg=#d75f00
  ble-face -s vim_airline_warning_inactive             fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_warning_inactive_modified    fg=231,bg=166 # fg=#ffffff,bg=#d75f00
}
