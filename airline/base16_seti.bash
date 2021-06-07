# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_seti.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by chartoin (http://github.com/chartoin)
# Base16 Seti UI by

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_seti/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=149 # fg=#282a2b,bg=#9fca56
  ble-face -s vim_airline_a_inactive                   fg=190,bg=235 # fg=#d6d6d6,bg=#282a2b
  ble-face -s vim_airline_a_insert                     fg=235,bg=74  # fg=#282a2b,bg=#55b5db
  ble-face -s vim_airline_a_replace                    fg=235,bg=167 # fg=#282a2b,bg=#cd3f45
  ble-face -s vim_airline_a_visual                     fg=235,bg=140 # fg=#282a2b,bg=#a074c4
  ble-face -s vim_airline_b                            fg=255,bg=66  # fg=#eeeeee,bg=#3b758c
  ble-face -s vim_airline_b_inactive                   fg=190,bg=235 # fg=#d6d6d6,bg=#282a2b
  ble-face -s vim_airline_c                            fg=173,bg=235 # fg=#db7b55,bg=#282a2b
  ble-face -s vim_airline_c_inactive                   fg=190,bg=235 # fg=#d6d6d6,bg=#282a2b
}
