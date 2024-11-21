# Scheme Inspired by catppuccin mocha
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/default

function ble/contrib/scheme:catppuccin_mocha/initialize {
  ble/contrib/scheme:default/initialize

  ble-face -s argument_error 'bg=#f38ba8,fg=#11111b'            # Red background, Crust foreground for better contrast
  ble-face -s argument_option 'fg=#f2cdcd,italic'               # Flamingo
  ble-face -s auto_complete 'fg=#45475a,italic'                 # Surface1
  ble-face -s cmdinfo_cd_cdpath 'fg=#89b4fa,bg=#11111b,italic'  # Blue, Crust
  ble-face -s command_alias 'fg=#74c7ec'                        # Sapphire
  ble-face -s command_builtin 'fg=#fab387'                      # Peach
  ble-face -s command_directory 'fg=#89b4fa'                    # Blue
  ble-face -s command_file 'fg=#74c7ec'                         # Sapphire
  ble-face -s command_function 'fg=#74c7ec'                     # Sapphire
  ble-face -s command_keyword 'fg=#cba6f7'                      # Mauve
  ble-face -s disabled 'fg=#313244'                             # Surface0
  ble-face -s filename_directory 'fg=#89b4fa'                   # Blue
  ble-face -s filename_directory_sticky 'fg=#11111b,bg=#a6e3a1' # Crust, Green
  ble-face -s filename_executable 'fg=#a6e3a1,bold'             # Green
  ble-face -s filename_ls_colors 'none'
  ble-face -s filename_orphan 'fg=#89dceb,bold' # Sky
  ble-face -s filename_other 'none'
  ble-face -s filename_setgid 'fg=#11111b,bg=#f9e2af,underline' # Crust, Yellow
  ble-face -s filename_setuid 'fg=#11111b,bg=#fab387,underline' # Crust, Peach
  ble-face -s menu_filter_input 'fg=#11111b,bg=#f9e2af'         # Crust, Yellow
  ble-face -s overwrite_mode 'fg=#11111b,bg=#89dceb'            # Crust, Sky
  ble-face -s prompt_status_line 'bg=#9399b2'                   # Overlay2
  ble-face -s region 'bg=#45475a'                               # Surface1
  ble-face -s region_insert 'bg=#45475a'                        # Surface1
  ble-face -s region_match 'fg=#11111b,bg=#f9e2af'              # Crust, Yellow
  ble-face -s region_target 'fg=#11111b,bg=#cba6f7'             # Crust, Mauve
  ble-face -s syntax_brace 'fg=#6c7086'                         # Overlay0
  ble-face -s syntax_command 'fg=#74c7ec'                       # Sapphire
  ble-face -s syntax_comment 'fg=#f9e2af'                       # Yellow
  ble-face -s syntax_delimiter 'fg=#6c7086'                     # Overlay0
  ble-face -s syntax_document 'fg=#f5e0dc,bold'                 # Rosewater
  ble-face -s syntax_document_begin 'fg=#f5e0dc,bold'           # Rosewater
  ble-face -s syntax_error 'bg=#f38ba8,fg=#11111b'              # Red background, Crust foreground for better contrast
  ble-face -s syntax_escape 'fg=#f2cdcd'                        # Flamingo
  ble-face -s syntax_expr 'fg=#cba6f7'                          # Mauve
  ble-face -s syntax_function_name 'fg=#b4befe'                 # Lavender
  ble-face -s syntax_glob 'fg=#fab387'                          # Peach
  ble-face -s syntax_history_expansion 'fg=#b4befe,italic'      # Lavender
  ble-face -s syntax_param_expansion 'fg=#f38ba8'               # Red
  ble-face -s syntax_quotation 'fg=#a6e3a1'                     # Green
  ble-face -s syntax_tilde 'fg=#cba6f7'                         # Mauve
  ble-face -s syntax_varname 'fg=#f5e0dc'                       # Rosewater
  ble-face -s varname_array 'fg=#fab387'                        # Peach
  ble-face -s varname_empty 'fg=#fab387'                        # Peach
  ble-face -s varname_export 'fg=#fab387'                       # Peach
  ble-face -s varname_expr 'fg=#fab387'                         # Peach
  ble-face -s varname_hash 'fg=#fab387'                         # Peach
  ble-face -s varname_number 'fg=#f5e0dc'                       # Rosewater
  ble-face -s varname_readonly 'fg=#fab387'                     # Peach
  ble-face -s varname_transform 'fg=#fab387'                    # Peach
  ble-face -s varname_unset 'bg=#f38ba8,fg=#11111b'             # Red background, Crust foreground for better contrast
  ble-face -s vbell_erase 'bg=#45475a'                          # Surface1
}
