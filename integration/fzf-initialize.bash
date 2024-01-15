# ble/contrib/integration/fzf-initialize.bash (C) 2020-2023, akinomyoga

# Usage: Please write the following lines in blerc
#
# ```bash
# _ble_contrib_fzf_base=/path/to/fzf-base-directory
# ble-import -d integration/fzf-initialize
# ```

function ble/contrib/integration:fzf-completion/initialize {
  if [[ -d $_ble_contrib_fzf_base ]]; then
    if [[ -d $_ble_contrib_fzf_base/bin && :$PATH: != *:"$_ble_contrib_fzf_base/bin":* ]]; then
      export PATH="${PATH:+${PATH}:}$_ble_contrib_fzf_base/bin"
    fi
    if ! type fzf &>/dev/null; then
      ble/util/print 'ble/contrib/integration:fzf-initialize: "fzf" not found.' >&2
      return 1
    fi
  else
    local ret
    if ! ble/util/assign ret 'type -p fzf 2>/dev/null'; then
      ble/util/print 'ble/contrib/integration:fzf: "fzf" not found.' >&2
      return 1
    fi
    ble/util/readlink "$ret"
    ret=${ret%/*}      # fzf, fzf-linux_amd64, etc.
    ret=${ret%/bin}    # repo/bin/
    ret=${ret%/target} # repo/target (compile directory)
    if [[ -s $ret/shell/key-bindings.bash ]]; then
      _ble_contrib_fzf_base=$ret
    elif [[ -d $ret/share/fzf/shell ]]; then
      _ble_contrib_fzf_base=$ret/share/fzf
    elif [[ -s $ret/share/fzf/key-bindings.bash ]]; then
      # NixOS package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      _ble_contrib_fzf_base=$ret/share/fzf
    elif [[ -s $ret/share/doc/fzf/examples/key-bindings.bash ]]; then
      # Ubuntu fzf package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      _ble_contrib_fzf_base=$ret/share/doc/fzf/examples
    elif [[ -d /usr/share/fzf/shell ]]; then
      _ble_contrib_fzf_base=/usr/share/fzf
    elif [[ -d /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
      # Ubuntu fzf package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      _ble_contrib_fzf_base=/usr/share/doc/fzf/examples
    else
      ble/util/print 'ble/contrib/integration:fzf: failed to find "fzf" base directory' >&2
      return 1
    fi
  fi
  return 0
}

ble/contrib/integration:fzf-completion/initialize || return 1
