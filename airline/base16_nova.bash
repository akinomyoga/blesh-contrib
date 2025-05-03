# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_nova.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Nova vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By George Essig (https://github.com/gessig), Trevor D. Miller (https://trevordmiller.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_nova/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=60,bg=109  # fg=#556873,bg=#899ba6
  ble-face -s vim_airline_a_inactive                   fg=60,bg=60   # fg=#556873,bg=#556873
  ble-face -s vim_airline_a_insert                     fg=60,bg=110  # fg=#556873,bg=#7fc1ca
  ble-face -s vim_airline_a_replace                    fg=60,bg=104  # fg=#556873,bg=#9a93e1
  ble-face -s vim_airline_a_visual                     fg=60,bg=110  # fg=#556873,bg=#7fc1ca
  ble-face -s vim_airline_b                            fg=109,bg=66  # fg=#899ba6,bg=#6a7d89
  ble-face -s vim_airline_b_inactive                   fg=109,bg=60  # fg=#899ba6,bg=#556873
  ble-face -s vim_airline_c                            fg=109,bg=60  # fg=#899ba6,bg=#556873
  ble-face -s vim_airline_c_inactive                   fg=252,bg=60  # fg=#c5d4dd,bg=#556873
  ble-face -s vim_airline_c_insert_modified            fg=60,bg=60   # fg=#556873,bg=#556873
  ble-face -s vim_airline_c_normal_modified            fg=60,bg=60   # fg=#556873,bg=#556873
  ble-face -s vim_airline_c_replace_modified           fg=60,bg=60   # fg=#556873,bg=#556873
  ble-face -s vim_airline_c_visual_modified            fg=60,bg=60   # fg=#556873,bg=#556873
}
