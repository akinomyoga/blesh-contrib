# From github:vim-airline/vim-airline-themes/autoload/airline/themes/xtermlight.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:xtermlight/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=27  # fg=#eeeeee,bg=#005fff
  ble-face -s vim_airline_a_inactive                   fg=242,bg=249 # fg=#6c6c6c,bg=#b2b2b2
  ble-face -s vim_airline_a_insert                     fg=255,bg=29  # fg=#eeeeee,bg=#00875f
  ble-face -s vim_airline_a_replace                    fg=22,bg=196  # fg=#005f00,bg=#ff0000
  ble-face -s vim_airline_a_visual                     fg=255,bg=202 # fg=#eeeeee,bg=#ff5f00
  ble-face -s vim_airline_b                            fg=18,bg=45   # fg=#000087,bg=#00d7ff
  ble-face -s vim_airline_b_inactive                   fg=245,bg=252 # fg=#8a8a8a,bg=#d0d0d0
  ble-face -s vim_airline_b_insert                     fg=22,bg=42   # fg=#005f00,bg=#00d787
  ble-face -s vim_airline_b_visual                     fg=52,bg=214  # fg=#5f0000,bg=#ffaf00
  ble-face -s vim_airline_c                            fg=27,bg=159  # fg=#005fff,bg=#afffff
  ble-face -s vim_airline_c_inactive                   fg=248,bg=255 # fg=#a8a8a8,bg=#eeeeee
  ble-face -s vim_airline_c_inactive_modified          fg=160,bg=0   # fg=#d70000,bg=0
  ble-face -s vim_airline_c_insert                     fg=23,bg=156  # fg=#005f5f,bg=#afff87
  ble-face -s vim_airline_c_insert_modified            fg=160,bg=224 # fg=#d70000,bg=#ffdfdf
  ble-face -s vim_airline_c_normal_modified            fg=160,bg=224 # fg=#d70000,bg=#ffdfdf
  ble-face -s vim_airline_c_replace_modified           fg=160,bg=224 # fg=#d70000,bg=#ffdfdf
  ble-face -s vim_airline_c_visual                     fg=166,bg=228 # fg=#d75f00,bg=#ffff87
  ble-face -s vim_airline_c_visual_modified            fg=160,bg=224 # fg=#d70000,bg=#ffdfdf
  ble-face -s vim_airline_z_replace                    fg=255,bg=29  # fg=#eeeeee,bg=#00875f
}
