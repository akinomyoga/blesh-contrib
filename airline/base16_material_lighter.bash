# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_material_lighter.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Material Lighter vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Nate Peterson

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_material_lighter/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=189,bg=103 # fg=#e7eaec,bg=#8796b0
  ble-face -s vim_airline_a_inactive                   fg=189,bg=189 # fg=#e7eaec,bg=#e7eaec
  ble-face -s vim_airline_a_insert                     fg=189,bg=107 # fg=#e7eaec,bg=#91b859
  ble-face -s vim_airline_a_replace                    fg=189,bg=99  # fg=#e7eaec,bg=#7c4dff
  ble-face -s vim_airline_a_visual                     fg=189,bg=203 # fg=#e7eaec,bg=#f76d47
  ble-face -s vim_airline_b                            fg=103,bg=254 # fg=#8796b0,bg=#cceae7
  ble-face -s vim_airline_b_inactive                   fg=103,bg=189 # fg=#8796b0,bg=#e7eaec
  ble-face -s vim_airline_c                            fg=103,bg=189 # fg=#8796b0,bg=#e7eaec
  ble-face -s vim_airline_c_inactive                   fg=116,bg=189 # fg=#80cbc4,bg=#e7eaec
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=189 # fg=#ffffff,bg=#e7eaec
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=189 # fg=#ffffff,bg=#e7eaec
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=189 # fg=#ffffff,bg=#e7eaec
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=189 # fg=#ffffff,bg=#e7eaec
}
