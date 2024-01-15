# ble/contrib/layer/pattern.bash (C) 2023, akinomyoga
#
# @fn ble/highlight/layer:{pattern}/declare name [type]
#   Define a new layer named `name`.
#
#   @param[in] name
#     The name of the layer.
#   @param[in,opt] type
#     This specifies the type of the pattern of this layer.  One of the
#     following values.  The default is `regexp`.
#
#     regexp
#       Regular expression
#     glob
#       Extended glob pattern
#     glob-shortest
#       Extended glob pattern.  This tries to find the shortest match.
#
# @fn ble/highlight/layer:{pattern}/register name pattern gspec
#   Register a pattern to the layer specified by `name`.
#
#   @param[in] name
#     The name of the layer.
#   @param[in] pattern
#     The pattern.  The type of the pattern is specified by the argument `type`
#     when the layer is created by `ble/highlight/layer:{pattern}/declare`.
#   @param[in] gspec
#     A string specifying the graphic style.  See the description of
#     ble/color/gspec2g.
#
#
# ```bash
# # blerc
#
# ble-import layer/pattern
#
# ble/highlight/layer:{pattern}/declare pattern1
# ble/highlight/layer:{pattern}/register pattern1 'rm -rf [^;&|]*' 'fg=white,bold,bg=red'
# ble/array#insert-after _ble_highlight_layer_list syntax pattern1
#
# ble/highlight/layer:{pattern}/declare pattern2
# ble/highlight/layer:{pattern}/register pattern2 "$USER" 'fg=blue,bold'
# ble/highlight/layer:{pattern}/register pattern2 "$HOSTNAME" 'fg=green,bold'
# ble/highlight/layer:{pattern}/register pattern2 '[0-9]+' 'bg=216,fg=black'
# ble/array#insert-after _ble_highlight_layer_list pattern1 pattern2
# ```

