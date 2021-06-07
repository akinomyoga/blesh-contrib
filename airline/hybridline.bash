# From github:vim-airline/vim-airline-themes/autoload/airline/themes/hybridline.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline theme based on vim-hybrid and powerline
# (https://github.com/w0ng/vim-hybrid)
# (https://github.com/Lokaltog/powerline)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:hybridline/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=22,bg=143  # fg=#005f00,bg=#b5bd68
  ble-face -s vim_airline_a_inactive                   fg=239,bg=234 # fg=#4e4e4e,bg=#1c1c1c
  ble-face -s vim_airline_a_insert                     fg=23,bg=109  # fg=#005f5f,bg=#8abeb7
  ble-face -s vim_airline_a_replace                    fg=16,bg=167  # fg=#000000,bg=#cc6666
  ble-face -s vim_airline_a_visual                     fg=16,bg=173  # fg=#000000,bg=#de935f
  ble-face -s vim_airline_b                            fg=251,bg=237 # fg=#c5c8c6,bg=#373b41
  ble-face -s vim_airline_b_inactive                   fg=239,bg=235 # fg=#4e4e4e,bg=#262626
  ble-face -s vim_airline_b_insert                     fg=251,bg=31  # fg=#c5c8c6,bg=#0087af
  ble-face -s vim_airline_b_replace                    fg=251,bg=237 # fg=#c5c8c6,bg=#373b41
  ble-face -s vim_airline_c                            fg=231,bg=236 # fg=#ffffff,bg=#282a2e
  ble-face -s vim_airline_c_inactive                   fg=239,bg=236 # fg=#4e4e4e,bg=#303030
  ble-face -s vim_airline_c_insert                     fg=231,bg=24  # fg=#ffffff,bg=#005f87
  ble-face -s vim_airline_c_replace                    fg=231,bg=236 # fg=#ffffff,bg=#282a2e
  ble-face -s vim_airline_z_normal                     fg=236,bg=251 # fg=#282a2e,bg=#c5c8c6
  ble-face -s vim_airline_z_replace                    fg=236,bg=251 # fg=#282a2e,bg=#c5c8c6
  ble-face -s vim_airline_z_visual                     fg=236,bg=251 # fg=#282a2e,bg=#c5c8c6
}
