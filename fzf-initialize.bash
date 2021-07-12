# ble/contrib/fzf-initialize.bash (C) 2020-2021, akinomyoga

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
    ret=${ret%/target}
    if [[ -s $ret/shell/key-bindings.bash ]]; then
      _ble_contrib_fzf_base=$ret
    elif [[ -d $ret/share/fzf/shell ]]; then
      _ble_contrib_fzf_base=$ret/share/fzf
    elif [[ -d /usr/share/fzf/shell ]]; then
      _ble_contrib_fzf_base=/usr/share/fzf
    else
      echo 'ble/contrib/fzf: failed to find "fzf" base directory' >&2
      return 1
    fi
  fi
  return 0
}

ble/contrib/fzf-completion/initialize || return 1