function ble/highlight/layer:{pattern}/declare {
  local layer_name=$1 type=${2-regexp}
  case $type in
  (regexp | glob) ;;
  (glob-shortest) type=sglob ;;
  (*)
    ble/util/print "$FUNCNAME: unrecognized pattern type '$type'." >&2
    return 2 ;;
  esac

  # define dynamic variables
  local layer_prefix=_ble_highlight_layer_${layer_name}_
  ble/highlight/layer:{selection}/declare "$layer_name"
  ble/array#push "${layer_prefix}VARNAMES" "${layer_prefix}text"
  ble/util/set "${layer_prefix}text" ''

  # define settings
  local keys=${layer_prefix}keys
  local dict=${layer_prefix}dict
  builtin eval -- "
    ${layer_prefix}type=$type
    $keys=()
    ${_ble_util_gdict_declare//NAME/$dict}"

  # define functions
  local _ble_local_script='
    function ble/highlight/layer:LAYER/initialize-vars {
      ble/highlight/layer:{pattern}/initialize-vars LAYER
    }
    function ble/highlight/layer:LAYER/update {
      ble/highlight/layer:{pattern}/update LAYER "$@"
    }
    function ble/highlight/layer:LAYER/getg {
      ble/highlight/layer:{pattern}/getg LAYER "$@"
    }'
  builtin eval -- "${_ble_local_script//LAYER/$layer_name}"
}

function ble/highlight/layer:{pattern}/initialize-vars {
  local layer_name=$1
  ble/highlight/layer:{selection}/initialize-vars "$layer_name"
  ble/util/set "_ble_highlight_layer_${layer_name}_text" ''
}

function ble/highlight/layer:{pattern}/register {
  local layer_name=$1 pattern=$2 spec=${3-}
  local keys=_ble_highlight_layer_${layer_name}_keys
  local dict=_ble_highlight_layer_${layer_name}_dict
  if [[ ${3+set} ]]; then
    local ret
    ble/color/gspec2g "$spec"
    ble/gdict#has "$dict" "$pattern" ||
      ble/array#push "$keys" "$pattern"
    ble/gdict#set "$dict" "$pattern" "$ret"
  else
    ble/array#remove "$keys" "$pattern"
    ble/gdict#unset "$dict" "$pattern"
  fi
}

##-----------------------------------------------------------------------------
## Pattern types
##
## Each pattern layer instance is associated with a pattern type, and the
## pattern type defines how the pattern specified to layer:{pattern}/register
## should be treated.  Currently, three types `regexp`, `glob`, and `sglob` are
## defined.  To define a new pattern type, the following three functions should
## be prepared.
##
## @fn ble/highlight/layer:{pattern}/pattern:<TYPE>/create-gpat
##   This function composes a pattern matching any of the registered patterns
##
##   @arr[in] keys
##     The list of patterns registered to the current layer.
##   @var[out] gpat
##     Stores a pattern that matches any of the registered pattern.
##
## @fn ble/highlight/layer:{pattern}/pattern:<TYPE>/match text pat
##   This function tries to match PAT in TEXT and, if matching, stores the
##   matched range in [MBEG, MEND) and returns the unmatched suffix in
##   NEW_TAIL.
##
##   @param[in] text
##     The string where a matching substring is searched.
##   @param[in] pat
##     The pattern
##   @var[out] mbeg mend
##     Stores the matched range in TEXT.  MBEG and MEND are the beginning and
##     the end of the range, respectively.
##   @var[out] new_tail
##     Stores the unmatched remaining part of TEXT.  In particular, the
##     substring after MEND.
##   @exit
##     0 if a matching is found, or otherwise 1.
##
## @fn ble/highlight/layer:{pattern}/pattern:regexp/match1 str pat
##   This function tests if the specified string exactly matches the pattern.
##
##   @param[in] str
##     The string to be matched.
##   @param[in] pat
##     The pattern to matched STR.
##   @exit
##     0 if the string matches the pattern, or otherwise 1
##

# pattern type: regexp

function ble/highlight/layer:{pattern}/pattern:regexp/create-gpat {
  IFS='|' builtin eval -- 'gpat="(${keys[*]})"'
}
function ble/highlight/layer:{pattern}/pattern:regexp/match {
  ble/string#match "$1" "$2(.*)\$" || return 1
  new_tail=${BASH_REMATCH[${#BASH_REMATCH[@]}-1]}
  mbeg=$((${#1}-${#BASH_REMATCH}))
  mend=$((${#1}-${#new_tail}))
  return 0
}
function ble/highlight/layer:{pattern}/pattern:regexp/match1 {
  [[ $1 =~ ^($2)$ ]]
}

# pattern type: glob (longest extended glob matching)

function ble/highlight/layer:{pattern}/pattern:glob/create-gpat {
  IFS='|' builtin eval -- 'gpat="@(${keys[*]})"'
}
function ble/highlight/layer:{pattern}/pattern:glob/match {
  local extglob=
  shopt -q extglob && extglob=1
  shopt -s extglob
  local prefix=${1%%$2*} ext=1
  if [[ $prefix != "$1" ]]; then
    mbeg=${#prefix}
    new_tail=${1:mbeg}
    new_tail=${new_tail##$2}
    ((mend=${#1}-${#new_tail}))
    ext=0
  fi
  [[ $extglob ]] || shopt -u extglob
  return "$ext"
}
function ble/highlight/layer:{pattern}/pattern:glob/match1 {
  [[ $1 == $2 ]]
}

# pattern type: sglob (shortest extended glob matching)

function ble/highlight/layer:{pattern}/pattern:sglob/create-gpat {
  ble/highlight/layer:{pattern}/pattern:glob/create-gpat
}
function ble/highlight/layer:{pattern}/pattern:sglob/match {
  local extglob=
  shopt -q extglob && extglob=1
  shopt -s extglob
  local prefix=${1%%$2*} ext=1
  if [[ $prefix != "$1" ]]; then
    mbeg=${#prefix}
    new_tail=${1:mbeg}
    new_tail=${new_tail#$2}
    ((mend=${#1}-${#new_tail}))
    ext=0
  fi
  [[ $extglob ]] || shopt -u extglob
  return "$ext"
}
function ble/highlight/layer:{pattern}/pattern:sglob/match1 {
  ble/highlight/layer:{pattern}/pattern:glob/match1 "$@"
}

##-----------------------------------------------------------------------------

function ble/highlight/layer:{pattern}/.match {
  # If the text has the same content as the previous time, we skip the
  # matching.
  #
  # Note: Initially, ((DMIN<0)) was used for the condition but turned out to be
  # unusable for this purpose.  DMIN only changes when the full content
  # including the auto_complete insertion is changed.  Even if the substantial
  # part (excluding the auto_complete insertion) changes, DMIN can be negative
  # when the full content does not change.
  local rtext=_ble_highlight_layer_${1}_text
  local text=$2 otext=${!rtext}
  [[ $otext && $text == "$otext" ]] && return 0
  ble/util/set "$rtext" "$text"

  local ret
  local dict=_ble_highlight_layer_${1}_dict
  sel=() gflags=()

  # Retrieve regular expressions
  local keys type
  ble/util/restore-vars "_ble_highlight_layer_${1}_" keys type
  ((${#keys[@]})) || return 0

  local gpat
  ble/highlight/layer:{pattern}/pattern:"$type"/create-gpat
  local g0=
  if ((${#keys[@]}==1)); then
    ble/gdict#get "$dict" "${keys[0]}" && g0=$ret
  fi

  local offset=0 tail=$text new_tail mbeg mend m
  while [[ $tail ]] && ble/highlight/layer:{pattern}/pattern:"$type"/match "$tail" "$gpat"; do
    ((mbeg+=offset,mend+=offset))
    if ((mbeg<mend)); then
      # determine gflags of the selection
      local g1=$g0
      if [[ ! $g1 ]]; then
        local pat1 m=${tail:mbeg-offset:mend-mbeg}
        for pat1 in "${keys[@]}"; do
          if ble/highlight/layer:{pattern}/pattern:"$type"/match1 "$m" "$pat1"; then
            ble/gdict#get "$dict" "$pat1" && g1=$ret
            break
          fi
        done
      fi

      # add selection with the gflags
      if [[ $g1 ]]; then
        if ((mbeg==offset&&${#sel[@]})) && [[ ${gflags[${#gflags[@]}-1]} == $g1 ]]; then
          # extend the previous selection
          sel[${#sel[@]}-1]=$mend
        else
          # add a new selection
          ble/array#push sel "$mbeg" "$mend"
          ble/array#push gflags "$g1"
        fi
      fi
    fi

    if ((mend==offset)); then
      # step at least one character to avoid infinite matching
      ((offset++))
      tail=${tail:1}
    else
      offset=$mend
      tail=$new_tail
    fi
  done
}

function ble/highlight/layer:{pattern}/update {
  local layer_name=$1 text=$2
  local sel=-1 gflags=-1

  local text1=$text
  if [[ $_ble_edit_mark_active == auto_complete ]]; then
    # When there is an insertion by auto-complete, we exclude that part from
    # the matching target.
    local a=$_ble_edit_ind b=$_ble_edit_mark
    text1=${text::a}${text:b}
  fi
  ble/highlight/layer:{pattern}/.match "$layer_name" "$text1"
  if [[ $_ble_edit_mark_active == auto_complete ]]; then
    # The generated positions in the array "sel" is for "text1" where the
    # auto-complete insertion is excluded.  Here, we shift the positions in
    # "sel" to consider the excluded part.
    local i
    for i in "${!sel[@]}"; do
      ((sel[i]>a||sel[i]==a&&i%2==0)) && ((sel[i]+=b-a))
    done
  fi

  ble/highlight/layer:{selection}/update "$layer_name" "$text"
}

function ble/highlight/layer:{pattern}/getg {
  ble/highlight/layer:{selection}/getg "$@"
}
