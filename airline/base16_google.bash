# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_google.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Google Scheme by Seth Wright (http://sethawright.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_google/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=29  # fg=#282a2e,bg=#198844
  ble-face -s vim_airline_a_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
  ble-face -s vim_airline_a_insert                     fg=236,bg=63  # fg=#282a2e,bg=#3971ed
  ble-face -s vim_airline_a_replace                    fg=236,bg=166 # fg=#282a2e,bg=#cc342b
  ble-face -s vim_airline_a_visual                     fg=236,bg=134 # fg=#282a2e,bg=#a36ac7
  ble-face -s vim_airline_b                            fg=254,bg=237 # fg=#e0e0e0,bg=#373b41
  ble-face -s vim_airline_b_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
  ble-face -s vim_airline_c                            fg=203,bg=236 # fg=#f96a38,bg=#282a2e
  ble-face -s vim_airline_c_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
}
