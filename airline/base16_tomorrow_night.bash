# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_tomorrow_night.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Tomorrow Night vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_tomorrow_night/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=249 # fg=#282a2e,bg=#b4b7b4
  ble-face -s vim_airline_a_inactive                   fg=236,bg=236 # fg=#282a2e,bg=#282a2e
  ble-face -s vim_airline_a_insert                     fg=236,bg=143 # fg=#282a2e,bg=#b5bd68
  ble-face -s vim_airline_a_replace                    fg=236,bg=139 # fg=#282a2e,bg=#b294bb
  ble-face -s vim_airline_a_visual                     fg=236,bg=173 # fg=#282a2e,bg=#de935f
  ble-face -s vim_airline_b                            fg=249,bg=237 # fg=#b4b7b4,bg=#373b41
  ble-face -s vim_airline_b_inactive                   fg=249,bg=236 # fg=#b4b7b4,bg=#282a2e
  ble-face -s vim_airline_c                            fg=249,bg=236 # fg=#b4b7b4,bg=#282a2e
  ble-face -s vim_airline_c_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=236 # fg=#ffffff,bg=#282a2e
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=236 # fg=#ffffff,bg=#282a2e
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=236 # fg=#ffffff,bg=#282a2e
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=236 # fg=#ffffff,bg=#282a2e
}
