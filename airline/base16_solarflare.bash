# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_solarflare.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Solar Flare vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Chuck Harmston (https://chuck.harmston.ch)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_solarflare/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=17,bg=103  # fg=#222e38,bg=#85939e
  ble-face -s vim_airline_a_inactive                   fg=17,bg=17   # fg=#222e38,bg=#222e38
  ble-face -s vim_airline_a_insert                     fg=17,bg=113  # fg=#222e38,bg=#7cc844
  ble-face -s vim_airline_a_replace                    fg=17,bg=134  # fg=#222e38,bg=#a363d5
  ble-face -s vim_airline_a_visual                     fg=17,bg=166  # fg=#222e38,bg=#e66b2b
  ble-face -s vim_airline_b                            fg=103,bg=60  # fg=#85939e,bg=#586875
  ble-face -s vim_airline_b_inactive                   fg=103,bg=17  # fg=#85939e,bg=#222e38
  ble-face -s vim_airline_c                            fg=103,bg=17  # fg=#85939e,bg=#222e38
  ble-face -s vim_airline_c_inactive                   fg=148,bg=17  # fg=#a6afb8,bg=#222e38
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=17  # fg=#f5f7fa,bg=#222e38
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=17  # fg=#f5f7fa,bg=#222e38
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=17  # fg=#f5f7fa,bg=#222e38
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=17  # fg=#f5f7fa,bg=#222e38
}
