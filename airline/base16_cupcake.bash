# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_cupcake.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Cupcake vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Chris Kempson (http://chriskempson.com)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_cupcake/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=255,bg=248 # fg=#f2f1f4,bg=#a59daf
  ble-face -s vim_airline_a_inactive                   fg=255,bg=255 # fg=#f2f1f4,bg=#f2f1f4
  ble-face -s vim_airline_a_insert                     fg=255,bg=143 # fg=#f2f1f4,bg=#a3b367
  ble-face -s vim_airline_a_replace                    fg=255,bg=139 # fg=#f2f1f4,bg=#bb99b4
  ble-face -s vim_airline_a_visual                     fg=255,bg=216 # fg=#f2f1f4,bg=#ebb790
  ble-face -s vim_airline_b                            fg=248,bg=253 # fg=#a59daf,bg=#d8d5dd
  ble-face -s vim_airline_b_inactive                   fg=248,bg=255 # fg=#a59daf,bg=#f2f1f4
  ble-face -s vim_airline_c                            fg=248,bg=255 # fg=#a59daf,bg=#f2f1f4
  ble-face -s vim_airline_c_inactive                   fg=245,bg=255 # fg=#8b8198,bg=#f2f1f4
  ble-face -s vim_airline_c_insert_modified            fg=240,bg=255 # fg=#585062,bg=#f2f1f4
  ble-face -s vim_airline_c_normal_modified            fg=240,bg=255 # fg=#585062,bg=#f2f1f4
  ble-face -s vim_airline_c_replace_modified           fg=240,bg=255 # fg=#585062,bg=#f2f1f4
  ble-face -s vim_airline_c_visual_modified            fg=240,bg=255 # fg=#585062,bg=#f2f1f4
}
