# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_default_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Default Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_default_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=250 # fg=#282828,bg=#b8b8b8
  ble-face -s vim_airline_a_inactive                   fg=235,bg=235 # fg=#282828,bg=#282828
  ble-face -s vim_airline_a_insert                     fg=235,bg=143 # fg=#282828,bg=#a1b56c
  ble-face -s vim_airline_a_replace                    fg=235,bg=139 # fg=#282828,bg=#ba8baf
  ble-face -s vim_airline_a_visual                     fg=235,bg=173 # fg=#282828,bg=#dc9656
  ble-face -s vim_airline_b                            fg=250,bg=237 # fg=#b8b8b8,bg=#383838
  ble-face -s vim_airline_b_inactive                   fg=250,bg=235 # fg=#b8b8b8,bg=#282828
  ble-face -s vim_airline_c                            fg=250,bg=235 # fg=#b8b8b8,bg=#282828
  ble-face -s vim_airline_c_inactive                   fg=192,bg=235 # fg=#d8d8d8,bg=#282828
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#282828
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#282828
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#f8f8f8,bg=#282828
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#f8f8f8,bg=#282828
}
