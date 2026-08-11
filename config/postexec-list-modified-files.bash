# blesh/contrib/config/postexec-list-modified-files.bash
# (C) 2026, Koichi Murase <myoga.murase@gmail.com>

#------------------------------------------------------------------------------
# Array sort library - these functions are designed to be general utilities,
# but they are kept in this file for now since these are currently only used by
# this module.  When other modules start to use these utilities, we may move
# these functions into the main file or an independent module lib/util.heap.sh.

_ble_heap_vars=(__ble_name __ble_len __ble_0ref __ble_iref __ble_jref __ble_kref __ble_less)

## @fn ble/heap#.initialize name [predicate opts]
##   @param[in] name
##   @param[in,opt] predicate
##   @param[in,opt] opts
##   @var[out] ${_ble_heap_vars[@]}
function ble/heap#.initialize {
  if [[ :${3-}: != *:force:* && ( $1 == __ble_* || $1 == *[!_a-zA-Z0-9]* || ! $1 ) ]]; then
    ble/util/print "ble/heap: invalid heap name '$1'" >&2
    __ble_name= __ble_len=0
    return 2
  fi

  __ble_name=$1
  builtin eval '__ble_len=${#'"$__ble_name"'[@]}'
  __ble_0ref=$__ble_name'[0]'
  __ble_iref=$__ble_name'[__ble_i]'
  __ble_jref=$__ble_name'[__ble_j]'
  __ble_kref=$__ble_name'[__ble_j+1]'

  if [[ ${2-} ]]; then
    if [[ $2 == *'$'* ]] && ! ble/is-function "$2"; then
      if [[ :${3-}: == *:reverse:* ]]; then
        __ble_less=$'! {\n'$2$'\n}'
      else
        __ble_less=$2
      fi
    else
      __ble_less[1]=$2
      if [[ :${3-}: == *:reverse:* ]]; then
        __ble_less[0]='! "${__ble_less[1]}" "$1" "$2"'
      else
        __ble_less[0]='"${__ble_less[1]}" "$1" "$2"'
      fi
    fi
  fi
}
function ble/heap#.less { builtin eval -- "$__ble_less"; }

## @fn ble/heap#.push value
##   @param[in] value
##   @var[in] ${_ble_heap_vars[@]}
function ble/heap#.push {
  local __ble_i=$((__ble_len++)) __ble_j __ble_value=$1
  while ((__ble_i > 0)); do
    ((__ble_j=(__ble_i-1)/2))
    ble/heap#.less "$__ble_value" "${!__ble_jref}" || break
    builtin eval -- "$__ble_iref"'=${'"$__ble_jref"'}'
    __ble_i=$__ble_j
  done
  builtin eval -- "$__ble_iref"'=$__ble_value'
}

## @fn ble/heap#.replace i value
##   @param[in] i
##   @param[in] value
##   @var[in] ${_ble_heap_vars[@]}
function ble/heap#.replace {
  local __ble_i=$1 __ble_value=$2 __ble_j
  while (((__ble_j = 2 * __ble_i + 1) < __ble_len)); do
    ((__ble_j + 1 < __ble_len)) &&
      ble/heap#.less "${!__ble_kref}" "${!__ble_jref}" &&
      ((__ble_j++))
    ble/heap#.less "${!__ble_jref}" "$__ble_value" || break
    builtin eval -- "$__ble_iref"'=${'"$__ble_jref"'}'
    __ble_i=$__ble_j
  done
  builtin eval -- "$__ble_iref"'=$__ble_value'
}

## @fn ble/heap#.pop
##   @var[in] ${_ble_heap_vars[@]}
function ble/heap#.pop {
  ((__ble_len >= 1)) || return 1
  REPLY=${!__ble_0ref}

  local __ble_i=$((--__ble_len))
  local __ble_value=${!__ble_iref}
  builtin unset -v "$__ble_iref"
  ((__ble_len >= 1)) || return 0

  ble/heap#.replace 0 "$__ble_value"
}

## @fn ble/array#.heapify
##   @var[in] ${_ble_heap_vars[@]}
function ble/array#.heapify {
  local __ble_i
  for ((__ble_i = __ble_len / 2 - 1; __ble_i >= 0; __ble_i--)); do
    ble/heap#.replace "$__ble_i" "${!__ble_iref}"
  done
}

## @fn ble/heap#push name predicate_less value
##   @param[in] name
##   @param[in] predicate_less
##   @param[in] value
function ble/heap#push {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  ble/heap#.push "$3"
}

## @fn ble/heap#pop name predicate_less
##   @param[in] name
##   @param[in] predicate_less
##   @var[out] REPLY
##   @exit If heap does not contain any elements, the function does not set
##     REPLY and exits with status 1.  Otherwise, the function sets REPLY and
##     exits with status 0.
function ble/heap#pop {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  ble/heap#.pop
}

## @fn ble/heap#replace-top name predicate_less value
##   @param[in] name
##   @param[in] predicate_less
##   @param[in] value
function ble/heap#replace-top {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  ble/heap#.replace 0 "$3"
}

## @fn ble/array#heapify name predicate_less
##   @param[in] name
##   @param[in] predicate_less
function ble/array#heapify {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  ble/array#.heapify
}

## @fn ble/array#is-heap name predicate_less
##   @param[in] name
##   @param[in] predicate_less
function ble/array#is-heap {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  local __ble_i __ble_j
  for ((__ble_i = __ble_len / 2 - 1; __ble_i >= 0; __ble_i--)); do
    ((__ble_j = 2 * __ble_i + 1))
    ble/heap#.less "${!__ble_jref}" "${!__ble_iref}" && return 1
    ((++__ble_j < __ble_len)) && ble/heap#.less "${!__ble_jref}" "${!__ble_iref}" && return 1
  done
  return 0
}

