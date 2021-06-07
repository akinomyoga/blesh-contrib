# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_ia_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 iA Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By iA Inc. (modified by aramisgithub)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_ia_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=250 # fg=#222222,bg=#b8b8b8
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#222222,bg=#222222
  ble-face -s vim_airline_a_insert                     fg=235,bg=107 # fg=#222222,bg=#83a471
  ble-face -s vim_airline_a_replace                    fg=235,bg=139 # fg=#222222,bg=#b98eb2
  ble-face -s vim_airline_a_visual                     fg=235,bg=167 # fg=#222222,bg=#d86868
  ble-face -s vim_airline_b                            fg=250,bg=23  # fg=#b8b8b8,bg=#1d414d
  ble-face -s vim_airline_b_inactive                   fg=250,bg=235 # fg=#b8b8b8,bg=#222222
  ble-face -s vim_airline_c                            fg=250,bg=235 # fg=#b8b8b8,bg=#222222
  ble-face -s vim_airline_c_inactive                   fg=252,bg=235 # fg=#cccccc,bg=#222222
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#222222
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#222222
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#f8f8f8,bg=#222222
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#222222
}
