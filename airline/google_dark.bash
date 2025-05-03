# From github:vim-airline/vim-airline-themes/autoload/airline/themes/google_dark.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by danrneal (http://github.com/danrneal)
# Google Scheme by Lisie Michel (https://github.com/google/vim-colorscheme-primary/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:google_dark/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=235,bg=71  # fg=#202124,bg=#34a853
  ble-face -s vim_airline_a_inactive                   fg=235,bg=241 # fg=#202124,bg=#5f6368
  ble-face -s vim_airline_a_insert                     fg=235,bg=69  # fg=#202124,bg=#4285f4
  ble-face -s vim_airline_a_replace                    fg=235,bg=167 # fg=#202124,bg=#ea4335
  ble-face -s vim_airline_a_visual                     fg=235,bg=214 # fg=#202124,bg=#fbbc04
  ble-face -s vim_airline_b                            fg=189,bg=241 # fg=#e8eaed,bg=#5f6368
  ble-face -s vim_airline_c                            fg=71,bg=235  # fg=#34a853,bg=#202124
  ble-face -s vim_airline_c_inactive                   fg=241,bg=235 # fg=#5f6368,bg=#202124
  ble-face -s vim_airline_c_inactive_modified          fg=231,bg=235 # fg=#ffffff,bg=#202124
  ble-face -s vim_airline_c_insert                     fg=69,bg=235  # fg=#4285f4,bg=#202124
  ble-face -s vim_airline_c_insert_modified            fg=231,bg=235 # fg=#ffffff,bg=#202124
  ble-face -s vim_airline_c_normal_modified            fg=231,bg=235 # fg=#ffffff,bg=#202124
  ble-face -s vim_airline_c_replace                    fg=167,bg=235 # fg=#ea4335,bg=#202124
  ble-face -s vim_airline_c_replace_modified           fg=231,bg=235 # fg=#ffffff,bg=#202124
  ble-face -s vim_airline_c_visual                     fg=214,bg=235 # fg=#fbbc04,bg=#202124
  ble-face -s vim_airline_c_visual_modified            fg=231,bg=235 # fg=#ffffff,bg=#202124
}
