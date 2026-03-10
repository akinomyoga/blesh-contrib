# blesh/contrib/config/alias-tips.bash
# Copyright (C) 2026, Hong Xu <hong@topbug.net>.
# Copyright (C) 2026, Koichi Murase <myoga.murase@gmail.com>.
#
# When the user types a command that could be replaced by a shorter alias,
# print a tip before execution.  For example, if `alias gst='git status'` is
# defined, and if the user types `git status`, the following tip is shown:
#
#   Tips: use alias "gst" instead of "git status"
#
# Example setup
#
# ```bash
# # blerc
# ble-import -d config/alias-tips
# ```
#

function ble/contrib/config:alias-tips/preexec.hook {
  local command=$1 ret

  local names values
  ble/alias/list-pairs

  local best_name= best_value=
  local i name value
  for ((i = 0; i < ${#names[@]}; i++)); do
    name=${names[i]} value=${values[i]%[[:blank:]]}

    # Only consider an alias that shortens a command line
    ((${#name} < ${#value})) || continue

    # Only consider an alias value matching the current command line
    ble/string#escape-for-extended-regex "$value"; local rex_value=$ret
    ble/string#match "$command" "^[$_ble_term_IFS]*$rex_value($|[$_ble_term_IFS=;|&()<>])" || continue

    # Prefer the longest matching expansion.  If multiple aliases match the
    # same number of characters, we pick up the shortest alias name.
    if ((${#value} > ${#best_value})); then
      best_name=$name
      best_value=$value
    elif ((${#value} == ${#best_value} && ${#name} < ${#best_name})); then
      best_name=$name
      best_value=$value
    fi
  done

  if [[ $best_value ]]; then
    ble/string#quote-word "$best_name" always; local quoted_best_name=$ret
    ble/string#quote-word "$best_value" always; local quoted_best_value=$ret
    local message="Tips: use alias $quoted_best_name instead of $quoted_best_value"
    ble/util/print "${_ble_term_setaf[3]}$message$_ble_term_sgr0" >&2
  fi
}

# Uses the PREEXEC hook to get the original (pre-alias-expansion) command.
blehook PREEXEC!=ble/contrib/config:alias-tips/preexec.hook
