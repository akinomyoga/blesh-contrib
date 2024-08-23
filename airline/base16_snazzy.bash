# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_snazzy.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# base16-snazzy
# theme format modified from wombat 
# colors from sindresorhus/hyper-snazzy & h404bi/base16-snazzy-scheme/
# Made by Ayush Shenoy (masala-man)
#
#   BASE16-SNAZZY        XTERM

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_snazzy/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=81   # fg=#282a36,bg=#57c7ff
  ble-face -s vim_airline_a_inactive                   fg=244,bg=17  # fg=244,bg=#282a36
  ble-face -s vim_airline_a_insert                     fg=17,bg=84   # fg=#282a36,bg=#5af78e
  ble-face -s vim_airline_a_replace                    fg=17,bg=203  # fg=#282a36,bg=#ff5c57
  ble-face -s vim_airline_a_visual                     fg=17,bg=229  # fg=#282a36,bg=#f3f99d
  ble-face -s vim_airline_b                            fg=81,bg=17   # fg=#57c7ff,bg=#282a36
  ble-face -s vim_airline_b_inactive                   fg=244,bg=17  # fg=244,bg=#282a36
  ble-face -s vim_airline_b_insert                     fg=84,bg=17   # fg=#5af78e,bg=#282a36
  ble-face -s vim_airline_b_replace                    fg=203,bg=17  # fg=#ff5c57,bg=#282a36
  ble-face -s vim_airline_b_visual                     fg=229,bg=17  # fg=#f3f99d,bg=#282a36
  ble-face -s vim_airline_c                            fg=81,bg=17   # fg=#57c7ff,bg=#282a36
  ble-face -s vim_airline_c_inactive                   fg=244,bg=17  # fg=244,bg=#282a36
  ble-face -s vim_airline_c_inactive_modified          fg=81,bg=16   # fg=#57c7ff,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=84,bg=17   # fg=#5af78e,bg=#282a36
  ble-face -s vim_airline_c_replace                    fg=203,bg=17  # fg=#ff5c57,bg=#282a36
  ble-face -s vim_airline_c_visual                     fg=229,bg=17  # fg=#f3f99d,bg=#282a36
  ble-face -s vim_airline_error                        fg=17,bg=203  # fg=#282a36,bg=#ff5c57
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_warning                      fg=17,bg=229  # fg=#282a36,bg=#f3f99d
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
