# From github:vim-airline/vim-airline-themes/autoload/airline/themes/solarized_flood.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Name: Solarized Flood
# Changed: June 3 2018
# Maintainer: https://github.com/Neur1n
# Description:
#   A vim-airline theme made based on and tested with the Solarized colorscheme
#   (https://github.com/frankier/neovim-colors-solarized-truecolor-only) in
#   Windows 10 OS and GVim 8.1.
#
#   This script is based on the 'dark' theme. The 'inactive' and 'ctrlp' parts
#   were not changed.
#
#   It is call 'flood' since the statusline and the tabline will be highlighted
#   with the 'base03' color in Solarized (dark). If you use the dark Solarized
#   colorscheme for Vim and, in Windows, set 'Personalization-Colors-Choose
#   your color - Custom color' to be '#002B36' (*), then most parts of the GVim
#   window will be 'flooded' with the color.
#   NOTE: This will make some components of the airline less distinguishable
#         from the others. If anyone has better ideas, I will be happy to take
#         a conversation with you. :)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:solarized_flood/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=100  # fg=#002b36,bg=#859900
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=17,bg=36   # fg=#002b36,bg=#2aa198
  ble-face -s vim_airline_a_replace                    fg=17,bg=166  # fg=#002b36,bg=#dc322f
  ble-face -s vim_airline_a_visual                     fg=17,bg=136  # fg=#002b36,bg=#b58900
  ble-face -s vim_airline_b                            fg=109,bg=17  # fg=#93a1a1,bg=#002b36
  ble-face -s vim_airline_b_inactive                   fg=239,bg=235 # fg=#4e4e4e,bg=#262626
  ble-face -s vim_airline_c                            fg=36,bg=17   # fg=#2aa198,bg=#002b36
  ble-face -s vim_airline_c_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c_inactive_modified          fg=97,bg=231  # fg=#875faf,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=32,bg=17   # fg=#268bd2,bg=#002b36
  ble-face -s vim_airline_c_insert_modified            fg=168,bg=17  # fg=#d33682,bg=#002b36
  ble-face -s vim_airline_c_normal_modified            fg=168,bg=17  # fg=#d33682,bg=#002b36
  ble-face -s vim_airline_c_replace_modified           fg=168,bg=17  # fg=#d33682,bg=#002b36
  ble-face -s vim_airline_c_visual                     fg=166,bg=17  # fg=#dc322f,bg=#002b36
  ble-face -s vim_airline_c_visual_modified            fg=168,bg=17  # fg=#d33682,bg=#002b36
  ble-face -s vim_airline_z_insert                     fg=36,bg=17   # fg=#2aa198,bg=#002b36
  ble-face -s vim_airline_z_normal                     fg=100,bg=17  # fg=#859900,bg=#002b36
  ble-face -s vim_airline_z_replace                    fg=36,bg=17   # fg=#2aa198,bg=#002b36
  ble-face -s vim_airline_z_visual                     fg=136,bg=17  # fg=#b58900,bg=#002b36
}
