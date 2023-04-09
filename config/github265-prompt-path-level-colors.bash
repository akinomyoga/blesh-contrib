# blesh-contrib/config/github265-prompt-path-level-colors.bash (C) 2022, Koichi Murase <myoga.murase@gmail.com>
#
# Example:
#
#   ble-import /config/github265-prompt-path-level-colors
#   PS1='[\u@\h \q{github265/pwd}]\$ '
#
_ble_contrib_config_github265_pwd_gspecs=(fg=27 fg=57 fg=141 fg=63)

function ble/prompt/backslash:github265/pwd {
  ble/prompt/unit/add-hash '$PWD'
  ble/prompt/.update-working-directory
  local str=$prompt_cache_wd

  local -a dirs=()
  while ble/string#match "$str" '^([^/]*/|[^/]+$)'; do
    ble/array#push dirs "$BASH_REMATCH"
    str=${str:${#BASH_REMATCH}}
  done

  local count=${#dirs[@]}
  local n=${#_ble_contrib_config_github265_pwd_gspecs[@]} index ret
  for dir in "${dirs[@]}"; do
    ((index=--count,index<n||(index=n-1)))
    ble/prompt/process-prompt-string "\g{${_ble_contrib_config_github265_pwd_gspecs[index]}}"
    ble/prompt/.escape-control-characters "$dir"
    ble/prompt/print "$ret"
  done
  ble/prompt/print "$_ble_term_sgr0"
  return 0
}
