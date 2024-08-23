# From github:vim-airline/vim-airline-themes/autoload/airline/themes/sol.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline companion theme of Sol
# (https://github.com/Pychimp/vim-sol)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:sol/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=247 # fg=#343434,bg=#a0a0a0
  ble-face -s vim_airline_a_inactive                   fg=243,bg=251 # fg=#777777,bg=#c7c7c7
  ble-face -s vim_airline_a_insert                     fg=255,bg=23  # fg=#eeeeee,bg=#09643f
  ble-face -s vim_airline_a_replace                    fg=255,bg=196 # fg=#eeeeee,bg=#ff2121
  ble-face -s vim_airline_a_visual                     fg=228,bg=202 # fg=#ffff9a,bg=#ff6003
  ble-face -s vim_airline_b                            fg=236,bg=249 # fg=#343434,bg=#b3b3b3
  ble-face -s vim_airline_b_inactive                   fg=243,bg=251 # fg=#777777,bg=#c7c7c7
  ble-face -s vim_airline_b_insert                     fg=236,bg=248 # fg=#343434,bg=#a3a3a3
  ble-face -s vim_airline_b_visual                     fg=236,bg=248 # fg=#343434,bg=#a3a3a3
  ble-face -s vim_airline_c                            fg=236,bg=251 # fg=#343434,bg=#c7c7c7
  ble-face -s vim_airline_c_inactive                   fg=243,bg=251 # fg=#777777,bg=#c7c7c7
  ble-face -s vim_airline_c_inactive_modified          fg=203,bg=16  # fg=#ff3535,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=236,bg=149 # fg=#343434,bg=#b0b0b0
  ble-face -s vim_airline_c_insert_modified            fg=236,bg=224 # fg=#343434,bg=#ffdbc7
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=203 # fg=#ffffff,bg=#ff6868
  ble-face -s vim_airline_c_replace_modified           fg=236,bg=224 # fg=#343434,bg=#ffdbc7
  ble-face -s vim_airline_c_visual                     fg=236,bg=149 # fg=#343434,bg=#b0b0b0
  ble-face -s vim_airline_c_visual_modified            fg=236,bg=224 # fg=#343434,bg=#ffdbc7
  ble-face -s vim_airline_warning                      fg=255,bg=166 # fg=#eeeeee,bg=#e33900
  ble-face -s vim_airline_warning_inactive             fg=16,bg=166  # fg=#000000,bg=#df5f00
}