## @fn ble/array#.max count
##   @var[in] less __ble_len
function ble/array#.max {
  local __ble_request_count=$1
  ((__ble_request_count > __ble_len)) && __ble_request_count=$__ble_len
  if ((__ble_request_count <= 0)); then
    REPLY=()
    return 0
  fi

  if ((__ble_request_count == 1)); then
    REPLY=("${!__ble_0ref}")
    local __ble_i
    for ((__ble_i = 1; __ble_i < __ble_len; __ble_i++)); do
      ble/heap#.less "$REPLY" "${!__ble_iref}" && REPLY=${!__ble_iref}
    done
    return 0
  fi

  local __ble_sref=$__ble_iref
  local __ble_slen=$__ble_len

  local -a __ble_heap=()
  local __ble_name __ble_len __ble_0ref __ble_iref __ble_jref __ble_kref
  ble/heap#.initialize __ble_heap '' force

  local __ble_i __ble_len=0
  for ((__ble_i = 0; __ble_i < __ble_request_count; __ble_i++)); do
      ble/heap#.push "${!__ble_sref}"
  done
  for ((; __ble_i < __ble_slen; __ble_i++)); do
    local __ble_value=${!__ble_sref}
    ble/heap#.less "${!__ble_0ref}" "$__ble_value" &&
      ble/heap#.replace 0 "$__ble_value"
  done

  local -a __ble_out=()
  local __ble_i
  for ((__ble_i = __ble_request_count; --__ble_i >= 0; )); do
    ble/heap#.pop || break
    __ble_out[__ble_i]=$REPLY
  done
  REPLY=("${__ble_out[@]}")
}

## @fn ble/array#min name predicate_less [count]
##   @param[in] name
##   @param[in] predicate_less
##   @param[in] count
##   @arr[out] REPLY
function ble/array#min {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2" reverse
  ble/array#.max "${3:-1}"
}

## @fn ble/array#max name predicate_less [count]
##   @param[in] name
##   @param[in] predicate_less
##   @param[in] count
##   @arr[out] REPLY
function ble/array#max {
  local "${_ble_heap_vars[@]}" # disable=#D1566
  ble/heap#.initialize "$1" "$2"
  ble/array#.max "${3:-1}"
}

#------------------------------------------------------------------------------

bleopt/declare -v postexec_list_modified_files_ignore '.*:*/.*:*~'
bleopt/declare -v postexec_list_modified_files_limit 10

function ble/array#ignore-pattern/.impl {
  [[ ${2-} ]] && ((${#ret[@]} > 0)) || return 1

  local patterns pattern dirty=
  ble/string#split patterns : "$2"
  local i value
  for i in "${!ret[@]}"; do
    value=${ret[i]}
    for pattern in "${patterns[@]}"; do
      if [[ $value == $pattern ]]; then
        builtin unset -v 'ret[i]'
        dirty=1
        break
      fi
    done
  done

  [[ $dirty ]]
}

function ble/array#ignore-pattern {
  [[ $1 == ret ]] || builtin eval 'local ret; ret=("${'"$1"'[@]}")'

  local LC_ALL= LC_COLLATE=C 2>/dev/null
  ble/array#ignore-pattern/.impl "$@"; local ext=$?
  ble/util/unlocal LC_COLLATE LC_ALL 2>/dev/null

  # compaction and assignment
  ((ext == 0)) && builtin eval -- "$1"'=("${ret[@]}")'
}

function ble/contrib/config:postexec-list-modified-files/postexec.hook {
  local f_start=$_ble_base_run/$$.exec.time.start
  local f_end=$_ble_base_run/$$.exec.time.end
  [[ -e $f_start ]] || return 1

  local thresh=$((bleopt_postexec_list_modified_files_limit))

  local -a modified_files=()
  local ret file count
  if ((_ble_bash >= 50300)); then
    local GLOBSORT=-mtime pattern
    for pattern in '*' '*/*'; do
      ble/util/eval-pathname-expansion "$pattern" canonical:dotglob
      ble/array#ignore-pattern ret "$bleopt_postexec_list_modified_files_ignore"
      count=0
      for file in "${ret[@]}"; do
        [[ ! -e $file || -d $file || $f_end -ot $file ]] && continue
        [[ ! -e $file || -d $file || $file -ot $f_start ]] && break
        ble/array#push modified_files "$file"
        ((++count >= thresh)) && break
      done
    done
  else
    ble/util/eval-pathname-expansion '* */*' canonical:dotglob
    ble/array#ignore-pattern ret "$bleopt_postexec_list_modified_files_ignore"
    for file in "${ret[@]}"; do
      [[ $file -ot $f_start || $f_end -ot $file ]] && continue
      ble/array#push modified_files "$file"
    done
  fi

  local count=${#modified_files[@]}
  if ((count)); then
    local note="$count files"
    if ((count > thresh)); then
      note="showing $thresh/$count files"
      if ((_ble_bash >= 50300)); then
        modified_files=("${modified_files[@]::thresh}")
      else
        local REPLY
        ble/array#min modified_files '[[ $1 -nt $2 ]]' "$thresh"
        modified_files=("${REPLY[@]}")
      fi
    elif ((count == 1)); then
      note="$count file"
    fi
    ble/edit/marker#instantiate "modified files ($note)" non-empty
    ble/util/print "$ret"

    # Note: We here intentionally use the "ls" command in the global context,
    # so that the user's alias or shell function is used, if any.
    ls -ld "${modified_files[@]::thresh}"
  fi
}
blehook POSTEXEC!=ble/contrib/config:postexec-list-modified-files/postexec.hook
