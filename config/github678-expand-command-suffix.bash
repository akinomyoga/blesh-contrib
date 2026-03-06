# blesh/contrib/config/github678-expand-command-suffix.bash
# Copyright (C) 2026, Koichi Murase <myoga.murase@gmail.com>
#
# Example:
#
#   # ~/.blerc
#   ble-import -d config/github678-expand-command-suffix -C '
#     bleopt edit_magic_expand+=github678-expand-command-suffix
#     bleopt edit_magic_accept+=github678-expand-command-suffix
#     bleopt github678_expand_command_suffix=exe:sh:bash
#   '
#
# References:
#
#   https://github.com/akinomyoga/ble.sh/discussions/678
#

bleopt/declare -v github678_expand_command_suffix exe:sh:bash

function ble/complete/expand:github678-expand-command-suffix {
  local pos comp_index=$_ble_edit_ind comp_text=$_ble_edit_str
  ble/complete/sabbrev/locate-key 'command'
  ((pos<comp_index)) || return 1

  local word=${_ble_edit_str:pos:comp_index-pos} ret
  ble/syntax:bash/simple-word/safe-eval "$word" nonull || return 1

  # When an exact match of the command is found, expansion does not happen
  local cmd=$ret
  ble/bin#has "$cmd" && return 1

  local suffixes suffix
  ble/string#split suffixes : "$bleopt_github678_expand_command_suffix"
  for suffix in "${suffixes[@]}"; do
    if [[ $suffix ]] && type -P -- "$cmd.$suffix" &>/dev/null; then
      cmd=$cmd.$suffix
      ble/widget/.replace-range "$pos" "$comp_index" "$cmd"
      return 0
    fi
  done

  # When nothing is found, we do not perform expansion.
  return 1
}
