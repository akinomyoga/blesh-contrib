# ble.sh Color Scheme inspired by Tokyo Night theme for NeoVim created by folke.
# https://github.com/folke/tokyonight.nvim

ble-import contrib/scheme/default

function ble/contrib/scheme:tokyonight/initialize {
  ble/contrib/scheme:default/initialize

  ble/color/alias/set basic0   '#16161e' # bg_dark
  ble/color/alias/set basic1   '#f7768e' # red
  ble/color/alias/set basic2   '#9ece6a' # green
  ble/color/alias/set basic3   '#e0af68' # yellow 
  ble/color/alias/set basic4   '#7aa2f7' # blue
  ble/color/alias/set basic5   '#9d7cd8' # purple
  ble/color/alias/set basic6   '#1abc9c' # teal
  ble/color/alias/set basic7   '#c0caf5' # fg
  ble/color/alias/set basic8   '#7dcfff' # bg
  ble/color/alias/set basic9   '#ff9e64' # orange
  ble/color/alias/set basic13  '#bb9af7' # magenta
  ble/color/alias/set basic14  '#7dcfff' # cyan
  ble/color/alias/set basic15  '#e5e5e5' # light_gray                    
  ble/color/alias/set custom1  '#292e42' # bg_highlight
  ble/color/alias/set custom2  '#2ac3de' # blue1
  ble/color/alias/set custom3  '#0db9d7' # blue2
  ble/color/alias/set custom4  '#89ddff' # blue5
  ble/color/alias/set custom5  '#b4f9f8' # blue6
  ble/color/alias/set custom6  '#394b70' # blue7
  ble/color/alias/set custom7  '#565f89' # comment
  ble/color/alias/set custom8  '#545c7e' # dark3 
  ble/color/alias/set custom9  '#737aa2' # dark5
  ble/color/alias/set custom10 '#6183bb' # git.change (blueish)
  ble/color/alias/set custom11 '#73daca' # green1
  ble/color/alias/set custom12 '#41a6b5' # green2

  # highlighting related to editing
  ble-face -s region                    bg=%basic8,fg=%basic7
  ble-face -s region_target             bg=%basic13,fg=%basic0
  ble-face -s region_match              bg=%custom1,fg=%basic7
  ble-face -s region_insert             fg=%basic4,bg=%custom1
  ble-face -s disabled                  fg=%custom7
  ble-face -s overwrite_mode            fg=%basic0,bg=%basic14
  ble-face -s vbell                     reverse
  ble-face -s vbell_erase               bg=%custom1
  ble-face -s vbell_flash               fg=%basic2,reverse
  ble-face -s prompt_status_line        fg=%basic7,bg=%custom9

  # syntax highlighting
  ble-face -s syntax_default            none
  ble-face -s syntax_command            fg=%basic13
  ble-face -s syntax_quoted             fg=%basic2
  ble-face -s syntax_quotation          fg=%basic2,bold
  ble-face -s syntax_escape             fg=%basic13
  ble-face -s syntax_expr               fg=%custom3
  ble-face -s syntax_error              bg=%basic1,fg=%basic7
  ble-face -s syntax_varname            fg=%basic9
  ble-face -s syntax_delimiter          bold
  ble-face -s syntax_param_expansion    fg=%custom10    
  ble-face -s syntax_history_expansion  bg=%custom4,fg=%basic7
  ble-face -s syntax_function_name      fg=%custom6,bold
  ble-face -s syntax_comment            fg=%custom7
  ble-face -s syntax_glob               fg=%basic9,bold
  ble-face -s syntax_brace              fg=%custom8,bold       
  ble-face -s syntax_tilde              fg=%basic5,bold       
  ble-face -s syntax_document           fg=%custom9
  ble-face -s syntax_document_begin     fg=%custom9,bold

  # command highlighting
  ble-face -s command_builtin_dot       fg=%basic1,bold
  ble-face -s command_builtin           fg=%basic1
  ble-face -s command_alias             fg=%basic6
  ble-face -s command_function          fg=%custom6
  ble-face -s command_file              fg=%basic2
  ble-face -s command_keyword           fg=%basic4
  ble-face -s command_jobs              fg=%basic1
  ble-face -s command_directory         fg=%custom3,underline
  ble-face -s command_suffix            fg=%basic7,bg=%basic0
  ble-face -s command_suffix_new        fg=%basic7,bg=%basic1

  # filename highlighting
  ble-face -s filename_directory        underline,fg=%custom3
  ble-face -s filename_directory_sticky underline,fg=%basic7,bg=%custom1
  ble-face -s filename_link             underline,fg=%basic6
  ble-face -s filename_orphan           underline,fg=%basic0,bg=%basic3
  ble-face -s filename_executable       underline,fg=%basic2
  ble-face -s filename_setuid           underline,fg=%basic0,bg=%basic3
  ble-face -s filename_setgid           underline,fg=%basic0,bg=%basic13
  ble-face -s filename_other            underline
  ble-face -s filename_socket           underline,fg=%basic14,bg=%basic0
  ble-face -s filename_pipe             underline,fg=%basic2,bg=%basic0
  ble-face -s filename_character        underline,fg=%basic7,bg=%basic0
  ble-face -s filename_block            underline,fg=%basic3,bg=%basic0
  ble-face -s filename_warning          underline,fg=%basic1
  ble-face -s filename_url              underline,fg=%basic4
  ble-face -s filename_ls_colors        underline

  # varname highlighting
  ble-face -s varname_array             fg=%basic9,bold
  ble-face -s varname_empty             fg=%custom2      
  ble-face -s varname_export            fg=%basic13,bold
  ble-face -s varname_expr              fg=%custom6,bold
  ble-face -s varname_hash              fg=%custom12,bold
  ble-face -s varname_new               fg=%custom11     
  ble-face -s varname_number            fg=%basic4
  ble-face -s varname_readonly          fg=%basic13
  ble-face -s varname_transform         fg=%custom3,bold
  ble-face -s varname_unset             fg=%custom7

  # argument highlighting
  ble-face -s argument_option           fg=%basic6
  ble-face -s argument_error            fg=%basic0,bg=%basic3

  # highlighting for completions
  ble-face -s auto_complete             fg=%custom5,bg=%custom1 # approximate the default fg=238,bg=254
  ble-face -s menu_complete_match       bold
  ble-face -s menu_complete_selected    reverse
  ble-face -s menu_desc_default         none
  ble-face -s menu_desc_type            ref:syntax_delimiter
  ble-face -s menu_desc_quote           ref:syntax_quoted
  ble-face -s menu_filter_fixed         bold
  ble-face -s menu_filter_input         fg=%basic0,bg=%basic15  # approximate the default fg=16,bg=229
}
