# From github:vim-airline/vim-airline-themes/autoload/airline/themes/cyberpunk.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by danrneal (http://github.com/danrneal)
# Cyberpunk by Tai Groot 

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:cyberpunk/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=32,bg=220  # fg=#0197dd,bg=#ffd302
  ble-face -s vim_airline_a_commandline                fg=234,bg=196 # fg=#191919,bg=#ff0000
  ble-face -s vim_airline_a_inactive                   fg=234,bg=238 # fg=#191919,bg=#414c3b
  ble-face -s vim_airline_a_insert                     fg=220,bg=32  # fg=#ffd302,bg=#0197dd
  ble-face -s vim_airline_a_replace                    fg=234,bg=196 # fg=#191919,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=234,bg=64  # fg=#191919,bg=#408000
  ble-face -s vim_airline_b                            fg=241,bg=238 # fg=#666666,bg=#414c3b
  ble-face -s vim_airline_b_commandline_modified       fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_b_inactive_modified          fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_b_insert_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_b_normal_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_b_replace_modified           fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_b_visual_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_c                            fg=32,bg=220  # fg=#0197dd,bg=#ffd302
  ble-face -s vim_airline_c_commandline                fg=234,bg=196 # fg=#191919,bg=#ff0000
  ble-face -s vim_airline_c_inactive                   fg=238,bg=234 # fg=#414c3b,bg=#191919
  ble-face -s vim_airline_c_insert                     fg=220,bg=32  # fg=#ffd302,bg=#0197dd
  ble-face -s vim_airline_c_replace                    fg=234,bg=196 # fg=#191919,bg=#ff0000
  ble-face -s vim_airline_c_visual                     fg=234,bg=64  # fg=#191919,bg=#408000
  ble-face -s vim_airline_error                        fg=196,bg=25  # fg=#ff0000,bg=#0c35bf
  ble-face -s vim_airline_error_inactive               fg=16,bg=88   # fg=#000000,bg=#990000
  ble-face -s vim_airline_error_inactive_modified      fg=196,bg=25  # fg=#ff0000,bg=#0c35bf
  ble-face -s vim_airline_warning                      fg=118,bg=25  # fg=#87f025,bg=#0c35bf
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
  ble-face -s vim_airline_warning_inactive_modified    fg=118,bg=25  # fg=#87f025,bg=#0c35bf
  ble-face -s vim_airline_y_commandline_modified       fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_y_inactive_modified          fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_y_insert_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_y_normal_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_y_replace_modified           fg=45,bg=234  # fg=#0eeafa,bg=#191919
  ble-face -s vim_airline_y_visual_modified            fg=45,bg=234  # fg=#0eeafa,bg=#191919
}
