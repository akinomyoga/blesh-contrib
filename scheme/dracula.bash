# vim: ft=bash
# Dracula color scheme for ble.sh
# Based on the official Dracula color palette
# Author: shifu-ukraine
# SPDX-License-Identifier: BSD-3-Clause

# Dracula color palette:
# Background   #282A36
# Current      #44475A
# Foreground   #F8F8F2
# Comment      #6272A4
# Cyan         #8BE9FD
# Green        #50FA7B
# Orange       #FFB86C
# Pink         #FF79C6
# Purple       #BD93F9
# Red          #FF5555
# Yellow       #F1FA8C

ble-import contrib/scheme/default

function ble/contrib/scheme:dracula/initialize {
  ble/contrib/scheme:default/initialize
  # Базовий синтаксис
  ble-face -s syntax_default            fg=#BD93F9,bold
  ble-face -s syntax_comment            fg=#6272A4
  ble-face -s syntax_command            fg=#8BE9FD
  ble-face -s syntax_function_name      fg=#50FA7B,bold
  ble-face -s syntax_delimiter          fg=#FFB86C
  ble-face -s syntax_brace              fg=#50FA7B
  ble-face -s syntax_escape             fg=#BD93F9
  ble-face -s syntax_expr               fg=#FF79C6
  ble-face -s syntax_glob               fg=#FFB86C,bold
  ble-face -s syntax_param_expansion    fg=#BD93F9
  ble-face -s syntax_varname            fg=#50FA7B
  ble-face -s syntax_quoted             fg=#F1FA8C
  ble-face -s syntax_quotation          fg=#F1FA8C,bold
  ble-face -s syntax_error              fg=#FF5555,bold
  ble-face -s syntax_document           fg=#F1FA8C
  ble-face -s syntax_document_begin     fg=#F1FA8C,bold
  ble-face -s syntax_history_expansion  fg=#F8F8F2,bg=#44475A
  ble-face -s syntax_tilde              fg=#BD93F9,bold

  # Типи команд
  ble-face -s command_builtin           fg=#8BE9FD,bold
  ble-face -s command_function          fg=#8BE9FD,underline
  ble-face -s command_file              fg=#8BE9FD
  ble-face -s command_directory         fg=#BD93F9,underline
  ble-face -s command_keyword           fg=#FF79C6,bold
  ble-face -s command_alias             fg=#8BE9FD
  ble-face -s command_suffix            fg=#F8F8F2,bg=#44475A
  ble-face -s command_suffix_new        fg=#F8F8F2,bg=#FF5555,bold
  ble-face -s command_jobs              fg=#FF5555,bold

  # Імена файлів при автодоповненні
  ble-face -s filename_directory        fg=#BD93F9,underline
  ble-face -s filename_executable       fg=#BD93F9,bold
  ble-face -s filename_link             fg=#BD93F9,underline
  ble-face -s filename_orphan           fg=#FF5555
  ble-face -s filename_warning          fg=#FF5555,underline
  ble-face -s filename_directory_sticky fg=#F8F8F2,bg=#44475A,underline
  ble-face -s filename_character        fg=#8BE9FD,bg=#282A36,underline
  ble-face -s filename_block            fg=#F1FA8C,bg=#282A36,underline
  ble-face -s filename_pipe             fg=#50FA7B,bg=#282A36,underline
  ble-face -s filename_setgid           fg=#282A36,bg=#FFB86C,underline
  ble-face -s filename_setuid           fg=#282A36,bg=#FF5555,underline
  ble-face -s filename_socket           fg=#BD93F9,bg=#282A36,underline
  ble-face -s filename_url              fg=#8BE9FD,underline
  ble-face -s filename_ls_colors        none
  ble-face -s filename_other            none

  # Автодоповнення та меню (використовуємо Current Line для підсвічування)
  ble-face -s auto_complete             fg=#6272A4
  ble-face -s menu_complete_match       fg=#F1FA8C,bold
  ble-face -s menu_complete_selected    fg=#F8F8F2,bg=#44475A
  ble-face -s menu_filter_input         fg=#282A36,bg=#F1FA8C

  # Виділення тексту (Region) та режими
  ble-face -s region                    bg=#44475A
  ble-face -s region_insert             fg=#F8F8F2,bg=#44475A
  ble-face -s region_match              fg=#282A36,bg=#BD93F9
  ble-face -s region_target             fg=#282A36,bg=#8BE9FD
  ble-face -s overwrite_mode            fg=#282A36,bg=#FFB86C
  ble-face -s prompt_status_line        fg=#F8F8F2,bg=#44475A

  # Аргументи та прапорці команд
  ble-face -s argument_option           fg=#FFB86C
  ble-face -s argument_error            fg=#F8F8F2,bg=#FF5555,bold

  # Стани змінних
  ble-face -s varname_export            fg=#FF79C6,bold
  ble-face -s varname_readonly          fg=#BD93F9,bold
  ble-face -s varname_new               fg=#50FA7B
  ble-face -s varname_unset             fg=#6272A4
  ble-face -s varname_empty             fg=#6272A4,bold
  ble-face -s varname_expr              fg=#BD93F9
  ble-face -s varname_hash              fg=#50FA7B,bold
  ble-face -s varname_number            fg=#F1FA8C
  ble-face -s varname_transform         fg=#FFB86C
  ble-face -s varname_array             fg=#FFB86C,bold

  # Переходи cd (зараз синьо-зелені індекси)
  ble-face -s cmdinfo_cd_cdpath         fg=#6272A4,bg=#44475A
  # Вимкнені/неактивні елементи
  ble-face -s disabled                  fg=#6272A4
  # Очищення екрана візуального дзвінка
  ble-face -s vbell_erase               bg=#282A36
}
