# ble/contrib/layer/sample.RandomColor2.bash (C) 2015, akinomyoga
#
# This is a sample implementation of a highlighting layer.  This defines a
# random-color layer named `RandomColor2'.  To use the layer, the layer name can
# be inserted in the array `_ble_highlight_layer_list`:
#
# ```bash
# ble-import layer/sample.RandomColor2
# ble/array#insert-before _ble_highlight_layer_list syntax RandomColor2
# ```
#
# Note: This code was first introduced in commit ec3f3661b@akinomyoga/ble.sh
# (2015-02-23) but later moved to contrib in refactoring on 2023-09-19.

_ble_highlight_layer_RandomColor2_buff=()

function ble/highlight/layer:RandomColor2/update {
  local text=$1 ret i x
  ble/highlight/layer/update/shift _ble_highlight_layer_RandomColor2_buff
  for ((i=DMIN;i<DMAX;i++)); do
    ble/color/gspec2sgr "fg=$((16+(x=RANDOM%27)*4-x%9*2-x%3))"
    _ble_highlight_layer_RandomColor2_buff[i]=$ret${_ble_highlight_layer_plain_buff[i]}
  done
  PREV_BUFF=_ble_highlight_layer_RandomColor2_buff
  ((PREV_UMIN=0,PREV_UMAX=${#text}))
}

function ble/highlight/layer:RandomColor2/getg {
  # ここでは乱数を返しているが、実際は
  # PREV_BUFF=_ble_highlight_layer_RandomColor2_buff
  # に設定した物に対応する物を指定しないと表示が変になる。
  local x ret
  ble/color/gspec2g "fg=$((16+(x=RANDOM%27)*4-x%9*2-x%3))"; g=$ret
}
