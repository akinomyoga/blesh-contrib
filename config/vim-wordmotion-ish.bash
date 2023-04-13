
# Emulation the default behavior of https://github.com/chaoren/vim-wordmotion,
# almost.  This module differs from the above in these respects:
#
#   * It doesn't support g:wordmotion_spaces or g:wordmotion_uppercase_spaces
#
#   * It behaveas as if iskeyword+=- has been done in vim.  The default
#     behavior of vim-wordmotion with respect to - is pretty weird without
#     this IMO.
#
#   * It also remaps the uppercase motion and text object slect keys to instead
#     perform the functions previously performed by the original lower-case
#     motion and text object selction keys.  In essense the lower case keys now
#     operate on english-language words, and the upper case ones on the
#     original syntax-oriented words.
#

# Perl regexes are needed for zero-width look-ahead and look-behind assertions
ble-import config/github302-perlre-server2.bash

# FIXME: all below here needs namespace attention or something

# Perl Regex Server and Bash Interface {{{1

function queryPerlRegexServer {
  local ret
  ble/contrib/config:github302/perlre-match2 "$1" "${*:2}"
  echo "$ret"
}

# Get Regex Query Response Group/Field value (single int) from format
# returned by perlRegexServer
function gRQRGF {
  local mg="$1" group=$2 field="$3"   # Matched Groups, group, field

  [ -n "$mg" ] || return 1
  [ -n "$2" ] || return 2
  [ -n "$3" ] || return 3

  local mga=($mg)   # Matched Groups Array

  ((${#mga[@]} > 0 )) || return 4
  ((${#mga[@]} % 3 == 0)) || return 5
  ((${#mga[@]} / 3 >= $2)) || return 6

  echo ${mga[((($2 - 1) * 3 + $3 - 1))]}
}

# }}}1

# Declare a site broken with a message and non-zero return.  This is the
# widget to use in general to get a ble.sh message to the terminal
function brokenHere { ble/widget/print "$*"; return 1; }

# Snake-Camel-Hyphen Word Regex.  Whitespace is removed so we can use a
# pretty layout here and pass it in a single line to our perlRegexServer.
schwr=$(echo '
  ((?<![A-Z])[a-z]+)
  |
  ([A-Z][a-z]+)
  |
  ([A-Z][A-Z]+(?![a-z0-9]))
  |
  ([0-9]+)
  |
  ([A-Z])
  |
  ([\!-\/\:-\@\[-\`\{-\~]+)
  |
  ([^\s\t\na-zA-Z0-9\!-\/\:-\@\[-\`\{-\~]+)
' | tr -d " \t\n")

# Our modified version of _ble_keymap_vi_REX_WORD from blesh/keymap/vi.sh.
# Ours honors Snake-Camel-Hyphen-Acronym words and is a perl rexeg.
_my_ble_keymap_vi_PREX_WORD="$schwr"

# My Blank/Newline (newlines aren't blanks in this definition)
my_b='[-_\s\t]'
my_n='\n'

# Snake-Camel-Hyphen Word Blank Regex (a thing ble.sh commonly does with it's
# word regex).
function wbr {
  local wr="$1";
  echo -n '((('$wr')'"$my_n?|$my_b+$my_n?|$my_n)($my_b+$my_n)*$my_b*)"
}

function ble/widget/my/vi-command/forward-my-word.impl {
  local arg=$1 flag=$2 reg=$3 prex_word=$4
  local ifs=$_ble_term_IFS
  if [[ $flag == c && ${_ble_edit_str:_ble_edit_ind:1} != [$ifs] ]]; then
    ble/widget/vi-command/forward-my-word-end.impl "$arg" "$flag" "$reg" "$prex_word" allow_here
    return "$?"
  fi
  local prex='(^('$(wbr "$prex_word")'){0,'$arg'})'
  local str="${_ble_edit_str:_ble_edit_ind}"
  local match_groups=$(queryPerlRegexServer "$prex" "$str")
  if [ -n "$match_groups" ]; then
    local group_1_length=$(gRQRGF "$match_groups" 2 3)
    index=$((_ble_edit_ind+group_1_length))
    if [[ $flag ]]; then
      local group_2_idx=$(gRQRGF "$match_groups" 3 2)
      local group_2_len=$(gRQRGF "$match_groups" 3 3)
      local group2=${str:group_2_idx:group_2_len}
      local rrex="($my_n$my_b*\$)"
      local group2_groups=$(queryPerlRegexServer "$rrex" "$group2")
      if [ -n "$group2_groups" ]; then
        local group2_group_1_match=$(gRQRGF "$group2_groups" 2 1)
        if [ $group2_group_1_match -ne 0 ]; then
          local suffix_len=$(gRQRGF "$group2_groups" 2 3)
          if (( suffix_len < ${#group2} )); then
            (( index -= suffix_len ))
          fi
        fi
      fi
    fi
  else
    index=$_ble_edit_ind
  fi
  ble/widget/vi-command/exclusive-goto.impl "$index" "$flag" "$reg"
}
function ble/widget/vi-command/forward-my-word-end.impl {
  local arg=$1 flag=$2 reg=$3 prex_word=$4 opts=$5
  local IFS=$_ble_term_IFS
  # FIXXME: because I don't know how to xlate arbitrary chars to perlre.  This
  # arguably isn't an issue at all because we're doing or own word thin anyway.
  [ "$IFS" == $' \t\n' ] || brokenHere "\$IFS is not \s\t\n" || return 1
  # FIXXME: this exciting goop makes his work like our vim setup
  # (with out iskeyword+=- setting) for e over: 'foo-BarBaz', 'foo- BarBaz',
  # 'foo -BarBaz', 'foo - BarBaz' and similar with _ instead of -.  Should this
  # exciting goop be happening elsewhere also?  There is no "start-of-word" to
  # correspond to "e" in vi so maybe not.  But then again maybe I missed it
  local pifs='(?:[\s\t\n]|(?<![\s\t\n])[-_](?![\s\t\n]))'
  local prex="(^($pifs*($prex_word)?){0,$arg})" # 単語末端に止まる。空行には止まらない
  local offset=1; [[ :$opts: == *:allow_here:* ]] && offset=0

  local str="${_ble_edit_str:_ble_edit_ind+offset}"
  local match_groups=$(queryPerlRegexServer "$prex" "$str")

  local group_1_match=$(gRQRGF "$match_groups" 2 1)
  local group_1_length=$(gRQRGF "$match_groups" 2 3)
  local index=$((_ble_edit_ind+offset+group_1_length-1))

  ((index<_ble_edit_ind&&(index=_ble_edit_ind)))
  [[ ! $flag && (($group_1_match!=0)) && ${_ble_edit_str:index:1} == [$IFS] ]] && ble/widget/.bell
  ble/widget/vi-command/inclusive-goto.impl "$index" "$flag" "$reg"
}
function ble/widget/my/vi-command/forward-my-vword {
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/my/vi-command/forward-my-word.impl "$ARG" "$FLAG" "$REG" "$_my_ble_keymap_vi_PREX_WORD"
}
ble-bind -m 'vi_nmap' -f 'w' 'my/vi-command/forward-my-vword'
ble-bind -m 'vi_omap' -f 'w' 'my/vi-command/forward-my-vword'
ble-bind -m 'vi_xmap' -f 'w' 'my/vi-command/forward-my-vword'

function ble/widget/my/vi-command/forward-my-vword-end {
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/vi-command/forward-my-word-end.impl "$ARG" "$FLAG" "$REG" "$_my_ble_keymap_vi_PREX_WORD"
}
ble-bind -m 'vi_nmap' -f 'e' 'my/vi-command/forward-my-vword-end'
ble-bind -m 'vi_omap' -f 'e' 'my/vi-command/forward-my-vword-end'
ble-bind -m 'vi_xmap' -f 'e' 'my/vi-command/forward-my-vword-end'

function ble/widget/my/vi-command/backward-my-word.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 prex_word=$4
  local prex='(('$(wbr "$prex_word")'){0,'$arg'}$)'
  local str="${_ble_edit_str::_ble_edit_ind}"
  local match_groups=$(queryPerlRegexServer "$prex" "$str")
  local index;
  if [ -n "$match_groups" ]; then
    index=$((_ble_edit_ind - $(gRQRGF "$match_groups" 2 3)))
  else
    index=$_ble_edit_ind
  fi
  ble/widget/vi-command/exclusive-goto.impl "$index" "$flag" "$reg"
} # }}}3
function ble/widget/my/vi-command/backward-my-vword { # {{{3
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/my/vi-command/backward-my-word.impl "$ARG" "$FLAG" "$REG" "$_my_ble_keymap_vi_PREX_WORD"
} # }}}3
ble-bind -m 'vi_nmap' -f 'b' 'my/vi-command/backward-my-vword'
ble-bind -m 'vi_omap' -f 'b' 'my/vi-command/backward-my-vword'
ble-bind -m 'vi_xmap' -f 'b' 'my/vi-command/backward-my-vword'

# The real changes to achieve wordmotion-style visual select,
# operator-pending, etc. are in these:
function my/ble/keymap:vi/text-object/word.extend-forward { # {{{3
  local rex
  flags=
  [[ ${_ble_edit_str:beg:1} == ["$ifs"] ]] && flags=${flags}A
  if [[ $_ble_decode_keymap != vi_[xs]map ]]; then
    flags=${flags}I
  elif ((_ble_edit_mark==_ble_edit_ind)); then
    flags=${flags}I
  fi
  local rex_unit
  local W='('$prex_word')' b='['$space']' n=$nl
  if [[ $type == i* ]]; then
    rex_unit='(^'$W'|^'$my_b'+|^'$my_n')'
  elif [[ $type == a* ]]; then
    rex_unit='(^'$W$my_b'*|^'$my_b'+'$W'|^'$my_b'*'$my_n'('$my_b'+'$my_n')*('$my_n'|'$my_b'*'$W'))'
  else
    return 1
  fi
  local i rematch=
  for ((i=0;i<arg;i++)); do
    if ((i==0)) && [[ $flags == *I* ]]; then
      # FIXXME: because I don't know how to xlate arbitrary chars to perlre:
      [ "$IFS" == $' \t\n' ] || brokenHere "\$IFS is not \s\t\n" || return 1
      local pifs='\s\t\n'
      local prex='(('$prex_word')$|'$my_b'*['$pifs']$)'
      local str=${_ble_edit_str::beg+1}
      local match_groups=$(queryPerlRegexServer "$prex" "$str")
      if [ -n "$match_groups" ]; then
        local group_1_idx=$(gRQRGF "$match_groups" 2 2)
        local group_1_len=$(gRQRGF "$match_groups" 2 3)
        local group_1_cap=${str:group_1_idx:group_1_len}
        ((beg-=$group_1_len-1,end=beg))
      fi
    else
      [[ ${_ble_edit_str:end:1} == $'\n' ]] && ((end++))
    fi

    local str=${_ble_edit_str:end}
    local match2_groups=$(queryPerlRegexServer "$rex_unit" "$str")
    [ -n "$match2_groups" ] || return 1
    local match2_group_1_idx=$(gRQRGF "$match2_groups" 2 2)
    local match2_group_1_len=$(gRQRGF "$match2_groups" 2 3)
    local match2_group_1_cap=${str:match2_group_1_idx:match2_group_1_len}
    rematch="$match2_group_1_cap"
    ((end+=${#rematch}))

    [[ $type == a* && $rematch == *$'\n\n' ]] && ((end--))
    if ((i==0)) && [[ $flags == *I* ]] || ((i==arg-1)); then
      [[ $type == i* && $rematch == *"$nl" ]] && ((end--))
    fi
  done
  [[ ${_ble_edit_str:end-1:1} == *["$ifs"] ]] && flags=${flags}Z
  if [[ $type == a* && $flags != *[AZ]* ]]; then

    # FIXXME: What is this bolp doing?  I don't think we need our more
    # expansive idea of "white" space here but I'm not certain
    if rex='['$space']+$'; [[ ${_ble_edit_str::beg} =~ $rex ]]; then
      local p=$((beg-${#BASH_REMATCH}))
      ble-edit/content/bolp "$p" || beg=$p
    fi

  fi

  return 0
} # }}}3
function my/ble/keymap:vi/text-object/word.extend-backward { # {{{3
  local rex_unit=
  local W='('$prex_word')' b='['$space']' n=$nl
  if [[ $type == i* ]]; then
    rex_unit='(('$W'|'$my_b'+)'$my_n'?$|'$my_n'$)'
  elif [[ $type == a* ]]; then
    rex_unit='('$my_b'*'$W$my_n'?$|'$W'?'$my_b'*('$my_n'('$my_b'+'$my_n')*'$my_b'*)?('$my_b$my_n'?|'$my_n')$)'
  else
    return 1
  fi
  local count=$arg
  while ((count--)); do

    local str=${_ble_edit_str::beg}
    local match_groups=$(queryPerlRegexServer "$rex_unit" "$str")
    [ -n "$match_groups" ] || return 1

    local group_1_idx=$(gRQRGF "$match_groups" 2 2)
    local group_1_len=$(gRQRGF "$match_groups" 2 3)
    (( beg -= $group_1_len ))

    local group_1_capture=${str:group_1_idx:group_1_len}
    local match=${group_1_capture%"$nl"}

    if ((beg==0&&${#match}>=2)); then
      echo
      if [[ $type == i* ]]; then
        [[ $match == ["$space"]* ]] && beg=1
      elif [[ $type == a* ]]; then
        # FIXME: this should probably use our more expansive "white" space def.
        [[ $match == *[!"$ifs"] ]] && beg=1
      fi
    fi
  done

  return 0
} # }}}3
function my/ble/keymap:vi/text-object/word.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 type=$4
  local space=$' \t' nl=$'\n' ifs=$_ble_term_IFS
  ((arg==0)) && return 0
  local prex_word
  echo "type: $type" >>/tmp/mlf
  if [[ $type == ?W ]]; then
    # We want large W to do old small w, so change $type and call original
    type=${type/%W/w}
    ble/keymap:vi/text-object/word.impl "$arg" "$flag" "$reg" "$type"
    return
  else
    prex_word=$_my_ble_keymap_vi_PREX_WORD
  fi
  local index=$_ble_edit_ind
  if [[ $_ble_decode_keymap == vi_[xs]map ]]; then
    if ((index<_ble_edit_mark)); then
      local beg=$index
      if my/ble/keymap:vi/text-object/word.extend-backward; then
        _ble_edit_ind=$beg
      else
        _ble_edit_ind=0
        ble/widget/.bell
      fi
      ble/keymap:vi/adjust-command-mode
      return 0
    fi
  fi
  local beg=$index end=$index flags=
  if ! my/ble/keymap:vi/text-object/word.extend-forward; then
    index=${#_ble_edit_str}
    ble-edit/content/nonbol-eolp "$index" && ((index--))
    _ble_edit_ind=$index
    ble/widget/vi-command/bell
    return 1
  fi
  if [[ $_ble_decode_keymap == vi_[xs]map ]]; then
    ((end--))
    ble-edit/content/nonbol-eolp "$end" && ((end--))
    ((beg<_ble_edit_mark)) && _ble_edit_mark=$beg
    [[ $_ble_edit_mark_active == vi_line ]] &&
      _ble_edit_mark_active=vi_char
    _ble_edit_ind=$end
    ble/keymap:vi/adjust-command-mode
    return 0
  else
    ble/widget/vi-command/exclusive-range.impl "$beg" "$end" "$flag" "$reg"
  fi
} # }}}3

# These functions vary from the stock versions in ble.sh only by call of
# of of the above or each other instead:
function my/ble/keymap:vi/text-object.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 type=$4
  case "$type" in
  ([ia][wW]) my/ble/keymap:vi/text-object/word.impl "$arg" "$flag" "$reg" "$type" ;;
  ([ia][\"\'\`]) ble/keymap:vi/text-object/quote.impl "$arg" "$flag" "$reg" "$type" ;;
  ([ia]['b()']) ble/keymap:vi/text-object/block.impl "$arg" "$flag" "$reg" "${type::1}()" ;;
  ([ia]['B{}']) ble/keymap:vi/text-object/block.impl "$arg" "$flag" "$reg" "${type::1}{}" ;;
  ([ia]['<>']) ble/keymap:vi/text-object/block.impl "$arg" "$flag" "$reg" "${type::1}<>" ;;
  ([ia]['][']) ble/keymap:vi/text-object/block.impl "$arg" "$flag" "$reg" "${type::1}[]" ;;
  ([ia]t) ble/keymap:vi/text-object/tag.impl "$arg" "$flag" "$reg" "$type" ;;
  ([ia]s) ble/keymap:vi/text-object/sentence.impl "$arg" "$flag" "$reg" "$type" ;;
  ([ia]p) ble/keymap:vi/text-object/paragraph.impl "$arg" "$flag" "$reg" "$type" ;;
  (*)
    ble/widget/vi-command/bell
    return 1;;
  esac
} # }}}3
function my/ble/keymap:vi/text-object.hook { # {{{3
  local key=$1
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  if ! ble-decode-key/ischar "$key"; then
    ble/widget/vi-command/bell
    return 1
  fi
  local ret; ble/util/c2s "$key"
  local type=$_ble_keymap_vi_text_object$ret
  my/ble/keymap:vi/text-object.impl "$ARG" "$FLAG" "$REG" "$type"
  return 0
} # }}}3
function my/ble/keymap:vi/.check-text-object { # {{{3
  local n=${#KEYS[@]}; ((n&&n--))
  ble-decode-key/ischar "${KEYS[n]}" || return 1
  local ret; ble/util/c2s "${KEYS[n]}"; local c=$ret
  [[ $c == [ia] ]] || return 1
  [[ $_ble_keymap_vi_opfunc || $_ble_decode_keymap == vi_[xs]map ]] || return 1
  _ble_keymap_vi_text_object=$c
  _ble_decode_key__hook=my/ble/keymap:vi/text-object.hook
  return 0
} # }}}3
function ble/widget/my/vi-command/text-object { # {{{3
  my/ble/keymap:vi/.check-text-object && return 0
  ble/widget/vi-command/bell
  return 1
} # }}}3
# Let's schedule a quick check so try to stay in sync with ble.sh:
function check_exactly_one_line_changed { # {{{3
  local func_a=$1 func_b=$2
  local emc=3   # Expected Modification Count (note 2 are due to name change)
  [ $(diff <(type $func_a) <(type $func_b) -u | diffstat -m -t | tail -n 1 | cut -d , -f 3) -eq $emc ]
} # }}}3
function my/check_deltas_vs_some_upstream_word_funcs { # {{{3

  local warnMsg='unexpectedly large delta vs. stock ble.sh function'

  check_exactly_one_line_changed      \
       ble/keymap:vi/text-object.impl \
    my/ble/keymap:vi/text-object.impl \
  ||                                  \
  ble/util/print "$warnMsg" >&2       \
  &&                                  \
  return 1

  check_exactly_one_line_changed      \
       ble/keymap:vi/text-object.hook \
    my/ble/keymap:vi/text-object.hook \
  ||                                  \
  ble/util/print "$warnMsg" >&2       \
  &&                                  \
  return 2

  check_exactly_one_line_changed        \
       ble/keymap:vi/.check-text-object \
    my/ble/keymap:vi/.check-text-object \
  ||                                    \
  ble/util/print "$warnMsg" >&2         \
  &&                                    \
  return 3

  check_exactly_one_line_changed            \
       ble/widget/vi-command/text-object    \
       ble/widget/my/vi-command/text-object \
  ||                                        \
  ble/util/print "$warnMsg" >&2             \
  &&                                        \
  return 4

} # }}}3
blehook/eval-after-load keymap_vi my/check_deltas_vs_some_upstream_word_funcs

ble-bind -m 'vi_omap' -f 'a' 'my/vi-command/text-object'
ble-bind -m 'vi_omap' -f 'i' 'my/vi-command/text-object'
ble-bind -m 'vi_xmap' -f 'a' 'my/vi-command/text-object'
ble-bind -m 'vi_xmap' -f 'i' 'my/vi-command/text-object'

ble-bind -m 'vi_nmap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_omap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_xmap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_nmap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_omap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_xmap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_nmap' -f 'B' 'vi-command/backward-vword'
ble-bind -m 'vi_omap' -f 'B' 'vi-command/backward-vword'
ble-bind -m 'vi_xmap' -f 'B' 'vi-command/backward-vword'
