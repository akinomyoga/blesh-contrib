# ble/contrib/integration/fzf-menu.bash (C) 2024, akinomyoga
#
# https://github.com/akinomyoga/ble.sh/issues/479

## @fn ble/contrib/integration:fzf-menu/SELECTOR args...
##   Returns the index of the selected candidate.  Users can override this
##   function to adjust the detailed behavior.
##
##   @param[in] args...
##     The list of candidates. Each argument takes the form
##     "<index><SEP><word><SEP><desc>".  <SEP> is specified by the shell
##     variable sep.
##   @var[in] common_prefix
##     The common prefix of the filter target
##   @var[in] sep
##     The separator used to separate the index, word, and description in an
##     argument
##   @stdout
##     Output the selected index.
function ble/contrib/integration:fzf-menu/SELECTOR {
  local fzf_options
  fzf_options=(--ansi --query "$common_prefix")

  # Use Unicode box-drawing characters only when the width of the box-drawing
  # characters in the current terminal is 1.  The width of the box-drawing
  # characters is specified to be East_Asian_Width=A (Ambiguous), and the
  # actual width depends on the terminal.  However, fzf assumes the width of
  # the box-drawing characters to be always 1.  This breaks the layout of the
  # terminal content in the terminals where the box-drawing characters have
  # double width.  We check the width of the box-drawing characters (U+2500 as
  # a representative) and disable the use of the box-drawing characters by fzf
  # when it is not 1.
  local ret
  ble/util/c2w 0x2500
  ((ret==1)) || ble/array#push fzf_options --no-unicode

  # When the current completion is performed by case-insensitive search (i.e.,
  # when the readline variable is set to "set completion-ignore-case on"), we
  # let fzf filter items by case-insensitive matching.
  [[ :$comp_type: == *:i:* ]] &&
    ble/array#push fzf_options --ignore-case

  local formatter="printf '%s\n' \"\$@\""
  ble/bin#has column &&
    formatter=$formatter' | column -ts "$sep" -o "$sep" -c unlimited'
  ble/array#push fzf_options -d "$sep" --with-nth=2.. --nth=1

  builtin eval -- "$formatter" | fzf "${fzf_options[@]}" | cut -d "$sep" -f 1
}

function ble/contrib/integration:fzf-menu/.get-common-prefix {
  local cand_word ret
  cand_word=("$@")
  ble/complete/candidates/determine-common-prefix
  common_prefix=$ret
}

function ble/contrib/integration:fzf-menu/.select-and-insert {
  if ((cand_count>1)); then
    local common_prefix=
    ble/contrib/integration:fzf-menu/.get-common-prefix "${cand_cand[@]}"
    (($?==148)) && return 148

    local desc_sgr0=$_ble_term_sgr0
    ble/color/face2sgr menu_desc_quote; local desc_sgrq=$ret
    ble/color/face2sgr menu_desc_type; local desc_sgrt=$ret

    # Create a list of "<index>^\<word>^\- <desc>" where ^\ represents the ANSI
    # control character FS (U+001C).
    local sep=$_ble_term_FS
    local -a list=()
    local i
    for ((i=0;i<cand_count;i++)); do
      local ACTION=${cand_pack[i]%%:*}
      local "${_ble_complete_cand_varnames[@]/%/=}" # disable=#D1570
      ble/complete/cand/unpack "${cand_pack[i]}"

      local g=0 prefix= suffix= desc=
      ble/function#try ble/complete/action:"$ACTION"/init-menu-item
      (($?==148)) && return 148
      ble/function#try ble/complete/action:"$ACTION"/get-desc
      (($?==148)) && return 148

      ble/color/g2sgr "$g"; local sgr=$ret
      local item=$prefix$sgr$CAND$_ble_term_sgr0$suffix
      item=${item//"$sep"/'^\'}
      desc=${desc//"$sep"/'^\'}
      ble/array#push list "$i$sep$item$_ble_term_sgr0$sep - $desc$_ble_term_sgr0"
    done

    ble/term/leave-for-widget
    local index
    ble/util/assign index 'ble/contrib/integration:fzf-menu/SELECTOR "${list[@]}"'
    ble/term/enter-for-widget
    ble/textarea#invalidate

    if [[ $index ]]; then
      cand_count=1
      cand_cand=("${cand_cand[index]}")
      cand_word=("${cand_word[index]}")
      cand_pack=("${cand_pack[index]}")
    fi
  fi

  if ((cand_count==1)); then
    ble/complete/insert-common
  fi

  # To suppress the post-processing for ble.sh's menu interface, we return 148.
  return 148
}

ble-import -C 'ble/function#push ble/complete/menu/show "ble/contrib/integration:fzf-menu/.select-and-insert"' core-complete

# function ble/contrib/integration:fzf-menu/complete.after {
#   [[ $_ble_complete_menu_active ]] || return 0
#   local COMP1 COMP2 COMPS COMPV
#   local comp_type comps_flags comps_fixed
#   local cand_count cand_cand cand_word cand_pack
#   ble/complete/candidates/clear
#   ble/complete/menu/generate-candidates-from-menu
#   ble/complete/menu/clear
#   ble/contrib/integration:fzf-menu/.select-and-insert
# }
# ble-import -C 'ble/function#advice after ble/widget/complete "ble/contrib/integration:fzf-menu/compelte.after"' core-complete
