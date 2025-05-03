# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_darktooth.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Base16 Darktooth vim-airline-theme (https://github.com/dawikur/base16-vim-airline-themes)
# For vim-airline (https://github.com/vim-airline/vim-airline)
# By Jason Milkins (https://github.com/jasonm23)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_darktooth/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=58,bg=244  # fg=#32302f,bg=#928374
  ble-face -s vim_airline_a_inactive                   fg=58,bg=58   # fg=#32302f,bg=#32302f
  ble-face -s vim_airline_a_insert                     fg=58,bg=108  # fg=#32302f,bg=#95c085
  ble-face -s vim_airline_a_replace                    fg=58,bg=96   # fg=#32302f,bg=#8f4673
  ble-face -s vim_airline_a_visual                     fg=58,bg=208  # fg=#32302f,bg=#fe8625
  ble-face -s vim_airline_b                            fg=244,bg=239 # fg=#928374,bg=#504945
  ble-face -s vim_airline_b_inactive                   fg=244,bg=58  # fg=#928374,bg=#32302f
  ble-face -s vim_airline_c                            fg=244,bg=58  # fg=#928374,bg=#32302f
  ble-face -s vim_airline_c_inactive                   fg=138,bg=58  # fg=#a89984,bg=#32302f
  ble-face -s vim_airline_c_insert_modified            fg=229,bg=58  # fg=#fdf4c1,bg=#32302f
  ble-face -s vim_airline_c_normal_modified            fg=229,bg=58  # fg=#fdf4c1,bg=#32302f
  ble-face -s vim_airline_c_replace_modified           fg=229,bg=58  # fg=#fdf4c1,bg=#32302f
  ble-face -s vim_airline_c_visual_modified            fg=229,bg=58  # fg=#fdf4c1,bg=#32302f
}
