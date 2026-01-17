# ble.sh Color Scheme inspired by Tokyo Night theme for NeoVim created by folke.
# https://github.com/folke/tokyonight.nvim

ble-import contrib/scheme/default

function ble/contrib/scheme:tokyo_night/initialize {
  ble/contrib/scheme:default/initialize

  # highlighting related to editing
  ble-face -s region                    "bg=#1a1b26,fg=#c0caf5"          # bg, fg
  ble-face -s region_target             "bg=#bb9af7,fg=#16161e"          # magenta, bg_dark
  ble-face -s region_match              "bg=#292e42,fg=#c0caf5"          # bg_highlight, fg
  ble-face -s region_insert             "fg=#7aa2f7,bg=#292e42"          # blue, bg_highlight
  ble-face -s disabled                  "fg=#565f89"                     # comment
  ble-face -s overwrite_mode            "fg=#16161e,bg=#7dcfff"          # bg_dark, cyan
  ble-face -s vbell                     reverse
  ble-face -s vbell_erase               "bg=#292e42"                     # bg_highlight
  ble-face -s vbell_flash               "fg=#9ece6a,reverse"             # green, reverse
  ble-face -s prompt_status_line        "fg=#c0caf5,bg=#737aa2"          # fg, dark5

  # syntax highlighting
  ble-face -s syntax_default            none
  ble-face -s syntax_command            "fg=#bb9af7"                     # magenta
  ble-face -s syntax_quoted             "fg=#9ece6a"                     # green
  ble-face -s syntax_quotation          "fg=#9ece6a,bold"                # green bold
  ble-face -s syntax_escape             "fg=#bb9af7"                     # magenta
  ble-face -s syntax_expr               "fg=#0db9d7"                     # blue2
  ble-face -s syntax_error              "bg=#f7768e,fg=#c0caf5"          # red bg, fg
  ble-face -s syntax_varname            "fg=#ff9e64"                     # orange
  ble-face -s syntax_delimiter          bold
  ble-face -s syntax_param_expansion    "fg=#6183bb"                     # git.change (blueish)
  ble-face -s syntax_history_expansion  "bg=#89ddff,fg=#c0caf5"          # blue5 bg, fg
  ble-face -s syntax_function_name      "fg=#394b70,bold"                # blue7 bold
  ble-face -s syntax_comment            "fg=#565f89"                     # comment
  ble-face -s syntax_glob               "fg=#ff9e64,bold"                # orange bold
  ble-face -s syntax_brace              "fg=#545c7e,bold"                # dark3 bold
  ble-face -s syntax_tilde              "fg=#9d7cd8,bold"                # purple bold
  ble-face -s syntax_document           "fg=#737aa2"                     # dark5
  ble-face -s syntax_document_begin     "fg=#737aa2,bold"                # dark5 bold

  # command highlighting
  ble-face -s command_builtin_dot       "fg=#f7768e,bold"                # red bold
  ble-face -s command_builtin           "fg=#f7768e"                    # red
  ble-face -s command_alias             "fg=#1abc9c"                    # teal
  ble-face -s command_function          "fg=#394b70"                    # blue7
  ble-face -s command_file              "fg=#9ece6a"                    # green
  ble-face -s command_keyword           "fg=#7aa2f7"                    # blue
  ble-face -s command_jobs              "fg=#f7768e"                    # red
  ble-face -s command_directory         "fg=#0db9d7,underline"          # blue2 underline
  ble-face -s command_suffix            "fg=#c0caf5,bg=#16161e"         # fg, bg_dark
  ble-face -s command_suffix_new        "fg=#c0caf5,bg=#f7768e"         # fg, red bg

  # filename highlighting
  ble-face -s filename_directory        "underline,fg=#0db9d7"          # underline, blue2
  ble-face -s filename_directory_sticky "underline,fg=#c0caf5,bg=#292e42" # underline, fg, bg_highlight
  ble-face -s filename_link             "underline,fg=#1abc9c"          # underline, teal
  ble-face -s filename_orphan           "underline,fg=#16161e,bg=#e0af68" # underline, bg_dark fg, yellow bg
  ble-face -s filename_executable       "underline,fg=#9ece6a"          # underline, green
  ble-face -s filename_setuid           "underline,fg=#16161e,bg=#e0af68" # underline, bg_dark fg, yellow bg
  ble-face -s filename_setgid           "underline,fg=#16161e,bg=#bb9af7" # underline, bg_dark fg, magenta bg
  ble-face -s filename_other            underline
  ble-face -s filename_socket           "underline,fg=#7dcfff,bg=#16161e" # underline, cyan fg, bg_dark bg
  ble-face -s filename_pipe             "underline,fg=#9ece6a,bg=#16161e" # underline, green fg, bg_dark bg
  ble-face -s filename_character        "underline,fg=#c0caf5,bg=#16161e" # underline, fg, bg_dark bg
  ble-face -s filename_block            "underline,fg=#e0af68,bg=#16161e" # underline, yellow fg, bg_dark bg
  ble-face -s filename_warning          "underline,fg=#f7768e"          # underline, red fg
  ble-face -s filename_url              "underline,fg=#7aa2f7"          # underline, blue fg
  ble-face -s filename_ls_colors        underline

  # varname highlighting
  ble-face -s varname_array             "fg=#ff9e64,bold"               # orange bold
  ble-face -s varname_empty             "fg=#2ac3de"                   # blue1
  ble-face -s varname_export            "fg=#bb9af7,bold"              # magenta bold
  ble-face -s varname_expr              "fg=#394b70,bold"              # blue7 bold
  ble-face -s varname_hash              "fg=#41a6b5,bold"              # green2 bold
  ble-face -s varname_new               "fg=#73daca"                   # green1
  ble-face -s varname_number            "fg=#7aa2f7"                   # blue
  ble-face -s varname_readonly          "fg=#bb9af7"                   # magenta
  ble-face -s varname_transform         "fg=#0db9d7,bold"              # blue2 bold
  ble-face -s varname_unset             "fg=#565f89"                   # comment

  # argument highlighting
  ble-face -s argument_option           "fg=#1abc9c"                   # teal
  ble-face -s argument_error            "fg=#16161e,bg=#e0af68"        # bg_dark fg, yellow bg

  # highlighting for completions
  ble-face -s auto_complete             "fg=#238, bg=#254"             # approximate fg=238, bg=254 from default (use blue6 and bg_highlight)
  ble-face -s menu_complete_match       bold
  ble-face -s menu_complete_selected    reverse
  ble-face -s menu_desc_default         none
  ble-face -s menu_desc_type            ref:syntax_delimiter
  ble-face -s menu_desc_quote           ref:syntax_quoted
  ble-face -s menu_filter_fixed         bold
  ble-face -s menu_filter_input         "fg=#16161e,bg=#e5e5e5"       # fg=16,bg=229 approx (bg light gray)

}
