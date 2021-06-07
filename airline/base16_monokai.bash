# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_monokai.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Monokai Scheme by Wimer Hazenberg (http://www.monokai.nl)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_monokai/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=148 # fg=#383830,bg=#a6e22e
  ble-face -s vim_airline_a_inactive                   fg=255,bg=237 # fg=#f8f8f2,bg=#383830
  ble-face -s vim_airline_a_insert                     fg=237,bg=81  # fg=#383830,bg=#66d9ef
  ble-face -s vim_airline_a_replace                    fg=237,bg=197 # fg=#383830,bg=#f92672
  ble-face -s vim_airline_a_visual                     fg=237,bg=141 # fg=#383830,bg=#ae81ff
  ble-face -s vim_airline_b                            fg=255,bg=238 # fg=#f5f4f1,bg=#49483e
  ble-face -s vim_airline_b_inactive                   fg=255,bg=237 # fg=#f8f8f2,bg=#383830
  ble-face -s vim_airline_c                            fg=208,bg=237 # fg=#fd971f,bg=#383830
  ble-face -s vim_airline_c_inactive                   fg=255,bg=237 # fg=#f8f8f2,bg=#383830
}
