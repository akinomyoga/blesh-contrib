# blesh/contrib/histdb (C) 2023, Koichi Murase <myoga.murase@gmail.com>

ble/util/assign _ble_histdb_sqlite3 'builtin type -P sqlite3 2>/dev/null'
if [[ ! -x $_ble_histdb_sqlite3 ]]; then
  ble/util/print 'contrib/histdb: "sqlite3" is required for this module.' >&2
  return 1
fi

ble-import util.bgproc

_ble_histdb_version=3

#------------------------------------------------------------------------------
# histdb_remarks

bleopt/declare -v histdb_remarks 'git: \q{contrib/histdb-remarks-git}'

_ble_histdb_remarks_data=()
function ble/prompt/unit:_ble_histdb_remarks/update {
  ble/prompt/unit/add-hash '$bleopt_histdb_remarks'
  ble/prompt/unit:{section}/update _ble_histdb_remarks "$bleopt_histdb_remarks" no-trace
}

## @fn ble/histdb/.get-remarks
##   @var[out] remarks
function ble/histdb/.get-remarks {
  remarks=
  if [[ $bleopt_histdb_remarks ]]; then
    local ret
    ble/prompt/unit#update _ble_histdb_remarks "$bleopt_histdb_remarks"
    ble/prompt/unit:{section}/get _ble_histdb_remarks
    remarks=$ret
  fi
}

