# ble/contrib/fzf-completion.bash (C) 2020-2021, akinomyoga

ble-import contrib/fzf-initialize

[[ $- == *i* ]] || return 0

# fzf/shell/completion.bash を未ロードの時のみロードする
if ! ble/is-function _fzf_complete; then
  if [[ -f $_ble_contrib_fzf_base/completion.bash ]]; then
    source "$_ble_contrib_fzf_base/completion.bash"
  elif [[ -f $_ble_contrib_fzf_base/shell/completion.bash ]]; then
    source "$_ble_contrib_fzf_base/shell/completion.bash"
  elif [[ $_ble_contrib_fzf_base == */share/fzf && -f /etc/bash_completion.d/fzf ]]; then
    source /etc/bash_completion.d/fzf
  fi
fi

# clear blesh completer for cd
blehook/eval-after-load complete 'unset -f ble/cmdinfo/complete:cd'

# patch fzf functions
ble/function#advice around __fzf_generic_path_completion _fzf_complete.advice
ble/function#advice around _fzf_complete                 _fzf_complete.advice
ble/function#advice around _fzf_complete_kill            _fzf_complete.advice
function _fzf_complete.advice {
  if [[ ! $_ble_attached ]]; then
    ble/function#advice/do
    return
  fi

  [[ :$comp_type: == *:auto:* || :$comp_type: == *:[maA]:* ]] && return
  compopt -o noquote -o ble/syntax-raw
  COMP_WORDS=("${comp_words[@]}") COMP_CWORD=$comp_cword
  COMP_LINE=$comp_line COMP_POINT=$comp_point
  ble/function#push printf '[[ $1 == "\e[5n" ]] || builtin printf "$@"'
  ble/term/leave-for-widget
  ble/function#advice/do <> /dev/tty >&0 2>&0
  ble/term/enter-for-widget
  ble/function#pop printf
  ble/textarea#invalidate

  # 単一候補生成の場合は他の候補 (sabbrev 等) を消去して単一確定させる
  if ((ADVICE_EXIT==0&&${#COMPREPLY[@]}==1)); then
    ble/complete/candidates/clear
    [[ $old_cand_count ]] &&
      ! ble/variable#is-global old_cand_count &&
      old_cand_count=0
  fi
}
