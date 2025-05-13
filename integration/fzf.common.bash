# ble/contrib/integration/fzf.common.bash (C) 2020-2024, akinomyoga

## @fn ble/contrib/integration:fzf/locate-shell-settings prefix pkgname cmd
##   @param[in] prefix pkgname cmd
##
##   @var[out] PREFIX_base
##   @var[out] PREFIX_path
##   @var[out] PREFIX_version
##
function ble/contrib/integration:fzf/locate-shell-settings {
  local prefix=${1:-_ble_contrib_fzf} pkgname=${2:-fzf} cmd=${3:-fzf}

  local base_ref=${prefix}_base
  local path_ref=${prefix}_path
  local version_ref=${prefix}_version

  local path=$cmd
  local version=-1

  if local base=${!base_ref-}; [[ -d $base ]]; then
    if [[ -d $base/bin && :$PATH: != *:"$base/bin":* ]]; then
      export PATH="${PATH:+${PATH}:}$base/bin"
    fi

    local path
    if ! ble/bin#get-path "$cmd"; then
      ble/util/print "ble/contrib/integration: '$cmd' not found." >&2
      return 1
    fi
    ble/util/set "$path_ref" "$path"
  else
    local path
    if ! ble/bin#get-path "$cmd"; then
      ble/util/print "ble/contrib/integration: '$cmd' not found." >&2
      return 1
    fi

    local base= ret
    ble/util/readlink "$path"
    ret=${ret%/*}              # fzf, fzf-linux_amd64, etc.
    ret=${ret%/bin}            # repo/bin/
    ret=${ret%/target}         # repo/target (compile directory)
    ret=${ret%/target/debug}   # repo/target/debug (cargo compile directory)
    ret=${ret%/target/release} # repo/target/release (cargo compile directory)
    if [[ -s $ret/shell/key-bindings.bash ]]; then
      base=$ret
    elif [[ -d $ret/share/$pkgname/shell ]]; then
      base=$ret/share/$pkgname
    elif [[ -s $ret/share/$pkgname/key-bindings.bash ]]; then
      # NixOS package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      base=$ret/share/$pkgname
    elif [[ -s $ret/share/doc/$pkgname/examples/key-bindings.bash ]]; then
      # Ubuntu $pkgname package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      base=$ret/share/doc/$pkgname/examples
    elif [[ -d /usr/share/$pkgname/shell ]]; then
      base=/usr/share/$pkgname
    elif [[ -d /usr/share/doc/$pkgname/examples/key-bindings.bash ]]; then
      # Ubuntu fzf package (https://github.com/akinomyoga/blesh-contrib/pull/5#issuecomment-1019394821)
      base=/usr/share/doc/$pkgname/examples
    else
      if [[ $cmd == fzf ]]; then
        ble/util/assign version '"$path" --version 2>/dev/null'
        ble/string#match "$version" '^[[:blank:]]*([0-9]+)\.([0-9]+)\.([0-9]+)?' &&
          ((version=10#0${BASH_REMATCH[1]}*10000+10#0${BASH_REMATCH[2]}*100+10#0${BASH_REMATCH[3]}))

        # fzf >= 0.48.0 has started to offer « eval "$(fzf --bash)" », so
        # careless package maintainers may drop the shell integration files.  It
        # shouldn't actually be dropped, but we would suppress the error message
        # because we can work around such a package using "fzf --bash".
        ((version>=4800)) && base=__eval_fzf_bash__
      fi
    fi

    if [[ ! $base ]]; then
      ble/util/print "ble/contrib/integration: failed to find '$cmd' base directory" >&2
      return 1
    fi
    ble/util/set "$base_ref" "$base"
  fi

  ble/util/set "$path_ref" "$path"
  ble/util/set "$version_ref" "$version"
  return 0
}

function ble/contrib/integration:fzf/.is-bind-dsr0 {
  [[ $1 == '"\e[0n"'* ]] &&
    ble/string#match "${FUNCNAME[2]#ble/function#advice/original:}" '^__?(fzf|skim)_'
}

function ble/contrib/integration:fzf/.is-printf-dsr5 {
  [[ $1 == '\e[5n' ]] &&
    ble/string#match "${FUNCNAME[2]#ble/function#advice/original:}" '^__?(fzf|skim)_'
}

function ble/contrib/integration:fzf/complete.advice {
  local opts=${1-}

  if [[ ! ${_ble_attached-} ]]; then
    ble/function#push caller 'builtin caller ${1+"$(($1+6))"}'
    ble/function#advice/do
    ble/function#pop caller
    return 0
  fi

  [[ :$comp_type: == *:auto:* || :$comp_type: == *:[maA]:* ]] && return 0

  if [[ ! ${_ble_contrib_fzf_comp_words_raw-} ]]; then
    local val_COMP_LINE val_COMP_POINT val_COMP_WORDS val_COMP_CWORD
    ble/util/save-vars val_ COMP_LINE COMP_POINT COMP_WORDS COMP_CWORD

    compopt -o ble/syntax-raw
    local _ble_contrib_fzf_comp_words_raw=1
    local COMP_WORDS; COMP_WORDS=("${comp_words[@]}")
    local COMP_CWORD=$comp_cword
    local COMP_LINE=$comp_line COMP_POINT=$comp_point
  fi

  ble/function#push bind 'ble/contrib/integration:fzf/.is-bind-dsr0 "$@" || ble/builtin/bind "$@"'
  ble/function#push printf 'ble/contrib/integration:fzf/.is-printf-dsr5 "$@" || builtin printf "$@"'
  ble/function#push caller 'builtin caller ${1+"$(($1+6))"}'
  ble/term/leave-for-widget
  if [[ :$opts: == *:keep-stdin:* ]]; then
    ble/function#advice/do >&"${_ble_util_fd_tty_stdout:-1}" 2>&"${_ble_util_fd_tty_stderr:-2}"
  else
    ble/function#advice/do >&"${_ble_util_fd_tty_stdout:-1}" 2>&"${_ble_util_fd_tty_stderr:-2}" <&"${_ble_util_fd_tty_stdin:-0}"
  fi
  ble/term/enter-for-widget
  ble/function#pop caller
  ble/function#pop printf
  ble/function#pop bind
  ble/textarea#invalidate

  # 単一候補生成の場合は他の候補 (sabbrev 等) を消去して単一確定させる
  if ((ADVICE_EXIT==0&&${#COMPREPLY[@]}==1)); then
    compopt -o ble/no-default
    ble/complete/candidates/clear
    [[ $old_cand_count ]] &&
      ! ble/variable#is-global old_cand_count &&
      old_cand_count=0
  fi
}

_ble_contrib_fzf_adjust_dynamic_completion=
function ble/contrib/integration:fzf/handle_dynamic_completion.advice {
  if [[ ${_ble_attached-} && ${_ble_contrib_fzf_comp_words_raw-} ]]; then
    compopt +o ble/syntax-raw
    local _ble_contrib_fzf_comp_words_raw=
    local COMP_LINE COMP_POINT COMP_WORDS COMP_CWORD
    ble/util/restore-vars val_ COMP_LINE COMP_POINT COMP_WORDS COMP_CWORD
  fi

  if [[ ${_ble_attached-} && $_ble_contrib_fzf_adjust_dynamic_completion ]]; then
    local comp_func=_fzf_orig_completion_${ADVICE_WORDS[1]} comp_prog=
    local comp_func=${!comp_func}
    local comp_func=${comp_func##*#}
    if ble/bin#has "$comp_func"; then
      ble/complete/progcomp/adjust-third-party-completions
    fi
  fi

  ble/function#advice/do

}
