# Scheme Inspired by Rosé Pine Dawn
# https://rosepinetheme.com/palette/ingredients/#rose-pine-dawn
# Based on Catppuccin Mocha theme for ble.sh
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/default

function ble/contrib/scheme:rosepine_dawn/initialize {
  ble/contrib/scheme:default/initialize

  ble-face -s argument_error 'bg=#b4637a,fg=#faf4ed'            # Love background, Base foreground for better contrast
  ble-face -s argument_option 'fg=#d7827e,italic'               # Rose
  ble-face -s auto_complete 'fg=#9893a5,italic'                 # Muted
  ble-face -s cmdinfo_cd_cdpath 'fg=#907aa9,bg=#faf4ed,italic'  # Iris, Base
  ble-face -s command_alias 'fg=#56949f'                        # Foam
  ble-face -s command_builtin 'fg=#ea9d34'                      # Gold
  ble-face -s command_directory 'fg=#907aa9'                    # Iris
  ble-face -s command_file 'fg=#56949f'                         # Foam
  ble-face -s command_function 'fg=#56949f'                     # Foam
  ble-face -s command_keyword 'fg=#907aa9'                      # Iris
  ble-face -s disabled 'fg=#f2e9e1'                             # Overlay
  ble-face -s filename_directory 'fg=#907aa9'                   # Iris
  ble-face -s filename_directory_sticky 'fg=#faf4ed,bg=#286983' # Base, Pine
  ble-face -s filename_executable 'fg=#286983,bold'             # Pine
  ble-face -s filename_ls_colors 'none'
  ble-face -s filename_orphan 'fg=#56949f,bold'                 # Foam
  ble-face -s filename_other 'none'
  ble-face -s filename_setgid 'fg=#faf4ed,bg=#ea9d34,underline' # Base, Gold
  ble-face -s filename_setuid 'fg=#faf4ed,bg=#ea9d34,underline' # Base, Gold
  ble-face -s menu_filter_input 'fg=#faf4ed,bg=#ea9d34'         # Base, Gold
  ble-face -s overwrite_mode 'fg=#faf4ed,bg=#56949f'            # Base, Foam
  ble-face -s prompt_status_line 'bg=#9893a5'                   # Muted
  ble-face -s region 'bg=#fffaf3'                               # Surface
  ble-face -s region_insert 'bg=#fffaf3'                        # Surface
  ble-face -s region_match 'fg=#faf4ed,bg=#ea9d34'              # Base, Gold
  ble-face -s region_target 'fg=#faf4ed,bg=#907aa9'             # Base, Iris
  ble-face -s syntax_brace 'fg=#797593'                         # Subtle
  ble-face -s syntax_command 'fg=#56949f'                       # Foam
  ble-face -s syntax_comment 'fg=#ea9d34'                       # Gold
  ble-face -s syntax_delimiter 'fg=#797593'                     # Subtle
  ble-face -s syntax_document 'fg=#575279,bold'                 # Text
  ble-face -s syntax_document_begin 'fg=#575279,bold'           # Text
  ble-face -s syntax_error 'bg=#b4637a,fg=#faf4ed'              # Love background, Base foreground for better contrast
  ble-face -s syntax_escape 'fg=#d7827e'                        # Rose
  ble-face -s syntax_expr 'fg=#907aa9'                          # Iris
  ble-face -s syntax_function_name 'fg=#907aa9'                 # Iris
  ble-face -s syntax_glob 'fg=#ea9d34'                          # Gold
  ble-face -s syntax_history_expansion 'fg=#907aa9,italic'      # Iris
  ble-face -s syntax_param_expansion 'fg=#b4637a'               # Love
  ble-face -s syntax_quotation 'fg=#286983'                     # Pine
  ble-face -s syntax_tilde 'fg=#907aa9'                         # Iris
  ble-face -s syntax_varname 'fg=#575279'                       # Text
  ble-face -s varname_array 'fg=#ea9d34'                        # Gold
  ble-face -s varname_empty 'fg=#ea9d34'                        # Gold
  ble-face -s varname_export 'fg=#ea9d34'                       # Gold
  ble-face -s varname_expr 'fg=#ea9d34'                         # Gold
  ble-face -s varname_hash 'fg=#ea9d34'                         # Gold
  ble-face -s varname_number 'fg=#575279'                       # Text
  ble-face -s varname_readonly 'fg=#ea9d34'                     # Gold
  ble-face -s varname_transform 'fg=#ea9d34'                    # Gold
  ble-face -s varname_unset 'bg=#b4637a,fg=#faf4ed'             # Love background, Base foreground for better contrast
  ble-face -s vbell_erase 'bg=#fffaf3'                          # Surface
}
