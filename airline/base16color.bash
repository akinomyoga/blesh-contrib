# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16color.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Normal mode
#          [ guifg, guibg, ctermfg, ctermbg, opts ]

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16color/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=186 # fg=#141413,bg=#cae682
  ble-face -s vim_airline_a_inactive                   fg=243,bg=235 # fg=#767676,bg=#242424
  ble-face -s vim_airline_a_insert                     fg=233,bg=221 # fg=#141413,bg=#fde76e
  ble-face -s vim_airline_a_insert_modified            fg=233,bg=221 # fg=#141413,bg=#fade3e
  ble-face -s vim_airline_a_normal_modified            fg=233,bg=114 # fg=#141413,bg=#86cd74
  ble-face -s vim_airline_a_replace                    fg=233,bg=173 # fg=#141413,bg=#e5786d
  ble-face -s vim_airline_a_replace_modified           fg=233,bg=167 # fg=#141413,bg=#e55345
  ble-face -s vim_airline_a_visual                     fg=233,bg=153 # fg=#141413,bg=#b5d3f3
  ble-face -s vim_airline_a_visual_modified            fg=233,bg=110 # fg=#141413,bg=#7cb0e6
  ble-face -s vim_airline_b                            fg=186,bg=58  # fg=#cae682,bg=#32322f
  ble-face -s vim_airline_b_inactive                   fg=243,bg=235 # fg=#767676,bg=#242424
  ble-face -s vim_airline_b_insert                     fg=221,bg=58  # fg=#fde76e,bg=#32322f
  ble-face -s vim_airline_b_insert_modified            fg=221,bg=238 # fg=#fade3e,bg=#40403c
  ble-face -s vim_airline_b_normal_modified            fg=114,bg=238 # fg=#86cd74,bg=#40403c
  ble-face -s vim_airline_b_replace                    fg=173,bg=58  # fg=#e5786d,bg=#32322f
  ble-face -s vim_airline_b_replace_modified           fg=167,bg=238 # fg=#e55345,bg=#40403c
  ble-face -s vim_airline_b_visual                     fg=153,bg=58  # fg=#b5d3f3,bg=#32322f
  ble-face -s vim_airline_b_visual_modified            fg=110,bg=238 # fg=#7cb0e6,bg=#40403c
  ble-face -s vim_airline_c                            fg=186,bg=235 # fg=#cae682,bg=#242424
  ble-face -s vim_airline_c_inactive                   fg=243,bg=235 # fg=#767676,bg=#242424
  ble-face -s vim_airline_c_inactive_modified          fg=114,bg=16  # fg=#86cd74,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=221,bg=235 # fg=#fde76e,bg=#242424
  ble-face -s vim_airline_c_insert_modified            fg=221,bg=235 # fg=#fade3e,bg=#242424
  ble-face -s vim_airline_c_normal_modified            fg=114,bg=235 # fg=#86cd74,bg=#242424
  ble-face -s vim_airline_c_replace                    fg=173,bg=235 # fg=#e5786d,bg=#242424
  ble-face -s vim_airline_c_replace_modified           fg=167,bg=235 # fg=#e55345,bg=#242424
  ble-face -s vim_airline_c_visual                     fg=153,bg=235 # fg=#b5d3f3,bg=#242424
  ble-face -s vim_airline_c_visual_modified            fg=110,bg=235 # fg=#7cb0e6,bg=#242424
}
