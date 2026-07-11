# vim: ft=bash
# Dracula color scheme for ble.sh
# Based on the official Dracula color palette
# Author: shifu-ukraine
# SPDX-License-Identifier: BSD-3-Clause

ble-import contrib/scheme/default

function ble/contrib/scheme:dracula/initialize {
  ble/contrib/scheme:default/initialize

  # Dracula color palette:
  ble/color/alias/set basic1  '#FF5555' # Red
  ble/color/alias/set basic2  '#50FA7B' # Green
  ble/color/alias/set basic3  '#F1FA8C' # Yellow
  ble/color/alias/set basic4  '#BD93F9' # Purple
  ble/color/alias/set basic5  '#FF79C6' # Pink
  ble/color/alias/set basic6  '#8BE9FD' # Cyan
  ble/color/alias/set basic7  '#F8F8F2' # Foreground
  ble/color/alias/set basic8  '#6272A4' # Comment
  ble/color/alias/set custom1 '#282A36' # Background
  ble/color/alias/set custom2 '#44475A' # Current
  ble/color/alias/set custom3 '#FFB86C' # Orange

  # Базовий синтаксис
  ble-face -s syntax_default            fg=%basic4,bold
  ble-face -s syntax_comment            fg=%basic8
  ble-face -s syntax_command            fg=%basic6
  ble-face -s syntax_function_name      fg=%basic2,bold
  ble-face -s syntax_delimiter          fg=%custom3
  ble-face -s syntax_brace              fg=%basic2
  ble-face -s syntax_escape             fg=%basic4
  ble-face -s syntax_expr               fg=%basic5
  ble-face -s syntax_glob               fg=%custom3,bold
  ble-face -s syntax_param_expansion    fg=%basic4
  ble-face -s syntax_varname            fg=%basic2
  ble-face -s syntax_quoted             fg=%basic3
  ble-face -s syntax_quotation          fg=%basic3,bold
  ble-face -s syntax_error              fg=%basic1,bold
  ble-face -s syntax_document           fg=%basic3
  ble-face -s syntax_document_begin     fg=%basic3,bold
  ble-face -s syntax_history_expansion  fg=%basic7,bg=%custom2
  ble-face -s syntax_tilde              fg=%basic4,bold

  # Типи команд
  ble-face -s command_builtin           fg=%basic6,bold
  ble-face -s command_function          fg=%basic6,underline
  ble-face -s command_file              fg=%basic6
  ble-face -s command_directory         fg=%basic4,underline
  ble-face -s command_keyword           fg=%basic5,bold
  ble-face -s command_alias             fg=%basic6
  ble-face -s command_suffix            fg=%basic7,bg=%custom2
  ble-face -s command_suffix_new        fg=%basic7,bg=%basic1,bold
  ble-face -s command_jobs              fg=%basic1,bold

  # Імена файлів при автодоповненні
  ble-face -s filename_directory        fg=%basic4,underline
  ble-face -s filename_executable       fg=%basic4,bold
  ble-face -s filename_link             fg=%basic4,underline
  ble-face -s filename_orphan           fg=%basic1
  ble-face -s filename_warning          fg=%basic1,underline
  ble-face -s filename_directory_sticky fg=%basic7,bg=%custom2,underline
  ble-face -s filename_character        fg=%basic6,bg=%custom1,underline
  ble-face -s filename_block            fg=%basic3,bg=%custom1,underline
  ble-face -s filename_pipe             fg=%basic2,bg=%custom1,underline
  ble-face -s filename_setgid           fg=%custom1,bg=%custom3,underline
  ble-face -s filename_setuid           fg=%custom1,bg=%basic1,underline
  ble-face -s filename_socket           fg=%basic4,bg=%custom1,underline
  ble-face -s filename_url              fg=%basic6,underline
  ble-face -s filename_ls_colors        none
  ble-face -s filename_other            none

  # Автодоповнення та меню (використовуємо Current Line для підсвічування)
  ble-face -s auto_complete             fg=%basic8
  ble-face -s menu_complete_match       fg=%basic3,bold
  ble-face -s menu_complete_selected    fg=%basic7,bg=%custom2
  ble-face -s menu_filter_input         fg=%custom1,bg=%basic3

  # Виділення тексту (Region) та режими
  ble-face -s region                    bg=%custom2
  ble-face -s region_insert             fg=%basic7,bg=%custom2
  ble-face -s region_match              fg=%custom1,bg=%basic4
  ble-face -s region_target             fg=%custom1,bg=%basic6
  ble-face -s overwrite_mode            fg=%custom1,bg=%custom3
  ble-face -s prompt_status_line        fg=%basic7,bg=%custom2

  # Аргументи та прапорці команд
  ble-face -s argument_option           fg=%custom3
  ble-face -s argument_error            fg=%basic7,bg=%basic1,bold

  # Стани змінних
  ble-face -s varname_export            fg=%basic5,bold
  ble-face -s varname_readonly          fg=%basic4,bold
  ble-face -s varname_new               fg=%basic2
  ble-face -s varname_unset             fg=%basic8
  ble-face -s varname_empty             fg=%basic8,bold
  ble-face -s varname_expr              fg=%basic4
  ble-face -s varname_hash              fg=%basic2,bold
  ble-face -s varname_number            fg=%basic3
  ble-face -s varname_transform         fg=%custom3
  ble-face -s varname_array             fg=%custom3,bold

  # Переходи cd (зараз синьо-зелені індекси)
  ble-face -s cmdinfo_cd_cdpath         fg=%basic8,bg=%custom2
  # Вимкнені/неактивні елементи
  ble-face -s disabled                  fg=%basic8
  # Очищення екрана візуального дзвінка
  ble-face -s vbell_erase               bg=%custom1
}
