# Scheme Inspired by Rosé Pine Moon
# https://rosepinetheme.com/palette/ingredients/#rose-pine-moon
# Based on Catppuccin Mocha theme for ble.sh
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/default

function ble/contrib/scheme:rosepine_moon/initialize {
  ble/contrib/scheme:default/initialize

  ble-face -s argument_error 'bg=#eb6f92,fg=#232136'            # Love background, Base foreground for better contrast
  ble-face -s argument_option 'fg=#ea9a97,italic'               # Rose
  ble-face -s auto_complete 'fg=#6e6a86,italic'                 # Muted
  ble-face -s cmdinfo_cd_cdpath 'fg=#c4a7e7,bg=#232136,italic'  # Iris, Base
  ble-face -s command_alias 'fg=#9ccfd8'                        # Foam
  ble-face -s command_builtin 'fg=#f6c177'                      # Gold
  ble-face -s command_directory 'fg=#c4a7e7'                    # Iris
  ble-face -s command_file 'fg=#9ccfd8'                         # Foam
  ble-face -s command_function 'fg=#9ccfd8'                     # Foam
  ble-face -s command_keyword 'fg=#c4a7e7'                      # Iris
  ble-face -s disabled 'fg=#393552'                             # Overlay
  ble-face -s filename_directory 'fg=#c4a7e7'                   # Iris
  ble-face -s filename_directory_sticky 'fg=#232136,bg=#3e8fb0' # Base, Pine
  ble-face -s filename_executable 'fg=#3e8fb0,bold'             # Pine
  ble-face -s filename_ls_colors 'none'
  ble-face -s filename_orphan 'fg=#9ccfd8,bold'                 # Foam
  ble-face -s filename_other 'none'
  ble-face -s filename_setgid 'fg=#232136,bg=#f6c177,underline' # Base, Gold
  ble-face -s filename_setuid 'fg=#232136,bg=#f6c177,underline' # Base, Gold
  ble-face -s menu_filter_input 'fg=#232136,bg=#f6c177'         # Base, Gold
  ble-face -s overwrite_mode 'fg=#232136,bg=#9ccfd8'            # Base, Foam
  ble-face -s prompt_status_line 'bg=#6e6a86'                   # Muted
  ble-face -s region 'bg=#2a273f'                               # Surface
  ble-face -s region_insert 'bg=#2a273f'                        # Surface
  ble-face -s region_match 'fg=#232136,bg=#f6c177'              # Base, Gold
  ble-face -s region_target 'fg=#232136,bg=#c4a7e7'             # Base, Iris
  ble-face -s syntax_brace 'fg=#908caa'                         # Subtle
  ble-face -s syntax_command 'fg=#9ccfd8'                       # Foam
  ble-face -s syntax_comment 'fg=#f6c177'                       # Gold
  ble-face -s syntax_delimiter 'fg=#908caa'                     # Subtle
  ble-face -s syntax_document 'fg=#e0def4,bold'                 # Text
  ble-face -s syntax_document_begin 'fg=#e0def4,bold'           # Text
  ble-face -s syntax_error 'bg=#eb6f92,fg=#232136'              # Love background, Base foreground for better contrast
  ble-face -s syntax_escape 'fg=#ea9a97'                        # Rose
  ble-face -s syntax_expr 'fg=#c4a7e7'                          # Iris
  ble-face -s syntax_function_name 'fg=#c4a7e7'                 # Iris
  ble-face -s syntax_glob 'fg=#f6c177'                          # Gold
  ble-face -s syntax_history_expansion 'fg=#c4a7e7,italic'      # Iris
  ble-face -s syntax_param_expansion 'fg=#eb6f92'               # Love
  ble-face -s syntax_quotation 'fg=#3e8fb0'                     # Pine
  ble-face -s syntax_tilde 'fg=#c4a7e7'                         # Iris
  ble-face -s syntax_varname 'fg=#e0def4'                       # Text
  ble-face -s varname_array 'fg=#f6c177'                        # Gold
  ble-face -s varname_empty 'fg=#f6c177'                        # Gold
  ble-face -s varname_export 'fg=#f6c177'                       # Gold
  ble-face -s varname_expr 'fg=#f6c177'                         # Gold
  ble-face -s varname_hash 'fg=#f6c177'                         # Gold
  ble-face -s varname_number 'fg=#e0def4'                       # Text
  ble-face -s varname_readonly 'fg=#f6c177'                     # Gold
  ble-face -s varname_transform 'fg=#f6c177'                    # Gold
  ble-face -s varname_unset 'bg=#eb6f92,fg=#232136'             # Love background, Base foreground for better contrast
  ble-face -s vbell_erase 'bg=#2a273f'                          # Surface
}
