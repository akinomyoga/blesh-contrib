
# Emulate the default behavior of https://github.com/chaoren/vim-wordmotion,
# almost.  This module differs from the above in these respects:
#
#   * It doesn't support g:wordmotion_spaces or g:wordmotion_uppercase_spaces
#
#   * It behaveas as if iskeyword+=- has been done in vim.  The default
#     behavior of vim-wordmotion with respect to - is pretty weird without
#     this IMO.
#
#   * It remaps the uppercase motion and text object select keys to instead
#     perform the functions previously performed by the original lower case
#     motion and text object selction keys.  In essense the lower case keys
#     now operate on english-language words, and the upper case ones on the
#     original syntax-oriented words.
#

# Perl regexes are needed for zero-width look-ahead and look-behind assertions
ble-import config/github302-perlre-server2.bash

# FIXME: all below here needs namespace attention or something (in progress,
# did a couple funcs as sort of prototype, continue while referencing
# https://github.com/akinomyoga/ble.sh/blob/style/docs/CONTRIBUTING.md#coding-styles

# Perl Regex Server Interface {{{1

function ble/contrib/config:vim-wordmotion-ish/match-perl-regex
{
  ble/contrib/config:github302/perlre-match2 "$1" "$2"
}

# Given a (successful) match result as returned by
# ble/contrib/config:vim-wordmotion-ish/match-perl-regex return the given
# field of group, where group is 1-indexed and group 1 is the entire match,
# group 2 the first parenthesized subgroup, etc.
function ble/contrib/config:vim-wordmotion-ish/match-result#group-field
{
  local self="$1" group="$2" field="$3"   # Matched Groups, group, field

  # Sanity check arguments
  [[ "$self" ]]  || return 1
  [[ "$group" ]] || return 2
  [[ "$field" ]] || return 3

  # Note that we intend spaces in $self to delineate array elements here
  local self_as_array; self_as_array=($self)

  # Sanity check size of self
  ((${#self_as_array[@]} > 0 ))          || return 4
  ((${#self_as_array[@]} % 3 == 0))      || return 5
  ((${#self_as_array[@]} / 3 >= $group)) || return 6

  ret="${self_as_array[((($group - 1) * 3 + $field - 1))]}"
}

# }}}1

# Declare a site broken with a message and non-zero return.  This is the
# widget to use in general to get a ble.sh message to the terminal
function ble/contrib/config:vim-wordmotion-ish/broken-here
{
  ble/widget/print "$*"; return 1;
}

# Our modified version of _ble_keymap_vi_REX_WORD from blesh/keymap/vi.sh.
# Ours honors Snake-Camel-Hyphen-Acronym words and is a perl regex.
# Whitespace is removed just so we can use a readable layout here and pass
# it in a single line to our perl regex server.
_ble_contrib_vim_wordmotion_ish_PREX_WORD='
  ((?<![A-Z])[a-z]+)
  |
  ([A-Z][a-z]+)
  |
  ([A-Z][A-Z]+(?![a-z]))
  |
  ([0-9]+)
  |
  ([A-Z])
  |
  ([\!-\/\:-\@\[-\`\{-\~]+)
  |
  ([^\s\t\na-zA-Z0-9\!-\/\:-\@\[-\`\{-\~]+)
'
_ble_contrib_vim_wordmotion_ish_PREX_WORD=${_ble_contrib_vim_wordmotion_ish_PREX_WORD// /}
_ble_contrib_vim_wordmotion_ish_PREX_WORD=${_ble_contrib_vim_wordmotion_ish_PREX_WORD//$'\t'/}
_ble_contrib_vim_wordmotion_ish_PREX_WORD=${_ble_contrib_vim_wordmotion_ish_PREX_WORD//$'\n'/}

# Commonly used Blank/Newline definitions: here [-_] are blanks, newline isn't
_ble_contrib_vim_wordmotion_ish_b='[-_\s\t]'
_ble_contrib_vim_wordmotion_ish_n='\n'

# (Given) Word Or Blank Followed By Optional Blanks (a thing ble.sh commonly
# does with it's word regex).  Pronounced "wobfubob" :)
function ble/contrib/config:vim-wordmotion-ish/.wobfbob {
  local w=$1
  local b=$_ble_contrib_vim_wordmotion_ish_b
  local n=$_ble_contrib_vim_wordmotion_ish_n
  ret='((('$w')'"$n?|$b+$n?|$n)($b+$n)*$b*)"
}

function ble/widget/vim-wordmotion-ish/forward-word.impl {
  local arg=$1 flag=$2 reg=$3 prex_word=$4
  local ifs=$_ble_term_IFS
  if [[ $flag == c && ${_ble_edit_str:_ble_edit_ind:1} != [$ifs] ]]; then
    ble/widget/vim-wordmotion-ish/forward-word-end.impl "$arg" "$flag" "$reg" "$prex_word" allow_here
    return "$?"
  fi
  ble/contrib/config:vim-wordmotion-ish/.wobfbob "$prex_word"
  local wobfbob="$ret"
  local prex='(^('"$wobfbob"'){0,'$arg'})'
  local str="${_ble_edit_str:_ble_edit_ind}"
  ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$prex" "$str"
  local match_groups="$ret"
  if [ -n "$match_groups" ]; then
    ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 3
    local group_1_length="$ret"

    index=$((_ble_edit_ind+group_1_length))
    if [[ $flag ]]; then
      ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 3 2
      local group_2_idx="$ret"
      ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 3 3
      local group_2_len="$ret"
      local group2=${str:group_2_idx:group_2_len}
      local b=$_ble_contrib_vim_wordmotion_ish_b
      local n=$_ble_contrib_vim_wordmotion_ish_n
      local rrex="($n$b*\$)"
      ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$rrex" "$group2"
      local group2_groups="$ret"
      if [ -n "$group2_groups" ]; then
        ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$group2_groups" 2 1
        local group2_group_1_match="$ret"
        if [ $group2_group_1_match -ne 0 ]; then
          ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$group2_groups" 2 3
          local suffix_len="$ret"
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
function ble/widget/vim-wordmotion-ish/forward-word-end.impl {
  local arg=$1 flag=$2 reg=$3 prex_word=$4 opts=$5
  local IFS=$_ble_term_IFS
  # FIXXME: because I don't know how to xlate arbitrary chars to perlre.  This
  # arguably isn't an issue at all because we're doing or own word thin anyway.
  [ "$IFS" == $' \t\n' ] || ble/contrib/config:vim-wordmotion-ish/broken-here "\$IFS is not \s\t\n" || return 1
  # FIXXME: this exciting goop makes this work like our vim setup
  # (with out iskeyword+=- setting) for e over: 'foo-BarBaz', 'foo- BarBaz',
  # 'foo -BarBaz', 'foo - BarBaz' and similar with _ instead of -.  Should this
  # exciting goop be happening elsewhere also?  There is no "start-of-word" to
  # correspond to "e" in vi so maybe not.  But then again maybe I missed it
  local pifs='(?:[\s\t\n]|(?<![\s\t\n])[-_](?![\s\t\n]))'
  local prex="(^($pifs*($prex_word)?){0,$arg})" # 単語末端に止まる。空行には止まらない
  local offset=1; [[ :$opts: == *:allow_here:* ]] && offset=0

  local str="${_ble_edit_str:_ble_edit_ind+offset}"
  ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$prex" "$str"
  local match_groups="$ret"

  ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 1
  local group_1_match="$ret"
  ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 3
  local group_1_length="$ret"
  local index=$((_ble_edit_ind+offset+group_1_length-1))

  ((index<_ble_edit_ind&&(index=_ble_edit_ind)))
  [[ ! $flag && (($group_1_match!=0)) && ${_ble_edit_str:index:1} == [$IFS] ]] && ble/widget/.bell
  ble/widget/vi-command/inclusive-goto.impl "$index" "$flag" "$reg"
}
function ble/widget/vim-wordmotion-ish/forward-vword {
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/vim-wordmotion-ish/forward-word.impl "$ARG" "$FLAG" "$REG" "$_ble_contrib_vim_wordmotion_ish_PREX_WORD"
}
ble-bind -m 'vi_nmap' -f 'w' 'vim-wordmotion-ish/forward-vword'
ble-bind -m 'vi_omap' -f 'w' 'vim-wordmotion-ish/forward-vword'
ble-bind -m 'vi_xmap' -f 'w' 'vim-wordmotion-ish/forward-vword'

function ble/widget/vim-wordmotion-ish/forward-vword-end {
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/vim-wordmotion-ish/forward-word-end.impl "$ARG" "$FLAG" "$REG" "$_ble_contrib_vim_wordmotion_ish_PREX_WORD"
}
ble-bind -m 'vi_nmap' -f 'e' 'vim-wordmotion-ish/forward-vword-end'
ble-bind -m 'vi_omap' -f 'e' 'vim-wordmotion-ish/forward-vword-end'
ble-bind -m 'vi_xmap' -f 'e' 'vim-wordmotion-ish/forward-vword-end'

function ble/widget/vim-wordmotion-ish/backward-word.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 prex_word=$4
  ble/contrib/config:vim-wordmotion-ish/.wobfbob "$prex_word"
  local wobfbob="$ret"
  local prex='(('"$wobfbob"'){0,'$arg'}$)'
  local str="${_ble_edit_str::_ble_edit_ind}"
  ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$prex" "$str"
  local match_groups="$ret"
  local index;

  if [ -n "$match_groups" ]; then

    # If the letter before is upper case and current is lower always go back
    # just 1.  We have to detect this here to avoid going all the way back
    # to the start of a possible sequence of preceeding capitol letter (the
    # regex can't handle this because it doesn't look at the current char).
    # FIXXME: the right fix for this would be to parse the entire big word
    # (space-delimited or somthing) since the presence of context in our
    # word boundry criteria means splitting the line at an arbitrary point
    # can't entirely work.  But that would be a lot more work than patching
    # things up after the fact as we do here.
    local current_char=${_ble_edit_str:_ble_edit_ind:1}
    local previous_char=${_ble_edit_str:((_ble_edit_ind - 1)):1}
    if [[ "$current_char" =~ [a-z]  ]] && [[ "$previous_char" =~ [A-Z] ]] ; then
      index=$((_ble_edit_ind - 1))
    else
      ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 3
      local group_2_length="$ret"
      index=$((_ble_edit_ind - $group_2_length))
    fi

  else
    index=$_ble_edit_ind
  fi

  ble/widget/vi-command/exclusive-goto.impl "$index" "$flag" "$reg"
} # }}}3
function ble/widget/vim-wordmotion-ish/backward-vword { # {{{3
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  ble/widget/vim-wordmotion-ish/backward-word.impl "$ARG" "$FLAG" "$REG" "$_ble_contrib_vim_wordmotion_ish_PREX_WORD"
} # }}}3
ble-bind -m 'vi_nmap' -f 'b' 'vim-wordmotion-ish/backward-vword'
ble-bind -m 'vi_omap' -f 'b' 'vim-wordmotion-ish/backward-vword'
ble-bind -m 'vi_xmap' -f 'b' 'vim-wordmotion-ish/backward-vword'

# FIXME: These keymap functions need to be renamed.  They are private so in
# theory should get the full treatment from style guide hmm I dunno maybe
# ask author

# The real changes to achieve wordmotion-style visual select,
# operator-pending, etc. are in these:
function ble/contrib/config:vim-wordmotion-ish/text-object/word.extend-forward { # {{{3
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
  local b=$_ble_contrib_vim_wordmotion_ish_b
  local n=$_ble_contrib_vim_wordmotion_ish_n
  if [[ $type == i* ]]; then
    rex_unit='(^'$W'|^'$b'+|^'$n')'
  elif [[ $type == a* ]]; then
    rex_unit='(^'$W$b'*|^'$b'+'$W'|^'$b'*'$n'('$b'+'$n')*('$n'|'$b'*'$W'))'
  else
    return 1
  fi
  local i rematch=
  for ((i=0;i<arg;i++)); do
    if ((i==0)) && [[ $flags == *I* ]]; then
      # FIXXME: because I don't know how to xlate arbitrary chars to perlre:
      [ "$IFS" == $' \t\n' ] || ble/contrib/config:vim-wordmotion-ish/broken-here "\$IFS is not \s\t\n" || return 1
      local pifs='\s\t\n'
      local b=$_ble_contrib_vim_wordmotion_ish_b
      local prex='(('$prex_word')$|'$b'*['$pifs']$)'
      local str=${_ble_edit_str::beg+1}
      ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$prex" "$str"
      local match_groups="$ret"
      if [ -n "$match_groups" ]; then
        ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 2
        local group_1_idx="$ret"
        ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 3
        local group_1_len="$ret"
        local group_1_cap=${str:group_1_idx:group_1_len}

        # See the comment and FIXXME in
        # ble/widget/vim-wordmotion-ish/backward-word.impl about the need
        # to handle both sides of the current position because our word
        # definition depends on context.
        local current_char=${_ble_edit_str:_ble_edit_ind:1}
        local next_char=${_ble_edit_str:((_ble_edit_ind + 1)):1}
        if [[ "$current_char" =~ [A-Z]  ]] && [[ "$next_char" =~ [a-z] ]] ; then
          :
        else
          ((beg-=$group_1_len-1,end=beg))
        fi

      fi
    else
      [[ ${_ble_edit_str:end:1} == $'\n' ]] && ((end++))
    fi

    local str=${_ble_edit_str:end}
    # Previous line used to have ((end+1)) instead of end and a similar change
    # to the line with rematch noted below and I thought it fixed something,
    # but I'm not sure what.  And it seems to make other things more broken
    #local str=${_ble_edit_str:((end+1))}
    ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$rex_unit" "$str"
    local match2_groups="$ret"
    [ -n "$match2_groups" ] || return 1
    ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match2_groups" 2 2
    local match_2_group_1_idx="$ret"
    ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match2_groups" 2 3
    local match2_group_1_len="$ret"
    local match2_group_1_cap=${str:match2_group_1_idx:match2_group_1_len}
    rematch="$match2_group_1_cap"
    ((end+=${#rematch}))
    # Previous line used to have this +1 as noted above.
    #((end+=${#rematch}+1))

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
function ble/contrib/config:vim-wordmotion-ish/text-object/word.extend-backward { # {{{3

  # FIXXME: there's some slight bug in here still st e.g. vaw when on a letter
  # in foo in ' fooBar' will select the leading space, which is different
  # the the vim wordmotion and different than the corresponding behavior in
  # native vanilla vim for ' foo bar'.  But native vanilla vim itself selects
  # different things for vaw when on a in bar in 'foo bar' vs 'foo bar '
  # (former selects the space before bar while latter selects only the space
  # after bar) which seems pretty nonsensical so it's safe to conclude that
  # around space-delimited word is just not something we're going to want
  # to use (around is for e.g. va" on f or o or or in "foo" really).

  local rex_unit=
  local W='('$prex_word')' b='['$space']' n=$nl
  local b=$_ble_contrib_vim_wordmotion_ish_b
  local n=$_ble_contrib_vim_wordmotion_ish_n
  if [[ $type == i* ]]; then
    rex_unit='(('$W'|'$b'+)'$n'?$|'$n'$)'
  elif [[ $type == a* ]]; then
    rex_unit='('$b'*'$W$n'?$|'$W'?'$b'*('$n'('$b'+'$n')*'$b'*)?('$b$n'?|'$n')$)'
  else
    return 1
  fi
  local count=$arg

  while ((count--)); do

    local str=${_ble_edit_str::beg}
    ble/contrib/config:vim-wordmotion-ish/match-perl-regex "$rex_unit" "$str"
    local match_groups="$ret"
    [ -n "$match_groups" ] || return 1

    ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 2
    local group_1_idx="$ret"
    ble/contrib/config:vim-wordmotion-ish/match-result#group-field "$match_groups" 2 3
    local group_1_len="$ret"

    # See the comment and FIXXME in
    # ble/widget/vim-wordmotion-ish/backward-word.impl about the need to handle
    # both sides of the current position because our word definition depends
    # on context.
    local current_char=${_ble_edit_str:_ble_edit_ind:1}
    local prev_char=${_ble_edit_str:((_ble_edit_ind - 1)):1}
    if [[ "$current_char" =~ [a-z]  ]] && [[ "$prev_char" =~ [A-Z] ]] ; then
      (( beg -= 1 ))
    else
      (( beg -= $group_1_len ))
    fi

    local group_1_capture=${str:group_1_idx:group_1_len}
    local match=${group_1_capture%"$nl"}

    if ((beg==0&&${#match}>=2)); then
      # FIXXME: should either or both of the below tests againt $match use our
      # more expansive "white" space def?  I think since this is inter-line
      # stuff it would likely be counter-intuitive even if technically
      # correct but it would be nice to know for sure what's going on here.
      if [[ $type == i* ]]; then
        [[ $match == ["$space"]* ]] && beg=1
      elif [[ $type == a* ]]; then
        [[ $match == *[!"$ifs"] ]] && beg=1
      fi
    fi
  done

  return 0
} # }}}3
function ble/contrib/config:vim-wordmotion-ish/text-object/word.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 type=$4
  local space=$' \t' nl=$'\n' ifs=$_ble_term_IFS
  ((arg==0)) && return 0
  local prex_word
  if [[ $type == ?W ]]; then
    # FIXME: I think this inflicts our turning W into w on users if they use
    # any of these bindings:
    #   ble-bind -m 'vi_omap' -f 'a' 'vim-wordmotion-ish/text-object'
    #   ble-bind -m 'vi_omap' -f 'i' 'vim-wordmotion-ish/text-object'
    #   ble-bind -m 'vi_xmap' -f 'a' 'vim-wordmotion-ish/text-object'
    #   ble-bind -m 'vi_xmap' -f 'i' 'vim-wordmotion-ish/text-object'
    # even if they deliberately *don't* use the bindings for W E B to the old
    # word movement widgets that we provide (currently at the end of this
    # file).  Of course they want these text-object bindings to make w work.
    # This is a confusing mess for casual users that must at least be
    # documented.
    # We want large W to do old small w, so change $type and call original
    type=${type/%W/w}
    ble/keymap:vi/text-object/word.impl "$arg" "$flag" "$reg" "$type"
    return
  else
    prex_word=$_ble_contrib_vim_wordmotion_ish_PREX_WORD
  fi
  local index=$_ble_edit_ind
  if [[ $_ble_decode_keymap == vi_[xs]map ]]; then
    if ((index<_ble_edit_mark)); then
      local beg=$index
      if ble/contrib/config:vim-wordmotion-ish/text-object/word.extend-backward; then
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
  if ! ble/contrib/config:vim-wordmotion-ish/text-object/word.extend-forward; then
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
# one of the above or each other instead:
function ble/contrib/config:vim-wordmotion-ish/text-object.impl { # {{{3
  local arg=$1 flag=$2 reg=$3 type=$4
  case $type in
  ([ia][wW]) ble/contrib/config:vim-wordmotion-ish/text-object/word.impl "$arg" "$flag" "$reg" "$type" ;;
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
function ble/contrib/config:vim-wordmotion-ish/text-object.hook { # {{{3
  local key=$1
  local ARG FLAG REG; ble/keymap:vi/get-arg 1
  if ! ble-decode-key/ischar "$key"; then
    ble/widget/vi-command/bell
    return 1
  fi
  local ret; ble/util/c2s "$key"
  local type=$_ble_keymap_vi_text_object$ret
  ble/contrib/config:vim-wordmotion-ish/text-object.impl "$ARG" "$FLAG" "$REG" "$type"
  return 0
} # }}}3
function ble/contrib/config:vim-wordmotion-ish/.check-text-object { # {{{3
  local n=${#KEYS[@]}; ((n&&n--))
  ble-decode-key/ischar "${KEYS[n]}" || return 1
  local ret; ble/util/c2s "${KEYS[n]}"; local c=$ret
  [[ $c == [ia] ]] || return 1
  [[ $_ble_keymap_vi_opfunc || $_ble_decode_keymap == vi_[xs]map ]] || return 1
  _ble_keymap_vi_text_object=$c
  _ble_decode_key__hook=ble/contrib/config:vim-wordmotion-ish/text-object.hook
  return 0
} # }}}3
function ble/widget/vim-wordmotion-ish/text-object { # {{{3
  ble/contrib/config:vim-wordmotion-ish/.check-text-object && return 0
  ble/widget/vi-command/bell
  return 1
} # }}}3
# Let's schedule a quick check so try to stay in sync with ble.sh:
function check_exactly_one_line_changed { # {{{3
  local func_a=$1 func_b=$2
  local emc=3   # Expected Modification Count (note 2 are due to name change)
  [ $(diff <(type $func_a) <(type $func_b) -u | diffstat -m -t | tail -n 1 | cut -d , -f 3) -eq $emc ]
} # }}}3
function check_exactly_one_line_changed_maybe_warn { # {{{3
  local warnMsgPrefix='unexpectedly large delta between stock ble.sh function'
  check_exactly_one_line_changed "$1" "$2"                         \
    ||  ble/util/print "$warnMsgPrefix $1 and modified version $2"

} # }}}3
function ble/contrib/config:vim-wordmotion-ish/check_deltas_vs_some_upstream_word_funcs { # {{{3

  check_exactly_one_line_changed_maybe_warn                \
    ble/keymap:vi/text-object.impl                         \
    ble/contrib/config:vim-wordmotion-ish/text-object.impl

  check_exactly_one_line_changed_maybe_warn                \
    ble/keymap:vi/text-object.hook                         \
    ble/contrib/config:vim-wordmotion-ish/text-object.hook

  check_exactly_one_line_changed_maybe_warn                  \
    ble/keymap:vi/.check-text-object                         \
    ble/contrib/config:vim-wordmotion-ish/.check-text-object

  check_exactly_one_line_changed_maybe_warn      \
       ble/widget/vi-command/text-object         \
       ble/widget/vim-wordmotion-ish/text-object

} # }}}3
blehook/eval-after-load keymap_vi ble/contrib/config:vim-wordmotion-ish/check_deltas_vs_some_upstream_word_funcs

ble-bind -m 'vi_omap' -f 'a' 'vim-wordmotion-ish/text-object'
ble-bind -m 'vi_omap' -f 'i' 'vim-wordmotion-ish/text-object'
ble-bind -m 'vi_xmap' -f 'a' 'vim-wordmotion-ish/text-object'
ble-bind -m 'vi_xmap' -f 'i' 'vim-wordmotion-ish/text-object'

ble-bind -m 'vi_nmap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_omap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_xmap' -f 'W' 'vi-command/forward-vword'
ble-bind -m 'vi_nmap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_omap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_xmap' -f 'E' 'vi-command/forward-vword-end'
ble-bind -m 'vi_nmap' -f 'B' 'vi-command/backward-vword'
ble-bind -m 'vi_omap' -f 'B' 'vi-command/backward-vword'
ble-bind -m 'vi_xmap' -f 'B' 'vi-command/backward-vword'
