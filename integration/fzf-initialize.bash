# ble/contrib/integration/fzf-initialize.bash (C) 2020-2023, akinomyoga

# Usage: Please write the following lines in blerc
#
# ```bash
# _ble_contrib_fzf_base=/path/to/fzf-base-directory
# ble-import -d integration/fzf-initialize
# ```

_ble_contrib_fzf_path=fzf
_ble_contrib_fzf_version=-1
_ble_contrib_fzf_base=

function ble/contrib/integration:fzf-completion/initialize {
  if [[ -d $_ble_contrib_fzf_base ]]; then
    if [[ -d $_ble_contrib_fzf_base/bin && :$PATH: != *:"$_ble_contrib_fzf_base/bin":* ]]; then
      export PATH="${PATH:+${PATH}:}$_ble_contrib_fzf_base/bin"
    fi
    local path
    if ! ble/bin#get-path fzf; then
      ble/util/print 'ble/contrib/integration:fzf-initialize: "fzf" not found.' >&2
      return 1
    fi
    _ble_contrib_fzf_path=$path
  else
    local path
    if ! ble/bin#get-path fzf; then
      ble/util/print 'ble/contrib/integration:fzf: "fzf" not found.' >&2
      return 1
    fi
    _ble_contrib_fzf_path=$path
    local ret
    ble/util/readlink "$path"
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
      local version
      ble/util/assign version '"$path" --version 2>/dev/null'
      ble/string#match "$version" '^[[:space:]]*([0-9]+)\.([0-9]+)\.([0-9]+)?' &&
        ((_ble_contrib_fzf_version=10#0${BASH_REMATCH[1]}*10000+10#0${BASH_REMATCH[2]}*100+10#0${BASH_REMATCH[3]}))

      # fzf >= 0.48.0 has started to offer « eval "$(fzf --bash)" », so
      # careless package maintainers may drop the shell integration files.  It
      # shouldn't actually be dropped, but we would suppress the error message
      # because we can work around such a package using "fzf --bash".
      if ((_ble_contrib_fzf_version<4800)); then
        ble/util/print 'ble/contrib/integration:fzf: failed to find "fzf" base directory' >&2
      fi
      return 1
    fi
  fi
  return 0
}

ble/contrib/integration:fzf-completion/initialize || return 1