function ble/prompt/backslash:contrib/histdb-remarks-git {
  ble-import prompt-git

  function ble/prompt/backslash:contrib/histdb-remarks-git {
    local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
    ble/contrib/prompt-git/initialize || return 0
    ble/contrib/prompt-git/update-head-information
    local state; ble/contrib/prompt-git/get-state
    local dirty_mark; ble/contrib/prompt-git/get-dirty-mark

    local path=${git_base%.git}
    path=${path%/}
    path=${path##*?/}
    [[ $PWD == "$git_base"/?* ]] &&
      path="$path/${PWD#$git_base/}"

    ble/prompt/print "git: ${branch:-(detached)} ${hash:-(orphan)}$dirty_mark${state:+ $state} @ ${path:-/}"
  } && "$FUNCNAME"
}

#------------------------------------------------------------------------------
# background sqlite3 process

bleopt/declare -v histdb_ignore ''
bleopt/declare -v histdb_file ''

function ble/histdb/.get-filename {
  local basename=${bleopt_histdb_file%.sqlite3}
  local hostname=${HOSTNAME:-$_ble_base_env_HOSTNAME}
  hostname=${hostname//'/'/'%'} # filename cannot contian /
  ret=${basename:-$_ble_base_state/history}${hostname:+@$hostname}.sqlite3
}

## @var _ble_histdb_file
_ble_histdb_file=

## @arr _ble_histdb_bgproc=(fd_response fd_request - bgpid)
##
_ble_histdb_bgproc=()
_ble_histdb_bgproc_fname=()
_ble_histdb_timeout=5000
_ble_histdb_keepalive=1800 # sec

function ble/histdb/escape-for-sqlite-glob {
  ret=$1
  if [[ $ret == *["[*?"]* ]]; then
    local a b
    for a in '[' '*' '?'; do
      b=[$a] ret=${ret//"$a"/"$b"}
    done
  fi
}

function ble/histdb/sqlite3.flush {
  if [[ ${_ble_histdb_bgproc[0]} && _ble_bash -ge 40000 ]]; then
    local line IFS=
    ble/bash/read-timeout 0.001 -r -d '' line <&"${_ble_histdb_bgproc[0]}"
  fi
}
function ble/histdb/sqlite3.request {
  ble/histdb/sqlite3.open
  if [[ ${_ble_histdb_bgproc[1]} ]]; then
    ble/histdb/sqlite3.flush
    ble/util/print "$1" >&"${_ble_histdb_bgproc[1]}"
  else
    [[ $1 == .exit ]] && return 0
    "$_ble_histdb_sqlite3" -quote "$_ble_histdb_file" ".timeout $_ble_histdb_timeout" "$1"
  fi
}

function ble/histdb/read-single-value {
  local line nl=$'\n' q=\' qq=\'\' Q="'\''"
  local IFS=
  if ble/bash/read line && [[ $line == \'* ]]; then
    local out=$line ext=0
    while ((ext==0)) && ! ble/string#match "$out" '^'"$q"'([^'\'']|'"$qq"')*'"$q"'$'; do
      ble/bash/read line; ext=$?
      out=$out$nl$line
    done
    line=$out
  fi
  line=${line#$q}
  line=${line%$q}
  line=${line//$qq/$q}
  line=$q${line//$q/$Q}$q
  ble/util/print "ret=$line"
}

function ble/histdb/sqlite3.request-single-value {
  local query=$1 opts=$2
  ble/histdb/sqlite3.open
  if [[ ${_ble_histdb_bgproc[1]} && _ble_bash -ge 40000 ]]; then
    ble/histdb/sqlite3.flush
    ble/util/print "$query" >&"${_ble_histdb_bgproc[1]}"

    local sync_command='ble/histdb/read-single-value <&"${_ble_histdb_bgproc[0]}"'
    local sync_condition='((sync_elapsed<200)) || ! ble/complete/check-cancel'
    local sync_opts=progressive-weight
    [[ :$opts: == *:auto:* && $bleopt_complete_timeout_auto ]] &&
      sync_opts=$sync_opts:timeout=$((bleopt_complete_timeout_auto))
    ble/util/assign ret 'ble/util/conditional-sync "$sync_command" "$sync_condition" "" "$sync_opts"' &>/dev/null; local ext=$?
    builtin eval -- "$ret"
    ((ext==142)) && ext=148
    return "$ext"
  else
    local out q=\' qq=\'\'
    ble/util/assign out '"$_ble_histdb_sqlite3" -quote "$_ble_histdb_file" ".timeout $_ble_histdb_timeout" "$query"'
    out=${out#$q}
    out=${out%$q}
    ret=${out//$qq/$q}
  fi
}

function ble/histdb/sqlite3.proc {
  exec "$_ble_histdb_sqlite3" -quote -cmd "-- [ble: $BLE_SESSION_ID]" "$_ble_histdb_file"
}

_ble_histdb_keepalive_enabled=
ble/is-function ble/util/idle.push &&
  _ble_histdb_keepalive_enabled=1

## @fn ble/histdb/sqlite3.open
##   @var[ref] _ble_histdb_file
##   @arr[out] _ble_histdb_bgproc
##   @arr[out] _ble_histdb_bgproc_fname
function ble/histdb/sqlite3.open {
  if [[ $_ble_histdb_file ]]; then
    # background process に依らないモードの時は OK
    ble/util/bgproc#opened _ble_histdb || return 0

    ble/util/bgproc#alive _ble_histdb; local state=$?
    if ((state==0)); then
      ble/util/bgproc#keepalive _ble_histdb
      return 0
    else
      if ((state==3)); then
        # background process が死んでいる時は再度開き直す。
        ble/util/print 'histdb: background sqlite3 is inactive.' >&2
      fi
      ble/util/bgproc#start _ble_histdb
      return "$?"
    fi
  fi

  local ret; ble/histdb/.get-filename
  _ble_histdb_file=$ret

  local session_id=$_ble_base_session
  local start_time=${session_id%%/*}

  IFS=, builtin eval 'local groups="${GROUPS[*]}"'
  local user=${USER:-$_ble_base_env_USER}
  local hostname=${HOSTNAME:-$_ble_base_env_HOSTNAME}

  local screen_info= ssh_info=
  [[ $STY ]] && screen_info="$STY $WINDOW"
  [[ $SSH_TTY ]] && ssh_info="$SSH_TTY $SSH_CONNECTION"

  local bgproc_opts=owner-close-on-unload:kill-timeout=60000
  [[ $_ble_histdb_keepalive_enabled ]] &&
    bgproc_opts=$bgproc_opts:timeout=$((_ble_histdb_keepalive*1000))
  if ble/util/bgproc#open _ble_histdb ble/histdb/sqlite3.proc "$bgproc_opts"; (($?!=0&&$?!=3)); then
    # Note: システムが元々サポートしていない場合 ($? == 3) はエラーメッセージは
    # 出さない。
    local msg='[ble histdb: background sqlite3 failed to start]'
    ble/util/print "${_ble_term_setaf[9]}$msg$_ble_term_sgr0" >&2
  fi

  local ret q=\' qq=\'\'
  ble/histdb/sqlite3.request-single-value "
    BEGIN IMMEDIATE TRANSACTION;
    CREATE TABLE IF NOT EXISTS misc(key TEXT PRIMARY KEY, value INTEGER);
    INSERT OR IGNORE INTO misc values('version', $_ble_histdb_version);
    CREATE TABLE IF NOT EXISTS sessions(
      session_id TEXT PRIMARY KEY, pid INTEGER, ppid INTEGER,
      hostname TEXT, user TEXT, uid INTEGER, euid INTEGER, groups TEXT,
      start_time INTEGER, start_wd TEXT,
      bash_path TEXT, bash_version TEXT, shlvl INTEGER,
      blesh_path TEXT, blesh_version TEXT,
      term TEXT, lang TEXT, display TEXT, screen_info TEXT, ssh_info TEXT,
      tty TEXT, last_time INTEGER, last_wd TEXT);
    CREATE TABLE IF NOT EXISTS command_history(
      session_id TEXT, command_id INTEGER,
      lineno INTEGER, history_index INTEGER,
      command TEXT, cwd TEXT, inode INTEGER, issue_time INTEGER,
      status             INTEGER,
      pipestatus         TEXT,
      lastarg            TEXT,
      bgpid              INTEGER,
      exec_time          INTEGER,
      exec_time_beg      INTEGER,
      exec_time_end      INTEGER,
      exec_time_real     INTEGER,
      exec_time_usr      INTEGER,
      exec_time_sys      INTEGER,
      exec_time_cpu      INTEGER,
      exec_time_usr_self INTEGER,
      exec_time_sys_self INTEGER,
      exec_time_usr_chld INTEGER,
      exec_time_sys_chld INTEGER,
      remarks            TEXT,
      PRIMARY KEY (session_id, command_id));
    CREATE TABLE IF NOT EXISTS words(
      word TEXT PRIMARY KEY, count INTEGER, ctime INTEGER, mtime INTEGER);
    INSERT OR IGNORE INTO
      sessions(
        session_id, pid, ppid,
        hostname, user, uid, euid, groups,
        start_time, start_wd,
        bash_path, bash_version, shlvl,
        blesh_path, blesh_version,
        term, lang, display, screen_info, ssh_info,
        tty)
      VALUES(
        '${session_id//$q/$qq}', '${$//$q/$qq}', '${PPID//$q/$qq}',
        '${hostname//$q/$q}', '${user//$q/$qq}', '${UID//$q/$qq}', '${EUID/$q/$qq}', '${groups//$q/$qq}',
        '${start_time//$q/$qq}', '${PWD//$q/$qq}',
        '${BASH//$q/$qq}', '${BASH_VERSION//$q/$qq}', '${SHLVL//$q/$qq}',
        '${_ble_base_blesh//$q/$qq}', '${BLE_VERSION//$q/$qq}',
        '${TERM//$q/$qq}', '${LANG//$q/$qq}', '${DISPLAY//$q/$qq}', '${screen_info//$q/$qq}', '${ssh_info//$q/$qq}',
        '${_ble_prompt_const_l//$q/$qq}');
    COMMIT;
    SELECT VALUE FROM misc WHERE key = 'version';"
  local version=$ret

  if [[ $version ]] && ((version<_ble_histdb_version)); then
    local query=
    ((version<2)) &&
      query=$query$_ble_term_nl"ALTER TABLE command_history ADD COLUMN inode INTEGER;"
    ((version<3)) &&
      query=$query$_ble_term_nl"ALTER TABLE command_history ADD COLUMN remarks TEXT;"
    query=$query$_ble_term_nl"UPDATE misc SET value = $_ble_histdb_version WHERE key = 'version';"
    ble/histdb/sqlite3.request "$query"
  fi
}

function ble/util/bgproc/onstart:_ble_histdb {
  ble/util/bgproc#post _ble_histdb ".timeout $_ble_histdb_timeout"
}

function ble/util/bgproc/onstop:_ble_histdb {
  ble/util/bgproc#post _ble_histdb '.exit'
}

function ble/histdb/sqlite3.close {
  [[ $_ble_histdb_file ]] || return 0
  local session_id=$_ble_base_session ret
  ble/util/time; local time=$ret
  ble/histdb/sqlite3.request "
    UPDATE sessions SET
      last_time = '${time//$q/$qq}',
      last_wd = '${PWD//$q/$qq}'
      WHERE session_id = '${session_id//$q/$qq}';"

  ble/util/bgproc#close _ble_histdb
  _ble_histdb_file=
}

_ble_histdb_exec_ignore=()
_ble_histdb_exec_cwd=
_ble_histdb_exec_cwd_inode=

function ble/histdb/update-cwd-inode {
  [[ $PWD == "$_ble_histdb_exec_cwd" ]] && return 0

  _ble_histdb_exec_cwd=$PWD
  _ble_histdb_exec_cwd_inode=
  if local ret; ble/file#inode "$PWD" && ble/string#match "$ret" '^[0-9]+$'; then
    _ble_histdb_exec_cwd_inode=$ret
  fi
}

function ble/histdb/collect-words.proc {
  [[ $wtype && ! ${wtype//[0-9]} ]] &&
    ble/array#push collect_words "${_ble_edit_str:wbeg:wlen}"
}
function ble/histdb/collect-words {
  ble-edit/content/update-syntax
  local -a collect_words=()
  ble/syntax/tree-enumerate-in-range 0 "${#_ble_edit_str}" ble/histdb/collect-words.proc
  ble/array#reverse collect_words

  ret=()
  local word
  "${_ble_util_set_declare[@]//NAME/mark}" # WA #D1570 checked
  for word in "${collect_words[@]}"; do
    # Note (#D1958): Even if the same words appeared in a single command, we
    #   only count 1 for one command.  This is because the "words" table is
    #   used for the word completion, where the count is used as an importance
    #   measure.  We count the number of commands where the word appears
    #   because the same word can easily appear in a single command multiple
    #   times.
    ble/set#contains mark "$word" && return 0

    ble/set#add mark "$word"
    ble/array#push ret "$word"
  done
}

## @fn ble/histdb/exec_register.hook command
##   @var[in] command_id
##   @var[in] lineno
##     これらの変数は exec_register の側で用意される。
function ble/histdb/exec_register.hook {
  local command=$1
  if [[ $bleopt_histdb_ignore ]]; then
    local patterns pattern
    ble/string#split patterns : "$bleopt_histdb_ignore"
    for pattern in "${patterns[@]}"; do
      if [[ $command == $pattern ]]; then
        _ble_histdb_exec_ignore[command_id]=1
        return 0
      fi
    done
  fi
  builtin unset -v '_ble_histdb_exec_ignore[command_id]'

  local q=\' qq=\'\'
  local session_id=$_ble_base_session ret
  ble/util/time; local issue_time=$ret

  # @var history_index ... history index: The current command might not be
  # registered to the command history, but we always pick up the index of the
  # last entry because there is no way to check it reliably.  We could compare
  # the top element with BASH_COMMAND, but the history entry might be
  # transformed by HISTCONTROL=strip, etc.
  local history_index; ble/history/get-count -v history_index
  ((history_index++))

  # Expand "bleopt histdb_remarks"
  local remarks
  ble/histdb/.get-remarks

  local ret word extra_query=
  ble/histdb/collect-words
  for word in "${ret[@]}"; do
    extra_query=$extra_query"INSERT OR REPLACE INTO words(word, count, ctime, mtime)
      VALUES('${word//$q/$qq}',
      coalesce((SELECT count FROM words WHERE word = '${word//$q/$qq}'), 0) + 1,
      coalesce((SELECT ctime FROM words WHERE word = '${word//$q/$qq}'), $issue_time),
      $issue_time);"
  done

  ble/histdb/update-cwd-inode
  local inode=$_ble_histdb_exec_cwd_inode

  ble/histdb/sqlite3.request "
    BEGIN IMMEDIATE TRANSACTION;
    UPDATE sessions SET
      last_time = '${issue_time//$q/$qq}',
      last_wd = '${PWD//$q/$qq}'
      WHERE session_id = '${session_id//$q/$qq}';
    -- Update duplicate command_id
    UPDATE command_history SET
      command_id = min(0, (SELECT command_id FROM command_history WHERE session_id = '${session_id//$q/$qq}')) - 1
      WHERE session_id = '${session_id//$q/$qq}' AND command_id = $command_id;
    -- Add command_history entry
    INSERT INTO command_history(
        session_id, command_id,
        lineno, history_index,
        command, cwd, inode, issue_time, remarks)
      VALUES(
        '${session_id//$q/$qq}', '${command_id//$q/$qq}',
        '${lineno//$q/$qq}', '${history_index//$q/$qq}',
        '${command//$q/$qq}', '${PWD//$q/$qq}', ${inode:-None}, '${issue_time//$q/$qq}', '${remarks//$q/$qq}');
    $extra_query
    COMMIT;"
}

function ble/histdb/postexec.hook {
  local session_id=$_ble_base_session
  local command_id=$_ble_edit_exec_command_id
  if [[ ${_ble_histdb_exec_ignore[command_id]+set} ]]; then
    builtin unset -v '_ble_histdb_exec_ignore[command_id]'
    return 0
  fi

  local ret
  ble/util/time; local last_time=$ret

  IFS=, builtin eval 'local pipestatus="${_ble_edit_exec_PIPESTATUS[*]}"'
  local lastarg=$_ble_edit_exec_lastarg
  ((${#lastarg}>=1000)) && lastarg=${lastarg::997}...

  local real=$_ble_exec_time_tot
  local usr=$_ble_exec_time_usr
  local sys=$_ble_exec_time_sys
  local cpu=$((real>0?(usr+sys)/real:0))
  local usr_chld=$((usr-_ble_exec_time_usr_self))
  local sys_chld=$((sys-_ble_exec_time_sys_self))

  local q=\' qq=\'\'
  ble/histdb/sqlite3.request "
    UPDATE sessions SET
      last_time = '${last_time//$q/$qq}',
      last_wd = '${PWD//$q/$qq}'
      WHERE session_id = '${session_id//$q/$qq}';
    UPDATE command_history SET
      status             = '${_ble_edit_exec_lastexit//$q/$qq}',
      pipestatus         = '${pipestatus//$q/$qq}',
      lastarg            = '${lastarg//$q/$qq}',
      bgpid              = '${!//$q/$qq}',
      exec_time          = '${_ble_exec_time_ata//$q/$qq}',
      exec_time_beg      = '${_ble_exec_time_beg//$q/$qq}',
      exec_time_end      = '${_ble_exec_time_end//$q/$qq}',
      exec_time_real     = '${real//$q/$qq}',
      exec_time_usr      = '${usr//$q/$qq}',
      exec_time_sys      = '${sys//$q/$qq}',
      exec_time_cpu      = '${cpu//$q/$qq}',
      exec_time_usr_self = '${_ble_exec_time_usr_self//$q/$qq}',
      exec_time_sys_self = '${_ble_exec_time_sys_self//$q/$qq}',
      exec_time_usr_chld = '${usr_chld//$q/$qq}',
      exec_time_sys_chld = '${sys_chld//$q/$qq}'
      WHERE session_id = '${session_id//$q/$qq}' AND command_id = $command_id;"
}

function ble/histdb/backup {
  local file=$1
  ble/bin#freeze-utility-path -n gzip || return 1

  local backup=${file%.sqlite3}.backup.sqlite3 q=\' qq=\'\'
  if [[ -s $backup.gz ]]; then
    # If there is already an up-to-date backup file, we skip the backup.
    local ret now
    ble/util/time; now=$ret
    ble/file#mtime "$backup.gz" || return 1
    ((now>ret+24*3600)) || return 1
  fi

  "$_ble_histdb_sqlite3" "$file" \
    ".timeout $_ble_histdb_timeout" \
    "PRAGMA quick_check;" \
    ".backup '${backup//$q/$qq}'" \
    "ATTACH DATABASE '${backup//$q/$qq}' AS backup;
    PRAGMA backup.quick_check;" >/dev/null &&
    ble/bin/gzip -c "$backup" >| "$backup.gz.part" &&
    [[ -s $backup.gz.part ]] &&
    ble/bin/mv -f "$backup.gz.part" "$backup.gz" &&
    ble/bin/rm -f "$backup"
}

function ble/histdb/unload.hook {
  if [[ $_ble_histdb_file ]]; then
    local file=$_ble_histdb_file
    ble/histdb/sqlite3.close
    ble/histdb/backup "$file"
  fi
}

# 設定が変化して記録先の history.sqlite3 のパスが変わったら現在のファイルは閉じ
# る。必要になった時に初めて新しいファイルを開く。
function ble/histdb/exec_end.hook {
  local ret; ble/histdb/.get-filename
  [[ $ret == "$_ble_histdb_file" ]] ||
    ((${#_ble_edit_exec_lines[@]})) ||
    ble/histdb/sqlite3.close
}

blehook exec_register!=ble/histdb/exec_register.hook
blehook POSTEXEC!=ble/histdb/postexec.hook
blehook exec_end!=ble/histdb/exec_end.hook
blehook unload!=ble/histdb/unload.hook

#------------------------------------------------------------------------------
# auto-complete

function ble/complete/auto-complete/source:histdb-history {
  local limit=$((bleopt_line_limit_length)) limit_condition=
  if ((limit)); then
    ((limit-=${#_ble_edit_str},limit>0)) || return 1
    limit_condition=" AND length(command) <= $limit"
  fi

  local ret
  ble/histdb/escape-for-sqlite-glob "$_ble_edit_str"; local pat=$ret?*

  ble/histdb/update-cwd-inode
  local inode=$_ble_histdb_exec_cwd_inode

  local q=\' qq=\'\'
  ble/histdb/sqlite3.request-single-value "
    SELECT coalesce(
      (SELECT command FROM (SELECT command, max(issue_time) FROM command_history WHERE command GLOB '${pat//$q/$qq}' AND cwd = '${PWD//$q/$qq}$limit_condition')),
      ${inode:+(SELECT command FROM (SELECT command, max(issue_time) FROM command_history WHERE command GLOB '${pat//$q/$qq}' AND inode = $inode$limit_condition)),}
      '');"
  [[ $ret == "$_ble_edit_str"?* ]] || return 1
  ble/complete/auto-complete/enter h 0 "${ret:${#_ble_edit_str}}" '' "$ret"
}

function ble/complete/auto-complete/source:histdb-word {
  local iN=${#_ble_edit_str}
  ((_ble_edit_ind>0)) || return 1

  local limit=$((bleopt_line_limit_length)) limit_condition=
  if ((limit)); then
    ((limit-=iN,limit>0)) || return 1
    limit_condition=" AND length(word) <= $limit"
  fi

  local -a wbegins=()
  if ((_ble_edit_ind<iN)); then
    # 行中にいる時は現在位置で完結している単語だけを対象にする。
    if [[ ${_ble_syntax_tree[_ble_edit_ind-1]} ]]; then
      local tree
      ble/string#split-words tree "${_ble_syntax_tree[_ble_edit_ind-1]}"
      local wtype=${tree[0]} wlen=${tree[1]}
      [[ $wtype && ! ${wtype//[0-9]} && wlen -ge 0 ]] &&
        ble/array#push wbegins "$((_ble_edit_ind-wlen))"
    elif local ret; ble/syntax/completion-context/.search-last-istat "$((_ble_edit_ind-1))"; then
      local istat=$ret stat wlen
      ble/string#split-words stat "${_ble_syntax_stat[istat]}"
      if (((wlen=stat[1])>=0)); then
        ble/array#push wbegins "$((istat-wlen))"
      elif [[ ${_ble_syntax_bash_command_EndWtype[stat[0]]:-} ]]; then
        # 単語の始まりの時 (_ble_syntax_bash_command_EndWtype で判定できるのかは実は非自明)
        ble/array#push wbegins "$istat"
      fi
    fi

  else
    # 閉じていない入れ子に対する列挙

    local -a stat nest tree
    ble/string#split-words stat "${_ble_syntax_stat[iN]}"
    local wlen tclen
    if (((wlen=stat[1])>=0)); then
      ble/array#push wbegins "$((iN-wlen))"
    elif (((tclen=stat[4])>=0)); then
      local wend=$((iN-tclen))
      ble/string#split-words tree "${_ble_syntax_tree[wend-1]}"
      local wtype=${tree[0]} wlen=${tree[1]}
      [[ $wtype && ! ${wtype//[0-9]} && wlen -ge 0 ]] &&
        ble/array#push wbegins "$((wend-wlen))"
    fi

    local inest=$iN nlen=${stat[3]}
    while ((nlen>0)); do
      ((inest-=nlen))
      ble/string#split-words nest "${_ble_syntax_nest[inest]}"
      (((wlen=nest[1])>=0)) &&
        ble/array#push wbegins "$((inest-wlen))"
      nlen=${nest[3]}
    done
  fi
  ((${#wbegins[@]})) || return 1

  local -a sqls=()

  local i q=\' qq=\'\'
  for i in "${wbegins[@]}"; do
    local word=${_ble_edit_str:i:_ble_edit_ind-i}
    [[ $word ]] || continue
    local ret; ble/histdb/escape-for-sqlite-glob "$word"
    local pat=$ret?*
    ble/array#push sqls "SELECT '$i:' || word FROM (SELECT word, max(mtime) FROM words WHERE word GLOB '${pat//$q/$qq}'$limit_condition)"
  done
  ((${#sqls[@]})) || return 1

  ble/array#reverse sqls
  sqls=("${sqls[@]/#/(}") # WA #D1570 checked
  sqls=("${sqls[@]/%/)}") # WA #D1570 checked
  ble/array#push sqls "''"
  IFS=, builtin eval 'local query="select coalesce(${sqls[*]});"'

  local ret
  ble/histdb/sqlite3.request-single-value "$query" auto || return 1
  [[ $ret == *:* ]] || return 1

  local index=${ret%%:*} insert=${ret#*:}
  if local comps=${_ble_edit_str:index:_ble_edit_ind-index}; [[ $insert == "$comps"* ]]; then
    local ins=${insert:_ble_edit_ind-index}
    ble/complete/auto-complete/enter c "$_ble_edit_ind" "$ins" "$insert" "$ins" "$ins" ' '
  else
    ble/complete/auto-complete/enter r "$index" " [$insert] " "$insert" "$insert" "$insert" ' '
  fi
}
ble/util/import/eval-after-load core-complete '
  ble/array#insert-before _ble_complete_auto_source history histdb-history
  ble/array#push _ble_complete_auto_source histdb-word'
[[ $_ble_histdb_keepalive_enabled ]] &&
  ble/util/idle.push ble/histdb/sqlite3.open

#------------------------------------------------------------------------------
# ble histdb command

function ble-histdb {
  if (($#==0)); then
    ble/histdb/sub:query 'select command from command_history;'
  elif ble/is-function "ble/histdb/sub:$1"; then
    "ble/histdb/sub:$@"
  else
    builtin printf 'ble-histdb: unknown command "%s"\n' "$1"
    return 2
  fi
}

# 一般的な補完のフレームワークを作っても良いのではないかという気がしてきたが、
# それは後で。
function ble/cmdinfo/complete:ble-histdb {
  if ((comp_cword==1)); then
    local ret sub
    ble/util/assign-array ret 'compgen -A function -- ble/histdb/sub:'
    ((${#ret[@]})) || return 0

    local cands
    for sub in "${ret[@]#ble/histdb/sub:}"; do
      if [[ $sub != */* && $sub == "$COMPV"* ]]; then
        ble/array#push cands "$sub"
      fi
    done

    if ((${#cands[@]})); then
      local "${_ble_complete_yield_varnames[@]/%/=}" # disable=#D1570
      ble/complete/cand/yield.initialize word
      ble/complete/cand/yield.batch word
    fi
  fi
}

function ble/histdb/sub:query {
  local ret
  ble/histdb/.get-filename; local histdb_file=$ret
  "$_ble_histdb_sqlite3" "$histdb_file" '.timeout 1000' "$@"
}

#------------------------------------------------------------------------------

function ble/histdb/count2si {
  local si
  si=('' k M G T P E Z Y R Q)

  local count=$1 i
  for ((i=0;i<${#si[@]}-1;i++,count/=1000)); do
    if ((count<1000)); then
      ret=$count${si[i]}
      return 0
    elif ((count<100000)); then
      count=${count%???}.${count:${#count}-3}
      ret=${count::4}${si[i+1]}
      return 0
    fi
  done
  ret=$count${si[${#si[@]}-1]}
}

# modified ble/contrib/prompt-elapsed/output-sec.ps
function ble/histdb/usec2s {
  local usec=${1:-0}
  if ((usec<1000)); then
    ret=${usec}us
  elif ((usec<100000)); then
    usec=${usec%???}.${usec:${#usec}-3}
    ret=${usec::4}ms
  else
    ble/histdb/msec2s "$((usec/1000))"
  fi
}

function ble/histdb/msec2s {
  local msec=${1:-0}
  if ((msec<1000)); then
    ret=${msec}ms
  elif ((msec<100000)); then
    msec=${msec%???}.${msec:${#msec}-3}
    ret=${msec::4}s
  else
    ble/histdb/sec2s "$((msec/1000))"
  fi
}

function ble/histdb/sec2s {
  local sec=${1:-0} min
  ((min=sec/60,sec%=60))
  if ((min<100)); then
    ret=${min}m${sec}s
    return 0
  fi

  local hour; ((hour=min/60,min%=60))
  if ((hour<100)); then
    ret="${hour}h:${min}m:${sec}s"
    return 0
  fi

  local day; ((day=hour/24,hour%=24))
  if ((day<365)); then
    ret="${day}d-${hour}h:${min}m"
    return 0
  fi

  local year; ((year=day/365,day%=365))
  ret="${year}y-${day}d-${hour}h"
  return 0
}

#------------------------------------------------------------------------------
# usage: ble histdb stats

bleopt/declare -v histdb_stats_items 'commands unique-commands successful-commands exec-time exec-cpu-time words sessions directories'

function ble/histdb/sub:stats/get-user-name {
  ble/bin#has git && ble/util/assign ret '
    git config user.name 2>/dev/null
  ' && [[ $ret ]] && return 0

  ble/bin#has getenv && ble/util/assign ret '
    getent passwd 2>/dev/null | ble/bin/awk -F : -v UID="$UID" '\''
      $3==UID {
        sub(/[[:space:]]*[<>].*$/, "", $5);
        print $5;
      }
    '\''
  ' && [[ $ret ]] && return 0

  ret=${USER:-$_ble_base_env_USER}@${HOSTNAME:-$_ble_base_env_HOSTNAME}
}

## @fn ble/histdb/sub:stats/where.check condition
##   @param[in] condition
##   @var[ref] where
function ble/histdb/sub:stats/where.check {
  where="${where:- WHERE}${where:+ AND} $1"
}
## @fn ble/histdb/sub:stats/where.check-datetime column
##   @param[in] column
##   @var[in] time_beg time_end
##   @var[ref] where
function ble/histdb/sub:stats/where.check-datetime {
  [[ $time_beg ]] && ble/histdb/sub:stats/where.check "$1 >= $time_beg"
  [[ $time_end ]] && ble/histdb/sub:stats/where.check "$1 < $time_end"
}

function ble/histdb/sub:stats/item:commands {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT count(*) FROM command_history$where;" ;;
  (get)
    ble/array#push names  'Total commands'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:unique-commands {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT count(*) FROM (SELECT DISTINCT command FROM command_history$where);" ;;
  (get)
    ble/array#push names  'Total unique commands'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:successful-commands {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check 'status == 0'
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT count(*) FROM (SELECT command FROM command_history$where);" ;;
  (get)
    ble/array#push names  'Total successful commands'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:sessions {
  case $1 in
  (init)
    local where=
    if [[ $time_end ]]; then
      ble/histdb/sub:stats/where.check-datetime start_time
    else
      ble/histdb/sub:stats/where.check-datetime last_time
    fi
    ble/array#push queries "SELECT count(*) FROM sessions$where;" ;;
  (get)
    ble/array#push names  'Total sessions'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:words {
  case $1 in
  (init)
    local where=
    if [[ $time_end ]]; then
      ble/histdb/sub:stats/where.check-datetime ctime
    else
      ble/histdb/sub:stats/where.check-datetime mtime
    fi
    ble/array#push queries "SELECT count(*) FROM words$where;" ;;
  (get)
    ble/array#push names  'Total distinct words'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:directories {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT count(*) FROM (SELECT DISTINCT cwd FROM command_history$where);" ;;
  (get)
    ble/array#push names  'Total directories'
    local ret
    ble/histdb/count2si "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:exec-time {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT sum(exec_time) FROM command_history$where;" ;;
  (get)
    ble/array#push names  'Total execution time'
    local ret
    ble/histdb/usec2s "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats/item:exec-cpu-time {
  case $1 in
  (init)
    local where=
    ble/histdb/sub:stats/where.check-datetime issue_time
    ble/array#push queries "SELECT sum(exec_time_usr + exec_time_sys) FROM command_history$where;" ;;
  (get)
    ble/array#push names  'Total CPU time'
    local ret
    ble/histdb/msec2s "$2"
    ble/array#push values "$ret" ;;
  esac
}

function ble/histdb/sub:stats {
  local period=${1-}

  local time_beg= time_end=

  if [[ $period ]]; then
    local ret
    if ble/string#match "$period" '^([0-9]+)([smhdMy])$'; then
      local delta=${BASH_REMATCH[1]}
      case ${BASH_REMATCH[2]} in
      (m) ((delta*=60)) ;;
      (h) ((delta*=3600)) ;;
      (d) ((delta*=3600*24)) ;;
      (M) ((delta*=3600*24*30)) ;;
      (y) ((delta*=3600*24*365)) ;;
      esac
      ble/util/time
      ((time_beg=ret-delta))
    elif ble/string#match "$period" '^2[0-9]{3}(-(0[1-9]|1[0-2])(-(0[1-9]|[12][0-9]|3[01]))?)?$'; then
      local y=${period::4} m=${BASH_REMATCH[2]-} d=${BASH_REMATCH[4]-}
      if [[ $d ]]; then
        m=${m#0} d=${d#0}
        ble/util/mktime "$y-$m-$d 00:00:00"
        time_beg=$ret
        # Note: we here assume that 01-32 is equivalent to 02-01, etc.
        ble/util/mktime "$y-$m-$((d+1)) 00:00:00"
        time_end=$ret
      elif [[ $m ]]; then
        m=${m#0}
        ble/util/mktime "$y-$m-01 00:00:00"
        time_beg=$ret
        ble/util/mktime "$((y+m/12))-$((m%12+1))-01 00:00:00"
        time_end=$ret
      else
        ble/util/mktime "$y-01-01 00:00:00"
        time_beg=$ret
        ble/util/mktime "$((y+1))-01-01 00:00:00"
        time_end=$ret
      fi
    else
      ble/util/print "ble-histdb-stats: unrecognized argument '$period'" 2>/dev/null
      return 2
    fi
  fi

  local -a queries=()
  local items item
  ble/string#split-words items "$bleopt_histdb_stats_items"
  for item in "${items[@]}"; do
    ble/histdb/sub:stats/item:"$item" init
  done

  local IFS=$_ble_term_IFS
  ble/histdb/sub:query -separator ' ' "${queries[*]}" | {
    local result
    ble/util/mapfile result

    local ret sgr0=$_ble_term_sgr0
    ble/color/gspec2sgr 'fg=27,bold'; local sgr1=$ret
    ble/histdb/sub:stats/get-user-name
    ble/util/print "$sgr1$ret's Shell Stats${period:+ ($period)}$sgr0"

    local -a names=() values=()
    local i=0
    for item in "${items[@]}"; do
      ble/histdb/sub:stats/item:"$item" get "${result[i++]}"
    done

    local name max_name_width=0
    for name in "${names[@]}"; do
      local w=$((${#name}+1))
      ((max_name_width<w)) && ((max_name_width=w))
    done

    ble/color/gspec2sgr 'bold'; local sgr2=$ret
    for i in "${!names[@]}"; do
      builtin printf '  %s%-*s    %s%s\n' "$sgr2" "$max_name_width" "${names[i]}:" "${values[i]}" "$sgr0"
    done
  }
}

#------------------------------------------------------------------------------
# lib: ble/getopts

## @fn ble/getopts/scan-definition type script
##   @param[in] type
##     Specify the type of
##
##     @fn[opt] ble/getopts/scan-definition:TYPE/label
##     @fn[opt] ble/getopts/scan-definition:TYPE/flag
##     @fn[opt] ble/getopts/scan-definition:TYPE/option
##
##   @param[in] script
##     Define the command-line interface by calling label:, flag:, and option:
##
_ble_getopts_definition_headers=(label flag option arguments)
function ble/getopts/scan-definition {
  local type=$1 def=$2 header fn
  for header in "${_ble_getopts_definition_headers[@]}"; do
    fn=ble/getopts/scan-definition:$type/$header
    if ble/is-function "$fn"; then
      ble/function#push "$header" "$fn \"\$@\""
    else
      ble/function#push "$header" '((1))'
    fi
    ble/function#push "$header" "$fn \"\$@\""
  done
  builtin eval -- "$def"
  for header in "${_ble_getopts_definition_headers[@]}"; do
    ble/function#pop "$header"
  done
}

function ble/getopts/scan-definition:parser/label {
  getopts_label=$1
}

# todo array
function ble/getopts/scan-definition:parser/option {
  local var=$1 opt=$2 q=\' Q="'\''"

  if [[ $opt == --* ]]; then
    ble/util/print NYI >&2
  elif [[ $opt == -? ]]; then
    opt=${opt:1}
    getopts_short_options=$getopts_short_options'('\'${opt//$q/$Q}\'')
      if [[ ${arg:1} ]]; then
        '$var'=${arg:1} arg=
      elif (($#)); then
        '$var'=$1
        shift
      else
        ble/util/print "$_getopts_label: missing option argument for '\''-$arg'\''" >&2
        flags=E$flags
      fi ;;
    '
  fi
}
function ble/getopts/scan-definition:parser/arguments {
  local var=${1:-args}
  getopts_arguments=$getopts_arguments'
    ble/array#push '$var' "$arg"
  '
}

function ble/getopts/generate-parser {
  local getopts_finalize=
  local getopts_initialize=
  local getopts_label=
  local getopts_long_options=
  local getopts_short_options=
  local getopts_arguments=

  ble/getopts/scan-definition parser "$2"

  if [[ ! $getopts_arguments ]]; then
    getopts_arguments='
      ble/util/print "$_getopt_label: unrecognized argument '\''$arg'\''" >&2
      flags=E$flags
    '
  fi

  local getopts_script='
    local _ble_local_set _ble_local_shopt
    ble/base/.adjust-bash-options _ble_local_set _ble_local_shopt
    local LC_ALL= LC_COLLATE=C 2>/dev/null

    local _getopts_label='$q${getopts_label//$q/$Q}$q'

    flags=
    '$getopts_initialize'
    while (($#)); do
      local arg=$1; shift
      if [[ $arg == -?* && $flags != *-* ]]; then
        if [[ $arg == --* ]]; then
          case $arg in
          (--) flags=-$flags ;;
          '$getopts_long_options'
          (*)
            ble/util/print "$_getopts_label: unrecognized long option '\''$arg'\''" >&2
            flags=E$flags ;;
          esac
        else
          arg=${arg:1}
          while [[ $arg ]]; do
            case ${arg::1} in
            '$getopts_short_options'
            (*)
              ble/util/print "$_getopts_label: unrecognized option '\''-${arg::1}'\''" >&2
              flags=E$flags ;;
            esac
            arg=${arg:1}
          done
        fi
        continue
      fi

      '$getopts_arguments'
    done
    '$getopts_finalize'

    ble/util/unlocal LC_ALL LC_COLLATE 2>/dev/null
    ble/base/.restore-bash-options _ble_local_set _ble_local_shopt
    [[ $flags != *E* ]]
  '

  builtin eval -- "function $1 { $getopts_script }"
}

#------------------------------------------------------------------------------
# lib: ble/histdb/graph

## @fn ble/histdb/graph/board/initialize
##   @arr[out] grboard_export
function ble/histdb/graph/board/initialize {
  local -a colors
  ble/histdb/graph/palette "$2"

  local mark=$1
  if [[ ! $mark ]]; then
    if ble/util/is-unicode-output; then
      mark='■'
    else
      mark='##'
    fi
  fi

  grboard_export=()
  ble/array#push grboard_export "grboard_nlevel=${#colors[@]}"

  local i ret
  for i in "${!colors[@]}"; do
    ble/color/gspec2sgr "fg=${colors[i]}"
    ble/array#push grboard_export "grboard_unit$i=$ret$mark$_ble_term_sgr0"
  done

  local ret
  ble/util/s2w "$mark"; local w=$ret
  ble/string#reserve-prototype "$w"
  ble/array#push grboard_export "grboard_unit_white=${_ble_string_prototype::w}"
}
_ble_histdb_grboard_awk_lib='
  function grboard_initialize(_, i) {
    grboard_nlevel = ENVIRON["grboard_nlevel"];
    grboard_unit[-1] = ENVIRON["grboard_unit_white"];
    for (i = 0; i < grboard_nlevel; i++)
      grboard_unit[i] = ENVIRON["grboard_unit" i];
  }
  function grboard__score2unit(score, score_max) {
    if (score == "" || score < 0)
      return grboard_unit[-1];
    else if (score == 0)
      return grboard_unit[0];
    else
      return grboard_unit[1 + int((grboard_nlevel - 1) * score / (score_max + 1))];
  }
  function grboard_render(lines, table, w, h, _, x, y, maxv, v, line) {
    maxv = 0;
    for (y = 0; y < h; y++)
      for (x = 0; x < w; x++)
        if (table[y, x] > maxv)
          maxv = table[y, x];

    for (y = 0; y < h; y++) {
      line = "";
      for (x = 0; x < w; x++) {
        v = table[y, x];
        line = line grboard__score2unit(v, maxv);
      }
      lines[y] = line;
    }
  }
'

## @fn ble/histdb/graph/vbar/initialize [palette]
##   @var[out] grvbar_declare
function ble/histdb/graph/vbar/initialize {
  local -a colors
  ble/histdb/graph/palette "$1"
  local gspec=${colors[0]}

  grvbar_declare=()

  local ret sgr1= sgr0=
  if ble/util/is-unicode-output; then
    local nlevel=8
    if [[ $gspec ]]; then
      ble/color/gspec2sgr "fg=$gspec"
      sgr1=$ret sgr0=$_ble_term_sgr0
    fi
    ble/util/c2w "$((0x2581))"; local w=$ret
    ble/array#push grvbar_declare grvbar_nlevel="$nlevel" grvbar_unit0='  '
    local i
    for ((i=1;i<=nlevel;i++)); do
      ble/util/c2s "$((0x2580+i))"
      ((w==1)) && ret=$ret$ret
      ble/array#push grvbar_declare "grvbar_unit$i=$sgr1$ret$sgr0"
    done
  else
    if [[ $gspec ]]; then
      ble/color/gspec2sgr "bg=$gspec"
      sgr1=$ret sgr0=$_ble_term_sgr0
    fi
    ble/array#push grvbar_declare grvbar_nlevel=1 grvbar_unit0='  ' grvbar_unit1="$sgr1  $sgr0"
  fi
}
_ble_histdb_grvbar_awk_lib='
  function grvbar_initialize(_, i) {
    grvbar_nlevel = ENVIRON["grvbar_nlevel"];
    grvbar_unit[-1] = ENVIRON["grvbar_unit_white"];
    for (i = 0; i <= grvbar_nlevel; i++)
      grvbar_unit[i] = ENVIRON["grvbar_unit" i];
  }
  function grvbar__score2unit(score, score_max) {
    if (score <= 0)
      return grvbar_unit[0];
    else
      return grvbar_unit[1 + int((grvbar_nlevel - 1) * score / (score_max + 1))];
  }
  function grvbar__clamp(x, l, u) {
    return x < l ? l : x > u ? u : x;
  }
  function grvbar_render(lines, list, w, h, _, x, y, maxv, line, s) {
    maxv = 0;
    for (x = 0; x < w; x++)
      if (list[x] > maxv)
        maxv = list[x];
    for (y = 0; y < h; y++) {
      line = ""
      for (x = 0; x < w; x++) {
        s = int((grvbar_nlevel * h + 1) * list[x] / (maxv + 1));
        line = line grvbar_unit[grvbar__clamp(s - y * grvbar_nlevel, 0, grvbar_nlevel)];
      }
      lines[h - 1 - y] = line;
    }
  }
'

function ble/histdb/graph/palette {
  local palette=$1

  local index=
  if ble/string#match "$palette" '\[([0-9]+)\]$'; then
    index=${BASH_REMATCH[1]}
    palette=${palette::${#palette}-${#BASH_REMATCH}}
  fi
  if [[ ! $palette ]]; then
    local ret
    ble/util/strftime -v ret '%m'
    case ${ret#0} in
    (10) palette=github-halloween ;;
    (12) palette=github-winter ;;
    (*)  palette=github-light ;;
    esac
  fi

  # https://github.com/orgs/community/discussions/7078
  case $palette in
  (github-light24)    colors=('#ebedf0' '#9be9a8' '#30c463' '#30a14e' '#216e39') ;;
  (github-dark24)     colors=('#161b22' '#0e4429' '#006d32' '#26a641' '#39d353') ;;
  (halloween-light24) colors=('#ebedf0' '#ffee4a' '#ffc501' '#fe9600' '#03001c') ;;
  (halloween-dark24)  colors=('#161b22' '#631c03' '#bd561d' '#fa7a18' '#fddf68') ;;
  (winter-light24)    colors=('#ebedf0' '#b6e3ff' '#54aeff' '#0969da' '#0a3069') ;;
  (winter-dark24)     colors=('#161b22' '#0a3069' '#0969da' '#54aeff' '#b6e3ff') ;;
  (github-light)      colors=(255 151 77 71 23) ;;
  (github-dark)       colors=(234 22 23 35 77) ;;
  (halloween-light)   colors=(255 227 220 208 232) ;;
  (halloween-dark)    colors=(234 52 130 208 221) ;;
  (winter-light)      colors=(255 153 75 26 23) ;;
  (winter-dark)       colors=(234 23 26 75 153) ;;
  (rainbow)
    colors=({196..220..6} {190..46..36}) ;;
  (rainbow2)
    colors=({16..21} {21..45..6} {51..46} {82..190..36} {220..196..6}) ;;
  (*)
    ble/string#split colors , "$z1"
  esac

  # specify one color
  if [[ $index ]]; then
    colors=("${colors[index<${#colors[@]}?index:0]}")
  fi
}

## @fn ble/histdb/graph/hbar/initialize [palette]
##   @var[out] grhbar_declare
function ble/histdb/graph/hbar/initialize {
  local -a colors
  ble/histdb/graph/palette "$1"

  grhbar_declare=()

  local -a sgr=()
  local ret
  if ble/util/is-unicode-output; then
    local nlevel=8
    if ((${#colors[@]})); then
      sgr[0]=$_ble_term_sgr0
      local color
      for color in "${colors[@]}"; do
        ble/color/gspec2sgr "fg=$color"
        ble/array#push sgr "$ret"
      done
    fi

    ble/util/c2w "$((0x2588))"; local w=$ret
    ble/array#push grhbar_declare grhbar_wfactor="$((w==1?2:1))"

    local i unit
    unit[0]=' '
    for ((i=1;i<=nlevel;i++)); do
      ble/util/c2s "$((0x2590-i))"
      ble/array#push unit "$ret"
    done

    ble/array#push grhbar_declare grhbar_unit0=' '
    for ((i=1;i<=nlevel;i++)); do
      ble/array#push grhbar_declare "grhbar_unit$i=${unit[i]}"
    done
    ble/array#push grhbar_declare grhbar_nlevel="$nlevel"
  else
    if ((${#colors[@]})); then
      sgr[0]=$_ble_term_sgr0
      local color
      for color in "${colors[@]}"; do
        ble/color/gspec2sgr "bg=$color"
        ble/array#push sgr "$ret"
      done
    fi
    ble/array#push grhbar_declare grhbar_nlevel=1 grhbar_unit0=' ' grhbar_unit1=' '
    ble/array#push grhbar_declare grhbar_wfactor=2
  fi

  local glevel=$((${#sgr[@]}-1))
  ble/array#push grhbar_declare grhbar_glevel="$glevel"
  for ((i=0;i<=glevel;i++)); do
    ble/array#push grhbar_declare "grhbar_sgr$i=${sgr[i]}"
  done
}
_ble_histdb_grhbar_awk_lib='
  function grhbar_initialize(_, i) {
    grhbar_wfactor = ENVIRON["grhbar_wfactor"];

    grhbar_nlevel = ENVIRON["grhbar_nlevel"];
    for (i = 0; i <= grhbar_nlevel; i++)
      grhbar_unit[i] = ENVIRON["grhbar_unit" i];

    grhbar_glevel = ENVIRON["grhbar_glevel"];
    if (grhbar_glevel > 0) {
      for (i = 0; i <= grhbar_glevel; i++)
        grhbar_sgr[i] = ENVIRON["grhbar_sgr" i];
    } else {
      grhbar_glevel = 0;
      grhbar_sgr[0] = "";
      grhbar_sgr[1] = "";
    }
  }
  function grhbar__score2unit(score, score_max) {
    if (score <= 0)
      return grhbar_unit[0];
    else
      return grhbar_unit[1 + int((grhbar_nlevel - 1) * score / (score_max + 1))];
  }
  function grhbar__clamp(x, l, u) {
    return x < l ? l : x > u ? u : x;
  }
  function grhbar_render(lines, list, w, h, _, x, y, maxv, line, s, sunit, color) {
    w *= grhbar_wfactor;
    maxv = 0;
    for (y = 0; y < w; y++)
      if (list[y] > maxv)
        maxv = list[y];
    for (y = 0; y < h; y++) {
      line = ""
      s = int((grhbar_nlevel * w + 1) * list[y] / (maxv + 1));
      for (x = 0; x < w; x++) {
        sunit = grhbar__clamp(s - x * grhbar_nlevel, 0, grhbar_nlevel);
        color = grhbar_sgr[sunit ? grhbar__clamp(1 + int(grhbar_glevel * x / (w - 1)), 1, grhbar_glevel): 0];
        line = line color grhbar_unit[sunit];
      }
      lines[y] = line grhbar_sgr[0];
    }
  }
'

#------------------------------------------------------------------------------
# usage: ble-histdb top [-x regex|-s regex]

function ble/histdb/sub:top/define {
  label 'ble-histdb-top'
  option exclude -x
  option has_subcommand -s
  option count -c
}
ble/getopts/generate-parser ble/histdb/sub:top/read-arguments ble/histdb/sub:top/define

function ble/histdb/sub:top {
  local flags=
  local -x exclude= has_subcommand= count=20
  ble/histdb/sub:top/read-arguments "$@" || return 2

  local grhbar_declare
  ble/histdb/graph/hbar/initialize rainbow
  local -x "${grhbar_declare[@]}" # disable=#D1566

  local ret
  ble/color/gspec2sgr 'bold'
  local -x sgr_cmd=$ret
  local -x sgr0=$_ble_term_sgr0

  ble-histdb | ble/bin/awk '
    BEGIN {
      has_subcommand = "^(" ENVIRON["has_subcommand"] ")$";
      to_exclude = "^(" ENVIRON["exclude"] ")$";
    }
    {
      sub(/^[[:space:]]+/, "");
      sub(/^\(\(?/, "& ");
      if ($1 ~ to_exclude) next;

      subcommand = "";
      if ($1 ~ has_subcommand) {
        for (i = 2; i <= NF; i++) {
          if ($i ~ /^-.+/) continue;
          subcommand = $i
          break;
        }
      }

      if (subcommand != "") {
        print $1 " " subcommand;
      } else {
        print $1;
      }
    }
  ' | ble/bin/sort | uniq -c | ble/bin/sort -nr | ble/bin/awk -v count="$count" '
    '"$_ble_histdb_grhbar_awk_lib"'
    BEGIN {
      grhbar_initialize();
      g_entry_count = 0;
      sgr_cmd = ENVIRON["sgr_cmd"];
      sgr0 = ENVIRON["sgr0"];
    }
    {
      i = g_entry_count++;
      g_score[i] = $1;
      g_command[i] = $0;
      if (g_entry_count >= count) exit;
    }
    END {
      grhbar_render(lines_hbar, g_score, 6, g_entry_count);
      for (i = 0; i < g_entry_count; i++) {
        sub(/[0-9]+ /, "&[" lines_hbar[i] "] " sgr_cmd, g_command[i]);
        print g_command[i] sgr0;
      }
    }
  '
}

#------------------------------------------------------------------------------
# usage: ble-histdb calendar
# usage: ble-histdb week

function ble/histdb/sub:calendar {
  local palette=$1

  local grboard_export
  ble/histdb/graph/board/initialize '' "$palette"
  local -x "${grboard_export[@]}" # disable=#D1566

  local grvbar_declare
  ble/histdb/graph/vbar/initialize "$palette[2]"
  local -x "${grvbar_declare[@]}" # disable=#D1566

  local awk
  if ble/is-function ble/bin/mawk; then
    awk=ble/bin/mawk
  elif ble/is-function ble/bin/gawk; then
    awk=ble/bin/mawk
  else
    printf 'ble-histdb-calendar: gawk or mawk is needed.' >&2
    return 1
  fi

  ble/histdb/sub:query -separator ' ' "SELECT strftime('%Y %j %w', issue_time, 'unixepoch', 'localtime') AS date FROM command_history;" |
    sort | uniq -c | "$awk" '
      '"$_ble_histdb_grboard_awk_lib"'
      '"$_ble_histdb_grvbar_awk_lib"'

      BEGIN {
        grboard_initialize();
        grvbar_initialize();

        split("Sun,Mon,Tue,Wed,Thu,Fri,Sat,   ", c_weekday, ",");
        split("Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec", c_month, ",");
      }
      function initialize_year(year, _, i) {
        g_year = year;
        g_year_nday = 0 + strftime("%j", mktime(year " 12 31 01 00 00"));
        g_year_wday_offset = 0 + strftime("%w", mktime(year " 01 01 01 00 00"));
        g_score_max = 0;
        g_score_total = 0;
        for (i = -g_year_wday_offset; i < g_year_nday; i++)
          g_score[i] = 0;
      }
      function flush_year(_, line, i, x, y, w, m, iday, iweek, lines, score_table, score_weekly) {
        if (g_year == "" || g_year == 1970) return;

        print "\x1b[1m# " g_year " (total = " g_score_total ", max = " g_score_max ")\x1b[m";
        print "";

        line = c_weekday[8];
        x = 0;
        for (m = 1; m <= 12; m++) {
          iday = strftime("%j", mktime(g_year sprintf(" %02d 01 01 00 00", m))) - 1;
          iweek = int((iday + g_year_wday_offset) / 7);
          line = line sprintf("%*s", iweek * 2 - x, "") c_month[m];
          x = iweek * 2 + length(c_month[m]);
        }
        print line;

        # Fill score_table and score_weekly
        w = 0;
        for (i = -g_year_wday_offset; i < g_year_nday; i++) {
          y = (i + g_year_wday_offset) % 7;
          x = int((i + g_year_wday_offset) / 7);
          if (x >= w) w = x + 1;

          score_table[y, x] = i < 0 ? -1 : g_score[i];
          score_weekly[x] += g_score[i];
        }

        grboard_render(lines, score_table, w, 7);
        for (y = 0; y < 7; y++) print c_weekday[1 + y] lines[y];

        grvbar_render(lines, score_weekly, w, 3);
        for (y = 0; y < 3; y++) print c_weekday[8] lines[y];

        print "";
      }

      $2 != g_year {
        flush_year();
        initialize_year($2);
      }
      {
        yday = $3 - 1;
        g_score[yday] = $1;
        g_score_total += $1;
        if ($1 > g_score_max)
          g_score_max = $1;
      }

      END {
        flush_year();
      }
    '
}

function ble/histdb/sub:week {
  local palette=$1

  local grboard_export
  ble/histdb/graph/board/initialize '●' "$palette"
  local -x "${grboard_export[@]}" # disable=#D1566

  local grvbar_declare
  ble/histdb/graph/vbar/initialize "$palette[2]"
  local -x "${grvbar_declare[@]}" # disable=#D1566

  local grhbar_declare
  ble/histdb/graph/hbar/initialize "$palette[2]"
  local -x "${grhbar_declare[@]}" # disable=#D1566

  ble/histdb/sub:query -separator ' ' "SELECT strftime('%w %H', issue_time, 'unixepoch', 'localtime') AS date FROM command_history;" |
    sort | uniq -c | ble/bin/awk '
      '"$_ble_histdb_grboard_awk_lib"'
      '"$_ble_histdb_grvbar_awk_lib"'
      '"$_ble_histdb_grhbar_awk_lib"'

      BEGIN {
        grboard_initialize();
        grvbar_initialize();
        grhbar_initialize();
        split("Sun,Mon,Tue,Wed,Thu,Fri,Sat,   ", c_weekday, ",");
      }
      {
        y = $2 + 0;
        x = $3 + 0;
        g_score[y, x] += $1;
        g_score[x] += $1;
        g_score_wday[y] += $1;
      }
      END {
        line = c_weekday[8];
        for (h = 0; h < 24; h++)
          line = line sprintf(h % 3 == 0 ? "%02d" : "  ", h);
        print line;

        grboard_render(lines, g_score, 24, 7);
        grhbar_render(lines_hbar, g_score_wday, 4, 7);
        for (y = 0; y < 7; y++) print c_weekday[1 + y] lines[y] lines_hbar[y];

        grvbar_render(lines, g_score, 24, 3);
        for (y = 0; y < 3; y++) print c_weekday[8] lines[y];
      }
    '
}
