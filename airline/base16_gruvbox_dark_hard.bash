# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_gruvbox_dark_hard.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by ronald2wing (https://github.com/ronald2wing)
# Base 16 Gruvbox Dark Hard Scheme by Dawid Kurek (https://github.com/dawikur)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_gruvbox_dark_hard/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=142 # fg=#3c3836,bg=#b8bb26
  ble-face -s vim_airline_a_inactive                   fg=187,bg=237 # fg=#d5c4a1,bg=#3c3836
  ble-face -s vim_airline_a_insert                     fg=237,bg=108 # fg=#3c3836,bg=#83a598
  ble-face -s vim_airline_a_replace                    fg=237,bg=203 # fg=#3c3836,bg=#fb4934
  ble-face -s vim_airline_a_visual                     fg=237,bg=175 # fg=#3c3836,bg=#d3869b
  ble-face -s vim_airline_b                            fg=223,bg=239 # fg=#ebdbb2,bg=#504945
  ble-face -s vim_airline_b_inactive                   fg=187,bg=237 # fg=#d5c4a1,bg=#3c3836
  ble-face -s vim_airline_c                            fg=208,bg=237 # fg=#fe8019,bg=#3c3836
  ble-face -s vim_airline_c_inactive                   fg=187,bg=237 # fg=#d5c4a1,bg=#3c3836
  ble-face -s vim_airline_term                         fg=208,bg=237 # fg=#fe8019,bg=#3c3836
  ble-face -s vim_airline_term_inactive                fg=158,bg=234 # fg=#9cffd3,bg=#202020
  ble-face -s vim_airline_term_insert                  fg=158,bg=234 # fg=#9cffd3,bg=#202020
}
