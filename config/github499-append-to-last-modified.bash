# blesh/contrib/config/github499-append-to-last-modified.bash
# (C) 2024, Koichi Murase <myoga.murase@gmail.com>
#
# Example:
#
#   # ~/.blerc
#   ble-import config/github499-append-to-last-modified
#   ble-bind -f 'M-insert' github499/append-to-last-modified
#
# References:
#
#   https://github.com/akinomyoga/ble.sh/discussions/499
#

_ble_contrib_github499_last_modified_index=
function ble/contrib/config:github499/record-last-modified-index {
  local reason=${4-}
  [[ $reason == history ]] && return 0
  local index
  ble/history/get-index
  _ble_contrib_github499_last_modified_index=$index
}
ble/array#push _ble_edit_dirty_observer ble/contrib/config:github499/record-last-modified-index

function ble/widget/github499/append-to-last-modified {
  local ins=$_ble_edit_str
  [[ $ins ]] || return 1

  local index=$_ble_contrib_github499_last_modified_index
  [[ $index ]] || ble/history/get-count -v index
  ble-edit/history/goto "$index"
  [[ $_ble_edit_str && $_ble_edit_str != *$'\n' ]] && ins=$'\n'$ins
  local p=${#_ble_edit_str}
  ble-edit/content/replace-limited "$p" "$p" "$ins"
  ((_ble_edit_ind=${#_ble_edit_str}))
  return 0
}
