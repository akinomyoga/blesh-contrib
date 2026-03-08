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

ble-import core-complete

bleopt/declare -v github678_expand_command_suffix exe:sh:bash

## @fn ble/complete/expand:github678-expand-command-suffix/.map word
##   @var[out] ret
function ble/complete/expand:github678-expand-command-suffix/.map {
  ble/syntax:bash/simple-word/safe-eval "$word" nonull || return 1

  # When an exact match of the command is found, expansion does not happen
  local cmd=$ret
  ble/bin#has "$cmd" && return 1

  local suffixes suffix
  ble/string#split suffixes : "$bleopt_github678_expand_command_suffix"
  for suffix in "${suffixes[@]}"; do
    if [[ $suffix ]] && builtin type -P -- "$cmd.$suffix" &>/dev/null; then
      ret=$cmd.$suffix
      return 0
    fi
  done

  # When nothing is found, we do not perform expansion.
  return 1
}

function ble/complete/expand:github678-expand-command-suffix {
  ble/complete/expand/expand-command-name 'ble/complete/expand:github678-expand-command-suffix/.map' "$1"
}
