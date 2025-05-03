# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_synth_midnight_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Synth Midnight Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Michaël Ball (http://github.com/michael-ball/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_synth_midnight_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=233,bg=250 # fg=#141414,bg=#bfbbbf
  ble-face -s vim_airline_a_inactive                   fg=233,bg=233 # fg=#141414,bg=#141414
  ble-face -s vim_airline_a_insert                     fg=233,bg=41  # fg=#141414,bg=#06ea61
  ble-face -s vim_airline_a_replace                    fg=233,bg=170 # fg=#141414,bg=#ea5ce2
  ble-face -s vim_airline_a_visual                     fg=233,bg=166 # fg=#141414,bg=#e4600e
  ble-face -s vim_airline_b                            fg=250,bg=235 # fg=#bfbbbf,bg=#242424
  ble-face -s vim_airline_b_inactive                   fg=250,bg=233 # fg=#bfbbbf,bg=#141414
  ble-face -s vim_airline_c                            fg=250,bg=233 # fg=#bfbbbf,bg=#141414
  ble-face -s vim_airline_c_inactive                   fg=253,bg=233 # fg=#dfdbdf,bg=#141414
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=233 # fg=#fffbff,bg=#141414
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=233 # fg=#fffbff,bg=#141414
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=233 # fg=#fffbff,bg=#141414
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=233 # fg=#fffbff,bg=#141414
}
