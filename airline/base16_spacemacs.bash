# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_spacemacs.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline base16-spacemacs theme by Peter Meehan (http://github.com/22a)
# Base16 Spacemacs by Chris Kempson (http://chriskempson.com)
# Spacemacs scheme by Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_spacemacs/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=68  # fg=#f8f8f8,bg=#4f97d7
  ble-face -s vim_airline_a_inactive                   fg=250,bg=239 # fg=#b8b8b8,bg=#444155
  ble-face -s vim_airline_a_insert                     fg=231,bg=70  # fg=#f8f8f8,bg=#67b11d
  ble-face -s vim_airline_a_replace                    fg=231,bg=196 # fg=#f8f8f8,bg=#f2241f
  ble-face -s vim_airline_a_visual                     fg=231,bg=214 # fg=#f8f8f8,bg=#ffa500
  ble-face -s vim_airline_b                            fg=254,bg=239 # fg=#e8e8e8,bg=#444155
  ble-face -s vim_airline_b_inactive                   fg=250,bg=239 # fg=#b8b8b8,bg=#444155
  ble-face -s vim_airline_c                            fg=254,bg=234 # fg=#e8e8e8,bg=#1f2022
  ble-face -s vim_airline_c_inactive                   fg=250,bg=239 # fg=#b8b8b8,bg=#444155
  ble-face -s vim_airline_c_insert                     fg=70,bg=234  # fg=#67b11d,bg=#1f2022
  ble-face -s vim_airline_c_replace                    fg=254,bg=234 # fg=#e8e8e8,bg=#1f2022
  ble-face -s vim_airline_c_visual                     fg=214,bg=234 # fg=#ffa500,bg=#1f2022
  ble-face -s vim_airline_error                        fg=231,bg=196 # fg=#f8f8f8,bg=#f2241f
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=231,bg=214 # fg=#f8f8f8,bg=#ffa500
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
