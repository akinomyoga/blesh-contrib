# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_default.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Default Scheme by Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_default/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=143 # fg=#282828,bg=#a1b56c
  ble-face -s vim_airline_a_inactive                   fg=192,bg=235 # fg=#d8d8d8,bg=#282828
  ble-face -s vim_airline_a_insert                     fg=235,bg=109 # fg=#282828,bg=#7cafc2
  ble-face -s vim_airline_a_replace                    fg=235,bg=131 # fg=#282828,bg=#ab4642
  ble-face -s vim_airline_a_visual                     fg=235,bg=139 # fg=#282828,bg=#ba8baf
  ble-face -s vim_airline_b                            fg=254,bg=237 # fg=#e8e8e8,bg=#383838
  ble-face -s vim_airline_b_inactive                   fg=192,bg=235 # fg=#d8d8d8,bg=#282828
  ble-face -s vim_airline_c                            fg=173,bg=235 # fg=#dc9656,bg=#282828
  ble-face -s vim_airline_c_inactive                   fg=192,bg=235 # fg=#d8d8d8,bg=#282828
}
