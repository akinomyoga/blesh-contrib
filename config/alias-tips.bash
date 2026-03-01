# blesh/contrib/config/alias-tips.bash (C) 2026, Hong Xu <hong@topbug.net>
#
# When the user types a command that could be replaced by a shorter alias,
# print a hint before execution.  For example, if `alias gst='git status'`
# is defined and the user types `git status`, the following hint is shown:
#
#   Hint: use alias "gst" instead of "git status"
#
# Example setup
#
# ```bash
# # blerc
# ble-import -d contrib/config/alias-tips
# ```
#

# Parallel arrays: _expansions[i] is the alias expansion, _aliases[i] is the
# alias name.  When multiple aliases share the same expansion, keep the
# shortest name.
_ble_contrib_config_alias_hint_expansions=()
_ble_contrib_config_alias_hint_aliases=()

function ble/contrib/config:alias-tips/init {
  _ble_contrib_config_alias_hint_expansions=()
  _ble_contrib_config_alias_hint_aliases=()
  local key value
  while IFS='=' read -r key value; do
    key=${key#alias }
    value=${value#\'}
    value=${value%\'}
    # Skip aliases that are not shorter than the expansion.
    if [[ ${#key} -ge ${#value} ]]; then
      continue
    fi
    # Check if this expansion already exists (multiple aliases can share
    # the same expansion, e.g. alias gs='git status' and gst='git status').
    # If so, keep the shorter alias name; otherwise append a new entry.
    local i found=0
    for ((i = 0; i < ${#_ble_contrib_config_alias_hint_expansions[@]}; i++)); do
      if [[ ${_ble_contrib_config_alias_hint_expansions[i]} == "$value" ]]; then
        if [[ ${#key} -lt ${#_ble_contrib_config_alias_hint_aliases[i]} ]]; then
          _ble_contrib_config_alias_hint_aliases[i]=$key
        fi
        found=1
        break
      fi
    done
    if ((! found)); then
      _ble_contrib_config_alias_hint_expansions+=("$value")
      _ble_contrib_config_alias_hint_aliases+=("$key")
    fi
  done < <(alias -p)
}

function ble/contrib/config:alias-tips/preexec.hook {
  local typed=$1
  local best_key='' best_value=''
  local i value key
  for ((i = 0; i < ${#_ble_contrib_config_alias_hint_expansions[@]}; i++)); do
    value=${_ble_contrib_config_alias_hint_expansions[i]}
    key=${_ble_contrib_config_alias_hint_aliases[i]}
    if [[ $typed =~ ^[[:space:]]*"$value"($|[^[:alnum:]_]) ]]; then
      # Already using the alias
      if [[ $typed =~ ^[[:space:]]*"$key"($|[^[:alnum:]_]) ]]; then
        continue
      fi
      # Prefer the longest matching expansion
      if [[ ${#value} -gt ${#best_value} ]]; then
        best_key=$key
        best_value=$value
      fi
    fi
  done
  if [[ $best_key ]]; then
    ble/util/print $'\e[33m'"Hint: use alias \"$best_key\" instead of \"$best_value\""$'\e[m' >&2
  fi
}

ble/contrib/config:alias-tips/init
# Uses the PREEXEC hook to get the original (pre-alias-expansion) command.
blehook PREEXEC!=ble/contrib/config:alias-tips/preexec.hook
