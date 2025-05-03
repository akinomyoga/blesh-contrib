# ble/contrib/integration/bash-completion.bash (C) 2024, akinomyoga

## @fn ble/string#hash-pjw text [size shift]
##   @var[out] ret
function ble/string#hash-pjw {
  local size=${2:-32}
  local S=${3:-$(((size+7)/8))} # shift    4
  local C=$((size-2*S))         # co-shift 24
  local M=$(((1<<size-S)-1))    # mask     0x0FFFFFFF
  local N=$(((1<<S)-1<<S))      # mask2    0x000000F0

  ble/util/s2bytes "$1"
  local c h=0
  for c in "${ret[@]}"; do
    ((h=(h<<S)+c,h=(h^h>>C&N)&M))
  done
  ret=$h
}

#------------------------------------------------------------------------------
# Hooks for completion loaders

## @fn ble/contrib/integration:bash-completion/loader/.adjust-progcomp cmd
##   @param[in] cmd
##     The command name whose completion setting should be parsed and adjusted.
function ble/contrib/integration:bash-completion/loader/.adjust-progcomp {
  local ret
  ble/syntax:bash/simple-word/safe-eval "$1" nonull || return 0
  local cmd=$ret

  local compdef
  ble/util/assign compdef 'builtin complete -p -- "$cmd"' 2>/dev/null ||
    { cmd=${cmd##*/}; ble/util/assign compdef 'builtin complete -p -- "$cmd"' 2>/dev/null; } ||
    return 0
  compdef=${compdef%"${cmd:-''}"}
  compdef=${compdef%' '}' '

  local comp_opts=$comp_opts comp_prog comp_func compoptions flag_noquote
  ble/complete/progcomp/parse-complete "$compdef"

  # Call adjustments based on the values of "comp_prog" and "comp_func"
  ble/complete/progcomp/adjust-third-party-completions
}

function ble/contrib/integration:bash-completion/loader/_comp_load.advice {
  ((ADVICE_EXIT==0)) || return 0

  # command-line argument parsing taken from _comp_load (bash_completion).
  local flag_fallback_default="" IFS=$' \t\n'
  local OPTIND=1 OPTARG="" OPTERR=0 opt
  set -- "${ADVICE_WORDS[@]:1}"
  while getopts ':D' opt "$@"; do
    case $opt in
    D) flag_fallback_default=set ;;
    *) return 2 ;;
    esac
  done
  shift "$((OPTIND - 1))"

  ble/contrib/integration:bash-completion/loader/.adjust-progcomp "$@"
}

function ble/contrib/integration:bash-completion/loader/__load_completion.advice {
  ((ADVICE_EXIT==0)) || return 0
  ble/contrib/integration:bash-completion/loader/.adjust-progcomp "$@"
}

function ble/contrib/integration:bash-completion/loader/adjust {
  if ble/is-function _comp_load; then
    ble/function#advice after _comp_load ble/contrib/integration:bash-completion/loader/_comp_load.advice
  elif ble/is-function __load_completion; then
    ble/function#advice after __load_completion ble/contrib/integration:bash-completion/loader/__load_completion.advice
  fi
}

#------------------------------------------------------------------------------
# Hooks for mandb

