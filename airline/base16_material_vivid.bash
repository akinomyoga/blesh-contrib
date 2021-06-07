# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_material_vivid.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Material Vivid vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By joshyrobot

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_material_vivid/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=242 # fg=#27292c,bg=#676c71
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#27292c,bg=#27292c
  ble-face -s vim_airline_a_insert                     fg=235,bg=42  # fg=#27292c,bg=#00e676
  ble-face -s vim_airline_a_replace                    fg=235,bg=61  # fg=#27292c,bg=#673ab7
  ble-face -s vim_airline_a_visual                     fg=235,bg=208 # fg=#27292c,bg=#ff9800
  ble-face -s vim_airline_b                            fg=242,bg=237 # fg=#676c71,bg=#323639
  ble-face -s vim_airline_b_inactive                   fg=242,bg=235 # fg=#676c71,bg=#27292c
  ble-face -s vim_airline_c                            fg=242,bg=235 # fg=#676c71,bg=#27292c
  ble-face -s vim_airline_c_inactive                   fg=104,bg=235 # fg=#80868b,bg=#27292c
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#ffffff,bg=#27292c
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#ffffff,bg=#27292c
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#ffffff,bg=#27292c
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#ffffff,bg=#27292c
}
