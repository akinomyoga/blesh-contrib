# From github:vim-airline/vim-airline-themes/autoload/airline/themes/violet.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# Normal mode                                    " guifg guibg ctermfg ctermbg

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:violet/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=250,bg=97  # fg=#bcbcbc,bg=#875faf
  ble-face -s vim_airline_a_inactive                   fg=97,bg=237  # fg=#875faf,bg=#3a3a3a
  ble-face -s vim_airline_a_insert                     fg=252,bg=29  # fg=#cacfd2,bg=#009966
  ble-face -s vim_airline_a_replace                    fg=251,bg=168 # fg=#c6c6c6,bg=#ce537a
  ble-face -s vim_airline_a_visual                     fg=52,bg=205  # fg=#5f0000,bg=#ff5faf
  ble-face -s vim_airline_b                            fg=170,bg=239 # fg=#d75fd7,bg=#4e4e4e
  ble-face -s vim_airline_b_inactive                   fg=97,bg=237  # fg=#875faf,bg=#3a3a3a
  ble-face -s vim_airline_c                            fg=251,bg=237 # fg=#c6c6c6,bg=#3a3a3a
  ble-face -s vim_airline_c_inactive                   fg=97,bg=237  # fg=#875faf,bg=#3a3a3a
  ble-face -s vim_airline_z_replace                    fg=250,bg=97  # fg=#bcbcbc,bg=#875faf
}
