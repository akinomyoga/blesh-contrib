# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_irblack.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 IR Black vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Timothée Poisot (http://timotheepoisot.fr)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_irblack/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=245 # fg=#242422,bg=#918f88
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#242422,bg=#242422
  ble-face -s vim_airline_a_insert                     fg=235,bg=155 # fg=#242422,bg=#a8ff60
  ble-face -s vim_airline_a_replace                    fg=235,bg=213 # fg=#242422,bg=#ff73fd
  ble-face -s vim_airline_a_visual                     fg=235,bg=179 # fg=#242422,bg=#e9c062
  ble-face -s vim_airline_b                            fg=245,bg=238 # fg=#918f88,bg=#484844
  ble-face -s vim_airline_b_inactive                   fg=245,bg=235 # fg=#918f88,bg=#242422
  ble-face -s vim_airline_c                            fg=245,bg=235 # fg=#918f88,bg=#242422
  ble-face -s vim_airline_c_inactive                   fg=249,bg=235 # fg=#b5b3aa,bg=#242422
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#fdfbee,bg=#242422
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#fdfbee,bg=#242422
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#fdfbee,bg=#242422
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#fdfbee,bg=#242422
}