## @fn ble/contrib/integration:bash-completion/mandb/.alloc-subcache command hash [opts]
##   @var[out] ret
function ble/contrib/integration:bash-completion/mandb/.alloc-subcache {
  ret=
  [[ $_ble_attached ]] || return 1

  local command=$1 hash=$2 opts=$3
  if [[ :$opts: == *:dequote:* ]]; then
    ble/syntax:bash/simple-word/safe-eval "$command" noglob:nonull &&
      command=$ret
  fi
  [[ $command ]] || return 1

  [[ $command == ble*/* ]] || command=${1##*/}
  ble/string#hash-pjw "$args" 64; local hash=$ret
  local lc_messages=${LC_ALL:-${LC_MESSAGES:-${LANG:-C}}}
  local mandb_cache_dir=$_ble_base_cache/complete.mandb/${lc_messages//'/'/%}
  ble/util/sprintf ret '%s.%014x' "$mandb_cache_dir/_parse_help.d/$command" "$hash"

  [[ -s $ret && $ret -nt $_ble_base/lib/core-complete.sh ]] && return 1

  ble/util/mkd "${ret%/*}"
}

## @fn ble/contrib/integration:bash-completion/mandb/_parse_help.advice command args
function ble/contrib/integration:bash-completion/mandb/_parse_help.advice {
  local cmd=$1 args=$2 func=$ADVICE_FUNCNAME
  # 現在のコマンド名。 Note: ADVICE_WORDS には実際に現在補完しようとしているコ
  # マンドとは異なるものが指定される場合があるので (例えば help や - 等) 信用で
  # きない。
  local command=${COMP_WORDS[0]-} hash="${ADVICE_WORDS[*]}" ret
  ble/contrib/integration:bash-completion/mandb/.alloc-subcache "$command" "$hash" dequote || return 0
  local subcache=$ret

  local default_option=--help help_opts=
  [[ $func == _parse_usage ]] &&
    default_option=--usage help_opts=mandb-usage

  if [[ ( $func == _parse_help || $func == _parse_usage ) && $cmd == - ]]; then
    # 標準入力からの読み取り
    ble/complete/mandb:help/generate-cache "$help_opts" >| "$subcache"

    # Note: _parse_help が読み取る筈だった内容を横取りしたので抽出した内容を標
    # 準出力に出力する。但し、対応する long option がある short option は除外す
    # る。
    LC_ALL= LC_COLLATE=C ble/bin/awk -F "$_ble_term_FS" '
      BEGIN { entry_count = 0; }
      {
        entries[entry_count++] = $1;

        # Assumption: the descriptions of long options have the form
        # "[short_opt] desc".  The format is defined by
        # ble/complete/mandb:help/generate-cache.
        desc = $4;
        gsub(/\033\[[ -?]*[@-~]/, "", desc); # disable=#D1440 (LC_COLLATE=C is set)
        if (match(desc, /^\[[^]'"$_ble_term_blank"'[]*\] /) > 0) { # #D1709 safe
          short_opt = substr(desc, 2, RLENGTH - 3);
          excludes[short_opt] =1;
        }
      }
      END {
        for (i = 0; i < entry_count; i++)
          if (!excludes[entries[i]])
            print entries[i];
      }
    ' "$subcache" 2>/dev/null # suppress locale error #D1440
  else
    local cmd_args
    ble/string#split-words cmd_args "${args:-$default_option}"
    "$cmd" "${cmd_args[@]}" 2>&1 | ble/complete/mandb:help/generate-cache "$help_opts" >| "$subcache"
  fi
}

function ble/contrib/integration:bash-completion/mandb/_get_help_lines.advice {
  ((${#_lines[@]})) || return 0

  # @var cmd
  #   現在のコマンド名。Note: _comp_command_offset 等によって別のコマンドの補完
  #   を呼び出している場合があるので ble.sh の用意する comp_words は信用できな
  #   い。bash-completion の使っている _comp_args[0] または bash-completion が
  #   上書きしている COMP_WORDS を参照する。
  local cmd=${_comp_args[0]-${COMP_WORDS[0]-}} hash="${ADVICE_WORDS[*]}"
  ble/contrib/integration:bash-completion/mandb/.alloc-subcache "$cmd" "$hash" dequote || return 0
  local subcache=$ret

  local help_opts=
  [[ ${ADVICE_FUNCNAME[1]} == *_usage ]] && help_opts=mandb-usage
  printf '%s\n' "${_lines[@]}" | ble/complete/mandb:help/generate-cache "$help_opts" >| "$subcache"
}

## @fn ble/contrib/integration:bash-completion/mandb/_comp_command_offset.yield
##   process generated completions stored in COMPREPLY.
function ble/contrib/integration:bash-completion/mandb/_comp_command_offset.yield {
  local word_offset=$1

  ((${#COMPREPLY[@]})) || return 0

  # Other variables for ble/complete/progcomp/process-compgen-output
  local comp_words comp_cword
  comp_words=("${COMP_WORDS[@]:word_offset}")
  comp_cword=$((COMP_CWORD-word_offset))
  ((comp_cword==0)) && return 0

  # Input
  local compgen
  ble/util/sprintf compgen '%s\n' "${COMPREPLY[@]}"
  COMPREPLY=()

  # Arguments for ble/complete/progcomp/process-compgen-output
  local cmd=${comp_words[0]} ret
  ble/syntax:bash/simple-word/safe-eval "$cmd" nonull && cmd=$ret
  local parse_compgen_opts=
  [[ ${cmd##*/} == git ]] && parse_compgen_opts=work-around-git

  ble/complete/progcomp/process-compgen-output "$cmd" "$parse_compgen_opts"
}

function ble/contrib/integration:bash-completion/mandb/_comp_command_offset.advice {
  local REPLY
  _comp__find_original_word "${ADVICE_WORDS[1]}"
  ble/contrib/integration:bash-completion/mandb/_comp_command_offset.yield "$REPLY"
}

function ble/contrib/integration:bash-completion/mandb/_command_offset.advice {
  local word_offset=${ADVICE_WORDS[1]} i j
  for ((i=0;i<word_offset;i++)); do
    for ((j=0;j<=${#COMP_LINE};j++)); do
      [[ $COMP_LINE == "${COMP_WORDS[i]}"* ]] && break
      COMP_LINE=${COMP_LINE:1}
      ((COMP_POINT--))
    done
    COMP_LINE=${COMP_LINE#"${COMP_WORDS[i]}"}
    ((COMP_POINT-=${#COMP_WORDS[i]}))
  done
  ble/contrib/integration:bash-completion/mandb/_comp_command_offset.yield "$word_offset"
}

function ble/contrib/integration:bash-completion/mandb/adjust {
  local fail=
  if ble/is-function _comp_compgen_help; then
    # bash-completion 2.12
    ble/function#advice after _comp_compgen_help__get_help_lines 'ble/contrib/integration:bash-completion/mandb/_get_help_lines.advice' || fail=1
    ble/function#advice before _comp_complete_longopt 'ble/contrib/integration:bash-completion/mandb/_parse_help.advice "${ADVICE_WORDS[1]}"' ||
      ble/function#advice before _comp_longopt 'ble/contrib/integration:bash-completion/mandb/_parse_help.advice "${ADVICE_WORDS[1]}"' || fail=1
    ble/function#advice after _comp_command_offset 'ble/contrib/integration:bash-completion/mandb/_comp_command_offset.advice' || fail=1
  elif ble/is-function _parse_help; then
    # bash-completion <= 2.11
    ble/function#advice before _parse_help 'ble/contrib/integration:bash-completion/mandb/_parse_help.advice "${ADVICE_WORDS[1]}" "${ADVICE_WORDS[2]}"' || fail=1
    ble/function#advice before _longopt 'ble/contrib/integration:bash-completion/mandb/_parse_help.advice "${ADVICE_WORDS[1]}"' || fail=1
    ble/function#advice before _parse_usage 'ble/contrib/integration:bash-completion/mandb/_parse_help.advice "${ADVICE_WORDS[1]}" "${ADVICE_WORDS[2]}"' || fail=1
    ble/function#advice after _command_offset 'ble/contrib/integration:bash-completion/mandb/_command_offset.advice' || fail=1
  else
    fail=1
  fi

  if [[ ! $fail ]]; then
    function ble/contrib/integration:bash-completion/mandb/adjust { return 0; }
  fi
} 2>/dev/null # _parse_help が別の枠組みで定義されている事がある? #D1900

#------------------------------------------------------------------------------

function ble/contrib/integration:bash-completion/cmd-with-conditional-sync.advice {
  if [[ ${BLE_ATTACHED-} ]]; then
    ble/function#push "${ADVICE_WORDS[1]}" '
      local -a cmd_args; cmd_args=("${ADVICE_WORDS[1]}" "$@")
      ble/util/conditional-sync \
        '\''command "${cmd_args[@]}"'\'' \
        '\''! ble/complete/check-cancel'\'' 128 progressive-weight:killall'
    ble/function#advice/do
    ble/function#pop "${ADVICE_WORDS[1]}"
  else
    ble/function#advice/do
  fi
}

function ble/contrib/integration:bash-completion/_do_dnf5_completion.advice {
  ble/contrib/integration:bash-completion/cmd-with-conditional-sync.advice "$@"
  if ((${#COMPREPLY[@]}>=2)); then
    local i has_desc=
    for i in "${!COMPREPLY[@]}"; do
      if ble/string#match "${COMPREPLY[i]}" '[[:blank:]]+\((.*)\)$'; then
        local cand=${COMPREPLY[i]%"$BASH_REMATCH"} desc=${BASH_REMATCH[1]}
        if [[ $cand && $cand != "${COMPREPLY[i]}" ]]; then
          ble/complete/cand/yield word "$cand" "$desc"
          has_desc=1
          builtin unset -v 'COMPREPLY[i]'
          continue
        fi
      fi

      if [[ ! -e ${COMPREPLY[i]} ]]; then
        ble/complete/cand/yield word "$cand"
        builtin unset -v 'COMPREPLY[i]'
      fi
    done

    COMPREPLY=("${COMPREPLY[@]}")
    [[ $has_desc ]] && bleopt complete_menu_style=desc
  fi
}

function ble/contrib/integration:bash-completion/adjust {
  ble/is-function _comp_initialize || ble/is-function _quote_readline_by_ref || return 0

  ble/contrib/integration:bash-completion/loader/adjust

  _ble_contrib_integration_bash_completion_cmd_conditional_sync=(_comp_cmd_make _make _do_dnf5_completion)

  if [[ $comp_func == _comp_cmd_make || $comp_func == _make ]]; then
    ble/is-function "$comp_func" &&
      ble/function#advice around "$comp_func" ble/contrib/integration:bash-completion/cmd-with-conditional-sync.advice
  elif [[ $comp_func == _do_dnf5_completion ]]; then
    ble/is-function "$comp_func" &&
      ble/function#advice around "$comp_func" ble/contrib/integration:bash-completion/_do_dnf5_completion.advice
  fi

  if ((BASH_COMPLETION_VERSINFO[0]<2||BASH_COMPLETION_VERSINFO[0]==2&&BASH_COMPLETION_VERSINFO[1]<12)); then
    # Fix issues with bash-completion <= 2.11

    # https://github.com/scop/bash-completion/pull/492 (fixed in bash-completion 2.12)
    function _quote_readline_by_ref {
      if [[ $1 == \'* ]]; then
        printf -v "$2" %s "${1:1}"
      else
        printf -v "$2" %q "$1"
        [[ ${!2} == \$* ]] && builtin eval "$2=${!2}"
      fi
    }
    ble/function#suppress-stderr _filedir 2>/dev/null

    # https://github.com/scop/bash-completion/issues/509 (fixed in bash-completion 2.12)
    ble/function#suppress-stderr _find 2>/dev/null

    # https://github.com/scop/bash-completion/pull/556 (fixed in bash-completion 2.12)
    ble/function#suppress-stderr _scp_remote_files 2>/dev/null

    # https://github.com/scop/bash-completion/pull/773 (fixed in bash-completion 2.12)
    ble/function#suppress-stderr _function 2>/dev/null
  fi

  ble/contrib/integration:bash-completion/mandb/adjust
}
