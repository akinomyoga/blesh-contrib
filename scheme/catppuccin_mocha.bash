# Scheme Inspired by catppuccin mocha
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/default

function ble/contrib/scheme:catppuccin_mocha/initialize {
  ble/contrib/scheme:default/initialize

  ble/color/alias/set basic0   '#45475a' # Surface1
  ble/color/alias/set basic1   '#f38ba8' # Red
  ble/color/alias/set basic2   '#a6e3a1' # Green
  ble/color/alias/set basic3   '#f9e2af' # Yellow
  ble/color/alias/set basic4   '#89b4fa' # Blue
  ble/color/alias/set cursor   '#f5e0dc' # Rosewater
  ble/color/alias/set custom1  '#11111b' # Crust
  ble/color/alias/set custom2  '#fab387' # Peach
  ble/color/alias/set custom3  '#74c7ec' # Sapphire
  ble/color/alias/set custom4  '#cba6f7' # Mauve
  ble/color/alias/set custom5  '#f2cdcd' # Flamingo
  ble/color/alias/set custom6  '#89dceb' # Sky
  ble/color/alias/set custom7  '#6c7086' # Overlay0
  ble/color/alias/set custom8  '#b4befe' # Lavender
  ble/color/alias/set custom9  '#313244' # Surface0
  ble/color/alias/set custom10 '#9399b2' # Overlay2

  ble-face -s argument_error            'bg=%basic1,fg=%custom1'            # light foreground for better contrast
  ble-face -s argument_option           'fg=%custom5,italic'
  ble-face -s auto_complete             'fg=%basic0,italic'
  ble-face -s cmdinfo_cd_cdpath         'fg=%basic4,bg=%custom1,italic'
  ble-face -s command_alias             'fg=%custom3'
  ble-face -s command_builtin           'fg=%custom2'
  ble-face -s command_directory         'fg=%basic4'
  ble-face -s command_file              'fg=%custom3'
  ble-face -s command_function          'fg=%custom3'
  ble-face -s command_keyword           'fg=%custom4'
  ble-face -s disabled                  'fg=%custom9'
  ble-face -s filename_directory        'fg=%basic4'
  ble-face -s filename_directory_sticky 'fg=%custom1,bg=%basic2'
  ble-face -s filename_executable       'fg=%basic2,bold'
  ble-face -s filename_ls_colors        'none'
  ble-face -s filename_orphan           'fg=%custom6,bold'
  ble-face -s filename_other            'none'
  ble-face -s filename_setgid           'fg=%custom1,bg=%basic3,underline'  # light foreground for better contrast
  ble-face -s filename_setuid           'fg=%custom1,bg=%custom2,underline' # light foreground for better contrast
  ble-face -s menu_filter_input         'fg=%custom1,bg=%basic3'            # light foreground for better contrast
  ble-face -s overwrite_mode            'fg=%custom1,bg=%custom6'           # light foreground for better contrast
  ble-face -s prompt_status_line        'bg=%custom10'
  ble-face -s region                    'bg=%basic0'
  ble-face -s region_insert             'bg=%basic0'
  ble-face -s region_match              'fg=%custom1,bg=%basic3'
  ble-face -s region_target             'fg=%custom1,bg=%custom4'
  ble-face -s syntax_brace              'fg=%custom7'
  ble-face -s syntax_command            'fg=%custom3'
  ble-face -s syntax_comment            'fg=%basic3'
  ble-face -s syntax_delimiter          'fg=%custom7'
  ble-face -s syntax_document           'fg=%cursor,bold'
  ble-face -s syntax_document_begin     'fg=%cursor,bold'
  ble-face -s syntax_error              'bg=%basic1,fg=%custom1'            # light foreground for better contrast
  ble-face -s syntax_escape             'fg=%custom5'
  ble-face -s syntax_expr               'fg=%custom4'
  ble-face -s syntax_function_name      'fg=%custom8'
  ble-face -s syntax_glob               'fg=%custom2'
  ble-face -s syntax_history_expansion  'fg=%custom8,italic'
  ble-face -s syntax_param_expansion    'fg=%basic1'
  ble-face -s syntax_quotation          'fg=%basic2'
  ble-face -s syntax_tilde              'fg=%custom4'
  ble-face -s syntax_varname            'fg=%cursor'
  ble-face -s varname_array             'fg=%custom2'
  ble-face -s varname_empty             'fg=%custom2'
  ble-face -s varname_export            'fg=%custom2'
  ble-face -s varname_expr              'fg=%custom2'
  ble-face -s varname_hash              'fg=%custom2'
  ble-face -s varname_number            'fg=%cursor'
  ble-face -s varname_readonly          'fg=%custom2'
  ble-face -s varname_transform         'fg=%custom2'
  ble-face -s varname_unset             'bg=%basic1,fg=%custom1'            # light foreground for better contrast
  ble-face -s vbell_erase               'bg=%basic0'
}
