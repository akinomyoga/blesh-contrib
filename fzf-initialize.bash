# ble/contrib/fzf-initialize.bash (C) 2020, akinomyoga

# Usage: Please write the following lines in blerc
#
# ```bash
# _ble_contrib_fzf_base=/path/to/fzf-base-directory
# ble-import -d contrib/fzf-initialize
# ```

function ble/contrib/fzf-completion/initialize {
  if [[ $_ble_contrib_fzf_base ]]; then
    if [[ :$PATH: != *:"$_ble_contrib_fzf_base/bin":* ]]; then
      export PATH="${PATH:+${PATH}:}$_ble_contrib_fzf_base/bin"
    fi
    if ! type fzf &>/dev/null; then
      echo 'ble/contrib/fzf-initialize: "fzf" not found.' >&2
      return 1
    fi
  else
    local ret
    if ! ble/util/assign ret 'type -p fzf 2>/dev/null'; then
      echo 'ble/contrib/fzf: "fzf" not found.' >&2
      return 1
    fi
    ble/util/readlink "$ret"
    ret=${ret%/*}
    ret=${ret%/bin}
    if [[ ! -d $ret/shell ]]; then
      echo 'ble/contrib/fzf: failed to find "fzf" base directory' >&2
      return 1
    fi

    _ble_contrib_fzf_base=$ret
  fi
  return 0
}

ble/contrib/fzf-completion/initialize || return 1
