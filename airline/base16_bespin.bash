# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_bespin.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base 16 Bespin Scheme by Jan T. Sott

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_bespin/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=58,bg=70   # fg=#36312e,bg=#54be0d
  ble-face -s vim_airline_a_inactive                   fg=106,bg=58  # fg=#8a8986,bg=#36312e
  ble-face -s vim_airline_a_insert                     fg=58,bg=74   # fg=#36312e,bg=#5ea6ea
  ble-face -s vim_airline_a_replace                    fg=58,bg=167  # fg=#36312e,bg=#cf6a4c
  ble-face -s vim_airline_a_visual                     fg=58,bg=139  # fg=#36312e,bg=#9b859d
  ble-face -s vim_airline_b                            fg=144,bg=60  # fg=#9d9b97,bg=#5e5d5c
  ble-face -s vim_airline_b_inactive                   fg=106,bg=58  # fg=#8a8986,bg=#36312e
  ble-face -s vim_airline_c                            fg=173,bg=58  # fg=#cf7d34,bg=#36312e
  ble-face -s vim_airline_c_inactive                   fg=106,bg=58  # fg=#8a8986,bg=#36312e
}
