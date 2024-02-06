# ble/contrib/integration/nix-completion.bash (C) 2023, akinomyoga

[[ $- == *i* ]] || return 0

function ble/contrib/integration:nix-completion/_complete_nix.advice {
  if [[ ${_ble_attached-} && " ${FUNCNAME[*]} " == *" ble/complete/progcomp/.compgen "* && ${COMP_WORDS[0]-} != *[\'\"\\]* ]]; then
    local _ble_nix_cmd=${COMP_WORDS[0]-nix} ret
    ble/function#push "$_ble_nix_cmd" '
      local IFS=$_ble_term_IFS
      local -a args; args=("$@")
      ble/util/conditional-sync "exec $_ble_nix_cmd \"\${args[@]}\"" \
        "! ble/complete/check-cancel <&$_ble_util_fd_tui_stdin" 128 progressive-weight:killall'
    ble/function#advice/do
    ble/function#pop "$_ble_nix_cmd"
  else
    ble/function#advice/do
    return 0
  fi
}

function ble/contrib/integration:nix-completion/adjust {
  if ble/is-function _complete_nix; then
    ble/function#advice around _complete_nix ble/contrib/integration:nix-completion/_complete_nix.advice
  fi
}

ble/contrib/integration:nix-completion/adjust
