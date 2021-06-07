# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_macintosh.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Macintosh vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Rebecca Bettencourt (http://www.kreativekorp.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_macintosh/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=238,bg=244 # fg=#404040,bg=#808080
  ble-face -s vim_airline_a_inactive                   fg=238,bg=238 # fg=#404040,bg=#404040
  ble-face -s vim_airline_a_insert                     fg=238,bg=34  # fg=#404040,bg=#1fb714
  ble-face -s vim_airline_a_replace                    fg=238,bg=55  # fg=#404040,bg=#4700a5
  ble-face -s vim_airline_a_visual                     fg=238,bg=202 # fg=#404040,bg=#ff6403
  ble-face -s vim_airline_b                            fg=244,bg=238 # fg=#808080,bg=#404040
  ble-face -s vim_airline_c                            fg=244,bg=238 # fg=#808080,bg=#404040
  ble-face -s vim_airline_c_inactive                   fg=250,bg=238 # fg=#c0c0c0,bg=#404040
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=238 # fg=#ffffff,bg=#404040
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=238 # fg=#ffffff,bg=#404040
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=238 # fg=#ffffff,bg=#404040
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=238 # fg=#ffffff,bg=#404040
}
