# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_tomorrow.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Tomorrow Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_tomorrow/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=236,bg=143 # fg=#282a2e,bg=#b5bd68
  ble-face -s vim_airline_a_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
  ble-face -s vim_airline_a_insert                     fg=236,bg=109 # fg=#282a2e,bg=#81a2be
  ble-face -s vim_airline_a_replace                    fg=236,bg=167 # fg=#282a2e,bg=#cc6666
  ble-face -s vim_airline_a_visual                     fg=236,bg=139 # fg=#282a2e,bg=#b294bb
  ble-face -s vim_airline_b                            fg=254,bg=237 # fg=#e0e0e0,bg=#373b41
  ble-face -s vim_airline_b_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
  ble-face -s vim_airline_c                            fg=173,bg=236 # fg=#de935f,bg=#282a2e
  ble-face -s vim_airline_c_inactive                   fg=251,bg=236 # fg=#c5c8c6,bg=#282a2e
}
