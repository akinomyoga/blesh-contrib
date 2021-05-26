# From github:vim-airline/vim-airline-themes/autoload/airline/themes/google_light.vim
#   The MIT License (MIT)
#   Copyright (C) 2013-2021 Bailey Ling & Contributors.
#
# vim-airline template by danrneal (http://github.com/danrneal)
# Google Scheme by Lisie Michel (https://github.com/google/vim-colorscheme-primary/)

ble-import lib/vim-airline

function ble/lib/vim-airline/theme:google_light/initialize {
  ble-face -r vim_airline_@
  ble-face -s vim_airline_a                            fg=231,bg=71  # fg=#ffffff,bg=#34a853
  ble-face -s vim_airline_a_inactive                   fg=231,bg=189 # fg=#ffffff,bg=#e8eaed
  ble-face -s vim_airline_a_insert                     fg=231,bg=69  # fg=#ffffff,bg=#4285f4
  ble-face -s vim_airline_a_replace                    fg=231,bg=167 # fg=#ffffff,bg=#ea4335
  ble-face -s vim_airline_a_visual                     fg=231,bg=214 # fg=#ffffff,bg=#fbbc04
  ble-face -s vim_airline_b                            fg=59,bg=189  # fg=#5f6368,bg=#e8eaed
  ble-face -s vim_airline_c                            fg=71,bg=231  # fg=#34a853,bg=#ffffff
  ble-face -s vim_airline_c_inactive                   fg=189,bg=231 # fg=#e8eaed,bg=#ffffff
  ble-face -s vim_airline_c_inactive_modified          fg=16,bg=231  # fg=#202124,bg=#ffffff
  ble-face -s vim_airline_c_insert                     fg=69,bg=231  # fg=#4285f4,bg=#ffffff
  ble-face -s vim_airline_c_insert_modified            fg=16,bg=231  # fg=#202124,bg=#ffffff
  ble-face -s vim_airline_c_normal_modified            fg=16,bg=231  # fg=#202124,bg=#ffffff
  ble-face -s vim_airline_c_replace                    fg=167,bg=231 # fg=#ea4335,bg=#ffffff
  ble-face -s vim_airline_c_replace_modified           fg=16,bg=231  # fg=#202124,bg=#ffffff
  ble-face -s vim_airline_c_visual                     fg=214,bg=231 # fg=#fbbc04,bg=#ffffff
  ble-face -s vim_airline_c_visual_modified            fg=16,bg=231  # fg=#202124,bg=#ffffff
}
