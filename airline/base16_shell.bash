# From github:vim-airline/vim-airline-themes/autoload/airline/themes/base16_shell.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# This theme has been improved and renamed to base16_vim. The following is
# provided for backward compatibility.

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:base16_shell/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=234,bg=143 # fg=#181818,bg=#a1b56c
  ble-face -s vim_airline_a_inactive                   fg=240,bg=235 # fg=#585858,bg=#282828
  ble-face -s vim_airline_a_insert                     fg=235,bg=109 # fg=#282828,bg=#7cafc2
  ble-face -s vim_airline_a_replace                    fg=235,bg=131 # fg=#282828,bg=#ab4642
  ble-face -s vim_airline_a_visual                     fg=235,bg=139 # fg=#282828,bg=#ba8baf
  ble-face -s vim_airline_b                            fg=250,bg=237 # fg=#b8b8b8,bg=#383838
  ble-face -s vim_airline_b_inactive                   fg=240,bg=235 # fg=#585858,bg=#282828
  ble-face -s vim_airline_c                            fg=143,bg=235 # fg=#a1b56c,bg=#282828
  ble-face -s vim_airline_c_inactive                   fg=240,bg=235 # fg=#585858,bg=#282828
  ble-face -s vim_airline_c_inactive_modified          fg=173,bg=16  # fg=#dc9656,bg=#000000
  ble-face -s vim_airline_c_insert                     fg=109,bg=235 # fg=#7cafc2,bg=#282828
  ble-face -s vim_airline_c_insert_modified            fg=173,bg=235 # fg=#dc9656,bg=#282828
  ble-face -s vim_airline_c_normal_modified            fg=173,bg=235 # fg=#dc9656,bg=#282828
  ble-face -s vim_airline_c_replace                    fg=131,bg=235 # fg=#ab4642,bg=#282828
  ble-face -s vim_airline_c_replace_modified           fg=173,bg=235 # fg=#dc9656,bg=#282828
  ble-face -s vim_airline_c_visual                     fg=139,bg=235 # fg=#ba8baf,bg=#282828
}
