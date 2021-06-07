# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_brushtrees_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Brush Trees Dark vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Abraham White &lt;abelincoln.white@gmail.com&gt;

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_brushtrees_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=60,bg=109  # fg=#5a6d7a,bg=#98afb5
  ble-face -s vim_airline_a_inactive                   fg=60,bg=60   # fg=#5a6d7a,bg=#5a6d7a
  ble-face -s vim_airline_a_insert                     fg=60,bg=108  # fg=#5a6d7a,bg=#87b386
  ble-face -s vim_airline_a_replace                    fg=60,bg=139  # fg=#5a6d7a,bg=#b386b2
  ble-face -s vim_airline_a_visual                     fg=60,bg=181  # fg=#5a6d7a,bg=#d8bba2
  ble-face -s vim_airline_b                            fg=109,bg=66  # fg=#98afb5,bg=#6d828e
  ble-face -s vim_airline_b_inactive                   fg=109,bg=60  # fg=#98afb5,bg=#5a6d7a
  ble-face -s vim_airline_c                            fg=109,bg=60  # fg=#98afb5,bg=#5a6d7a
  ble-face -s vim_airline_c_inactive                   fg=152,bg=60  # fg=#b0c5c8,bg=#5a6d7a
  ble-face -s vim_airline_c_insert_modified            fg=195,bg=60  # fg=#e3efef,bg=#5a6d7a
  ble-face -s vim_airline_c_normal_modified            fg=195,bg=60  # fg=#e3efef,bg=#5a6d7a
  ble-face -s vim_airline_c_replace_modified           fg=195,bg=60  # fg=#e3efef,bg=#5a6d7a
  ble-face -s vim_airline_c_visual_modified            fg=195,bg=60  # fg=#e3efef,bg=#5a6d7a
}
