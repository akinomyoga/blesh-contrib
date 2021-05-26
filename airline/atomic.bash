# From github:vim-airline/vim-airline-themes/autoload/airline/themes/atomic.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
#----------------------------------------------------------------
#     ___   __                  _
#    /   | / /_____  ____ ___  (_)____
#   / /| |/ __/ __ \/ __ `__ \/ / ___/
#  / ___ / /_/ /_/ / / / / / / / /__
# /_/  |_\__/\____/_/ /_/ /_/_/\___/
#
#----------------------------------------------------------------
#  Theme   : Atomic
#  Version : 2.1.0
#  License : MIT
#  Author  : Gerard Bajona
#  URL     : https://github.com/gerardbm/atomic
# ----------------------------------------------------------------
#  Colors will be adapted to the current colorscheme. For better
#  contrast use the atomic colorscheme: it has ten color palettes
#  with sixteen colors selected procedurally (algorithms).
#
#  Atomic colorscheme: https://github.com/gerardbm/vim-atomic
# ----------------------------------------------------------------

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:atomic/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_a_inactive                   fg=124,bg=-1  # fg=#a52a2a,bg=-1
  ble-face -s vim_airline_a_insert                     fg=-1,bg=29   # fg=-1,bg=#2e8b57
  ble-face -s vim_airline_a_replace                    fg=-1,bg=231  # fg=-1,bg=#ffffff
  ble-face -s vim_airline_a_visual                     fg=-1,bg=196  # fg=-1,bg=#ff0000
  ble-face -s vim_airline_b                            fg=-1,bg=124  # fg=-1,bg=#a52a2a
  ble-face -s vim_airline_b_inactive                   fg=124,bg=-1  # fg=#a52a2a,bg=-1
  ble-face -s vim_airline_c                            fg=-1,bg=-1   # fg=-1,bg=-1
  ble-face -s vim_airline_c_inactive                   fg=124,bg=-1  # fg=#a52a2a,bg=-1
  ble-face -s vim_airline_c_insert                     fg=29,bg=-1   # fg=#2e8b57,bg=-1
  ble-face -s vim_airline_c_replace                    fg=231,bg=-1  # fg=#ffffff,bg=-1
  ble-face -s vim_airline_c_visual                     fg=196,bg=-1  # fg=#ff0000,bg=-1
}
