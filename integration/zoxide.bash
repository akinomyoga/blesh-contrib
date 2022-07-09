# ble/contrib/integration/zoxide.bash (C) 2022, akinomyoga

function ble/contrib:integration/zoxide/_z.advice {
  if [[ ! $_ble_attached ]]; then
    ble/function#advice/do
    return
  fi

  [[ :$comp_type: == *:auto:* || :$comp_type: == *:[maA]:* ]] && return
  compopt -o noquote

  ble/term/leave-for-widget
  ble/function#advice/do >/dev/null
  ble/term/enter-for-widget
  ble/textarea#invalidate

  # 単一候補生成の場合は他の候補 (sabbrev 等) を消去して単一確定させる
  if ((ADVICE_EXIT==0&&${#COMPREPLY[@]}==1)); then
    ble/complete/candidates/clear
    [[ $old_cand_count ]] &&
      ! ble/variable#is-global old_cand_count &&
      old_cand_count=0
  fi
}

function ble/contrib:integration/zoxide/adjust {
  ble/function#advice around _z ble/contrib:integration/zoxide/_z.advice
}

if ! ble/bin#has _z; then
  ble/bin#has zoxide || return 1
  builtin eval -- "$(zoxide init bash)"
fi
ble/contrib:integration/zoxide/adjust
