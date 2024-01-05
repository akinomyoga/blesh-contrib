# blesh/contrib/config/github288-filter-sabbrev-completion.bash (C) 2023, Koichi Murase <myoga.murase@gmail.com>

# The option "bleopt complete_source_sabbrev_command_ignore" specifies a
# colon-separated list of glob patterns of command names for which the sabbrev
# completion should be suppressed.
bleopt/declare -v complete_source_sabbrev_command_ignore ''

_ble_contrib_config_github288_command_ignore_patterns=()
function bleopt/check:complete_source_sabbrev_command_ignore {
  if [[ $value ]]; then
    ble/string#split _ble_contrib_config_github288_command_ignore_patterns : "$value"
  else
    _ble_contrib_config_github288_command_ignore_patterns=()
  fi
}
bleopt -I complete_source_sabbrev_command_ignore

# This is an "advice" function for the exiting function
# "ble/complete/source:sabbrev", i.e., the function to modify the behavior of
# the original function.  We insert some codes before starting the original
# processing.
function ble/contrib/config:github288/filter-sabbrev-completion.advice {
  # If we are generating sabbrevs as a part of argument completions and if
  # there are any ignore patterns for the command names in
  # "complete_source_sabbrev_command_ignore", we make the sabbrev completions
  # inactive for the commands matching an ignore pattern.
  if [[ ${ADVICE_FUNCNAME[1]} == ble/complete/source:argument ]]; then
    if ((${#_ble_contrib_config_github288_command_ignore_patterns[@]})); then
      # Extract the command name and arguments on the current caret position.
      local comp_words comp_line comp_point comp_cword
      ble/syntax:bash/extract-command "$_ble_edit_ind" || return 1

      # If the command word is simple enough, we evaluate the command word to
      # resolve quoting and parameter expansions.
      local cmd=${comp_words[0]} ret
      ble/syntax:bash/simple-word/safe-eval "$cmd" nonull && cmd=$ret

      # If the command name matches any pattern of the ignored list, we return
      # the function without calling the original function.
      ble/complete/string#match-patterns "$cmd" "${_ble_contrib_config_github288_command_ignore_patterns[@]}" &&
        return 1
    fi
  fi

  # We call the original "ble/complete/source:sabbrev" here.  The original
  # function, i.e., the advice target, can be called by ble/function#advice/do.
  ble/function#advice/do
}

function ble/contrib/config:github288/initialize.hook {
  # We hook the above "advice" function to "ble/complete/source:sabbrev".
  ble/function#advice around ble/complete/source:sabbrev ble/contrib/config:github288/filter-sabbrev-completion.advice
}
blehook/eval-after-load complete ble/contrib/config:github288/initialize.hook
