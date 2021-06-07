# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_helios.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Helios vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Alex Meyer (https://github.com/reyemxela)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_helios/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=237,bg=252 # fg=#383c3e,bg=#cdcdcd
  ble-face -s vim_airline_a_inactive                   fg=237,bg=237 # fg=#383c3e,bg=#383c3e
  ble-face -s vim_airline_a_insert                     fg=237,bg=106 # fg=#383c3e,bg=#88b92d
  ble-face -s vim_airline_a_replace                    fg=237,bg=131 # fg=#383c3e,bg=#be4264
  ble-face -s vim_airline_a_visual                     fg=237,bg=208 # fg=#383c3e,bg=#eb8413
  ble-face -s vim_airline_b                            fg=252,bg=240 # fg=#cdcdcd,bg=#53585b
  ble-face -s vim_airline_b_inactive                   fg=252,bg=237 # fg=#cdcdcd,bg=#383c3e
  ble-face -s vim_airline_c                            fg=252,bg=237 # fg=#cdcdcd,bg=#383c3e
  ble-face -s vim_airline_c_inactive                   fg=189,bg=237 # fg=#d5d5d5,bg=#383c3e
  ble-face -s vim_airline_c_insert_modified            fg=254,bg=237 # fg=#e5e5e5,bg=#383c3e
  ble-face -s vim_airline_c_normal_modified            fg=254,bg=237 # fg=#e5e5e5,bg=#383c3e
  ble-face -s vim_airline_c_replace_modified           fg=254,bg=237 # fg=#e5e5e5,bg=#383c3e
  ble-face -s vim_airline_c_visual_modified            fg=254,bg=237 # fg=#e5e5e5,bg=#383c3e
}
