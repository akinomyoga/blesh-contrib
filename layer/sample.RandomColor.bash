# ble/contrib/layer/sample.RandomColor.bash (C) 2015, akinomyoga
#
# This is a sample implementation of a highlighting layer.  This defines a
# random-color layer named `RandomColor'.  To use the layer, the layer name can
# be inserted in the array `_ble_highlight_layer_list`:
#
# ```bash
# ble-import layer/sample.RandomColor
# ble/array#insert-before _ble_highlight_layer_list syntax RandomColor
# ```
#
# Note: This code was first introduced in commit ec3f3661b@akinomyoga/ble.sh
# (2015-02-23) but later moved to contrib in refactoring on 2023-09-19.

_ble_highlight_layer_RandomColor_buff=()

function ble/highlight/layer:RandomColor/update {
  local text=$1 ret i
  _ble_highlight_layer_RandomColor_buff=()
  for ((i=0;i<${#text};i++)); do
    # _ble_highlight_layer_RandomColor_buff[i] に "<sgr><表示文字>" を設定する。
    # "<表示文字>" は ${_ble_highlight_layer_plain_buff[i]} でなければならない
    # (或いはそれと文字幅が同じ物…ただそれが反映される保証はない)。
    ble/color/gspec2sgr "fg=$((RANDOM%256))"
    _ble_highlight_layer_RandomColor_buff[i]=$ret${_ble_highlight_layer_plain_buff[i]}
  done
  PREV_BUFF=_ble_highlight_layer_RandomColor_buff
  ((PREV_UMIN=0,PREV_UMAX=${#text}))
}
function ble/highlight/layer:RandomColor/getg {
  # ここでは乱数を返しているが、実際は
  # PREV_BUFF=_ble_highlight_layer_RandomColor_buff
  # に設定した物に対応する物を指定しないと表示が変になる。
  local ret; ble/color/gspec2g "fg=$((RANDOM%256))"; g=$ret
}
