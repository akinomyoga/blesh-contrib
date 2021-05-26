# From github:vim-airline/vim-airline-themes/autoload/airline/themes/term_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:term_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=114 # fg=#f0f0f0,bg=#86cd74
  ble-face -s vim_airline_a_inactive                   fg=243,bg=102 # fg=#767676,bg=#888a85
  ble-face -s vim_airline_a_insert                     fg=255,bg=221 # fg=#f0f0f0,bg=#fade3e
  ble-face -s vim_airline_a_insert_modified            fg=16,bg=221  # fg=#141413,bg=#fde76e
  ble-face -s vim_airline_a_normal_modified            fg=16,bg=186  # fg=#141413,bg=#cae682
  ble-face -s vim_airline_a_replace                    fg=255,bg=167 # fg=#f0f0f0,bg=#e55345
  ble-face -s vim_airline_a_replace_modified           fg=16,bg=173  # fg=#141413,bg=#e5786d
  ble-face -s vim_airline_a_visual                     fg=255,bg=110 # fg=#f0f0f0,bg=#7cb0e6
  ble-face -s vim_airline_a_visual_modified            fg=16,bg=153  # fg=#141413,bg=#b5d3f3
  ble-face -s vim_airline_b                            fg=114,bg=188 # fg=#86cd74,bg=#deded9
  ble-face -s vim_airline_b_inactive                   fg=243,bg=102 # fg=#767676,bg=#888a85
  ble-face -s vim_airline_b_insert                     fg=221,bg=188 # fg=#fade3e,bg=#deded9
  ble-face -s vim_airline_b_insert_modified            fg=221,bg=59  # fg=#fde76e,bg=#40403c
  ble-face -s vim_airline_b_normal_modified            fg=186,bg=59  # fg=#cae682,bg=#40403c
  ble-face -s vim_airline_b_replace                    fg=167,bg=188 # fg=#e55345,bg=#deded9
  ble-face -s vim_airline_b_replace_modified           fg=173,bg=59  # fg=#e5786d,bg=#40403c
  ble-face -s vim_airline_b_visual                     fg=110,bg=188 # fg=#7cb0e6,bg=#deded9
  ble-face -s vim_airline_b_visual_modified            fg=153,bg=59  # fg=#b5d3f3,bg=#40403c
  ble-face -s vim_airline_c                            fg=114,bg=102 # fg=#86cd74,bg=#888a85
  ble-face -s vim_airline_c_inactive                   fg=243,bg=102 # fg=#767676,bg=#888a85
  ble-face -s vim_airline_c_inactive_modified          fg=186,bg=0   # fg=#cae682,bg=0
  ble-face -s vim_airline_c_insert                     fg=221,bg=102 # fg=#fade3e,bg=#888a85
  ble-face -s vim_airline_c_insert_modified            fg=221,bg=102 # fg=#fde76e,bg=#888a85
  ble-face -s vim_airline_c_normal_modified            fg=186,bg=102 # fg=#cae682,bg=#888a85
  ble-face -s vim_airline_c_replace                    fg=167,bg=102 # fg=#e55345,bg=#888a85
  ble-face -s vim_airline_c_replace_modified           fg=173,bg=102 # fg=#e5786d,bg=#888a85
  ble-face -s vim_airline_c_visual                     fg=110,bg=102 # fg=#7cb0e6,bg=#888a85
  ble-face -s vim_airline_c_visual_modified            fg=153,bg=102 # fg=#b5d3f3,bg=#888a85
}
