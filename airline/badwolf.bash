# From github:vim-airline/vim-airline-themes/autoload/airline/themes/badwolf.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:badwolf/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=154 # fg=#141413,bg=#aeee00
  ble-face -s vim_airline_a_inactive                   fg=235,bg=238 # fg=#242321,bg=#45413b
  ble-face -s vim_airline_a_insert                     fg=233,bg=39  # fg=#141413,bg=#0a9dff
  ble-face -s vim_airline_a_replace                    fg=233,bg=217 # fg=#141413,bg=#ff9eb8
  ble-face -s vim_airline_a_visual                     fg=233,bg=214 # fg=#141413,bg=#ffa724
  ble-face -s vim_airline_b                            fg=222,bg=238 # fg=#f4cf86,bg=#45413b
  ble-face -s vim_airline_b_inactive                   fg=235,bg=238 # fg=#242321,bg=#45413b
  ble-face -s vim_airline_b_insert                     fg=222,bg=27  # fg=#f4cf86,bg=#005fff
  ble-face -s vim_airline_b_normal_modified            fg=222,bg=241 # fg=#f4cf86,bg=#666462
  ble-face -s vim_airline_b_visual                     fg=16,bg=221  # fg=#000000,bg=#fade3e
  ble-face -s vim_airline_c                            fg=121,bg=235 # fg=#8cffba,bg=#242321
  ble-face -s vim_airline_c_inactive                   fg=235,bg=238 # fg=#242321,bg=#45413b
  ble-face -s vim_airline_c_inactive_modified          fg=214,bg=16  # fg=#ffa724,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=39,bg=235  # fg=#0a9dff,bg=#242321
  ble-face -s vim_airline_c_insert_modified            fg=214,bg=238 # fg=#ffa724,bg=#45413b
  ble-face -s vim_airline_c_normal_modified            fg=214,bg=238 # fg=#ffa724,bg=#45413b
  ble-face -s vim_airline_c_replace_modified           fg=214,bg=238 # fg=#ffa724,bg=#45413b
  ble-face -s vim_airline_c_visual                     fg=16,bg=137  # fg=#000000,bg=#b88853
  ble-face -s vim_airline_c_visual_modified            fg=16,bg=173  # fg=#000000,bg=#c7915b
  ble-face -s vim_airline_term_normal_modified         fg=121,bg=235 # fg=#8cffba,bg=#242321
  ble-face -s vim_airline_term_visual_modified         fg=16,bg=221  # fg=#000000,bg=#fade3e
  ble-face -s vim_airline_z_replace                    fg=233,bg=39  # fg=#141413,bg=#0a9dff
}
