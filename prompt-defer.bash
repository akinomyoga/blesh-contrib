# blesh/contrib/prompt-defer.bash (C) 2021, akinomyoga

function ble/contrib/prompt-defer/.worker {
  local prefix=$1
  local tmpfile=$_ble_base_run/$$.prompt.defer.$prefix
  ble/contrib/prompt-defer:"$prefix"/worker
  ble/util/put "$?" >| "$tmpfile"
}

function ble/contrib/prompt-defer/.finalize {
  local prefix=$1
  local tmpfile=$_ble_base_run/$$.prompt.defer.$prefix
  ble/util/set "${prefix}_DEFER_bgpid" ''

  local ext
  ble/util/readfile ext "$tmpfile"
  ble/util/setexit "$ext"
  ble/contrib/prompt-defer:"$prefix"/callback

  local ret; ble/util/clock
  ble/util/set "${prefix}_DEFER_clock" "$ret"
}

function ble/contrib/prompt-defer/clear {
  local prefix=$1 script='
    [[ $PREFIX_DEFER_bgpid ]] &&
      builtin kill -9 "$PREFIX_DEFER_bgpid" &>/dev/null
    PREFIX_DEFER_index=
    PREFIX_DEFER_hash1=
    PREFIX_DEFER_hash2=
    PREFIX_DEFER_clock=
    PREFIX_DEFER_bgpid='
  builtin eval -- "${script//PREFIX/$prefix}"
}

## @fn ble/contrib/prompt-defer/submit prefix [hash1] [hash2] [opts]
##   @param[in] prefix
##     関連変数の接頭辞を指定します。
##
##     @fn ble/comtrib/prompt-defer:$prefix/clear
##       これまでに取得した情報を初期化します。後述の hash1 が前回の呼
##       び出しと異なる際に親シェルで呼び出されます。
##
##     @fn ble/comtrib/prompt-defer:$prefix/worker
##       バックグラウンドの別プロセスで実行する処理を記述します。bash
##       4.0 以降ではサブシェルで呼び出されます。bash 4.0 未満では非同
##       期に処理できない為、親シェルで実行されます。
##
##     @fn ble/comtrib/prompt-defer:$prefix/callback
##       バックグラウンドの処理が完了した時に親シェルで呼び出される関
##       数です。$? に worker の終了ステータスが設定された状態で呼び出
##       されます。
##
##     @var[internal] ${prefix}_DEFER_index
##     @var[internal] ${prefix}_DEFER_hash1
##     @var[internal] ${prefix}_DEFER_hash2
##     @var[internal] ${prefix}_DEFER_clock
##     @var[internal] ${prefix}_DEFER_bgpid
##       内部で使用する変数です。
##
##   @param[in] hash1
##     この値が前回の呼び出しと異なる時に強制的に情報の更新を行います。
##
##   @param[in] hash2
##     この値が前回の呼び出しと異なりかつ前回の呼び出しから十分時間が
##     経っている時に情報の更新を行います。
##
##   @param[in,opt] opts
##     コロン区切りのオプションです。
##
##     cooling=NUM
##       ミリ秒(整数)で情報のタイムアウトを指定します。プロンプト番号
##       または hash2 が前回と異なりかつ此処で指定した時間経過している
##       場合に再度情報更新を行います。
##
##     cooling-lines=NUM
##       プロンプト更新回数を指定します。プロンプト番号が此処で指定し
##       た回数以上変化している場合に再度情報更新を行います。
##
##     expires[=NUM]
##       ミリ秒(整数)で情報のタイムアウトを指定します。プロンプト更新
##       の際に指定した時間経過している場合、強制的に情報更新を行いま
##       す。既定値は 60000 (1分) です。
##
##     sync=NUM
##       ミリ秒(整数)で同期的な情報取得のタイムアウトを指定します。
##
function ble/contrib/prompt-defer/submit {
  local prefix=$1 opts=$4
  local tmpfile=$_ble_base_run/$$.prompt.defer.$prefix
  local rbgpid=${prefix}_DEFER_bgpid

  local opt_cooling=1000 opt_expires=none opt_nprompt=10 opt_sync=5 ret
  ble/opts#extract-last-optarg "$opts" cooling && opt_cooling=$ret
  ble/opts#extract-last-optarg "$opts" cooling-lines && opt_nprompt=$ret
  ble/opts#extract-last-optarg "$opts" expires 60000 && opt_expires=$ret
  ble/opts#extract-last-optarg "$opts" sync 60000 && opt_sync=$ret

  local oindex=${prefix}_DEFER_index; oindex=${!oindex-}
  local ohash1=${prefix}_DEFER_hash1; ohash1=${!ohash1-}
  local ohash2=${prefix}_DEFER_hash2; ohash2=${!ohash2-}
  local oclock=${prefix}_DEFER_clock; oclock=${!oclock-}

  local nindex=$_ble_prompt_version
  local nhash1=${2-done} # 強制 update を誘起する hashref
  local nhash2=${3-done} # 

  local update=
  if [[ $nhash1 != "$ohash1" ]]; then
    update=1
    ble/contrib/prompt-defer:"$prefix"/clear
  elif [[ ! ${!rbgpid} ]]; then
    if [[ $nindex:$nhash2 != "$oindex:$ohash2" ]]; then
      if ((nindex<=oindex-opt_nprompt||oindex+opt_nprompt<=nindex)) || { local ret; ble/util/clock; ((ret>=oclock+opt_cooling)); }; then
        update=1
      fi
    elif [[ $opt_expires && $opt_expires != none ]]; then
      if local ret; ble/util/clock; ((ret>=oclock+opt_expires)); then
        update=1
      fi
    fi
  fi

  if [[ $update ]]; then
    ble/util/set "${prefix}_DEFER_index" "$nindex"
    ble/util/set "${prefix}_DEFER_hash1" "$nhash1"
    ble/util/set "${prefix}_DEFER_hash2" "$nhash2"

    if ble/is-function ble/util/idle.push; then
      if [[ ${!rbgpid} ]]; then
        builtin kill -9 "${!rbgpid}" &>/dev/null
        ble/util/idle.cancel "ble/contrib/prompt-defer/.finalize $prefix"
        ble/util/set "$rbgpid" ''
      fi

      >| "$tmpfile"
      ble/util/set "$rbgpid" "$(ble/util/nohup 'ble/contrib/prompt-defer/.worker $prefix' print-bgpid)"
      ((opt_sync>0)) && ble/util/msleep "$opt_sync"
      if [[ -s $tmpfile ]]; then
        ble/contrib/prompt-defer/.finalize "$prefix"
      else
        ble/util/idle.push -F "$tmpfile" "ble/contrib/prompt-defer/.finalize $prefix"
      fi

    else
      ble/contrib/prompt-defer:"$prefix"/worker
      ble/contrib/prompt-defer:"$prefix"/callback
    fi
  fi
}
