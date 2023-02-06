# blesh/contrib/histdb (C) 2023, Koichi Murase <myoga.murase@gmail.com>

ble/util/assign _ble_histdb_sqlite3 'builtin type -P sqlite3 2>/dev/null'
if [[ ! -x $_ble_histdb_sqlite3 ]]; then
  ble/util/print 'contrib/histdb: "sqlite3" is required for this module.' >&2
  return 1
fi

bleopt/declare -v histdb_ignore ''
bleopt/declare -v histdb_file ''

function ble/histdb/.get-filename {
  local basename=${bleopt_histdb_file%.sqlite3}
  local hostname=${HOSTNAME:-$_ble_base_env_HOSTNAME}
  hostname=${hostname//'/'/'%'} # filename cannot contian /
  ret=${basename:-$_ble_base_state/history}${hostname:+@$hostname}.sqlite3
}
function ble/histdb/.get-time {
  if ((_ble_bash>=50000)); then
    time=$EPOCHSECONDS
  elif ((_ble_bash>=40200)); then
    printf -v time '%(%s)T'
  else
    ((time=${_ble_base_session%%[./]*}+SECONDS))
  fi
}

## @var _ble_histdb_file
_ble_histdb_file=
_ble_histdb_fd_request=
_ble_histdb_fd_response=
_ble_histdb_bgpid=
_ble_histdb_timeout=5000

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
  if [[ $_ble_histdb_fd_response && _ble_bash -ge 40000 ]]; then
    local line IFS=
    builtin read -t 0.001 -r -d '' line <&"$_ble_histdb_fd_response"
  fi
}
function ble/histdb/sqlite3.request {
  ble/histdb/sqlite3.open
  if [[ $_ble_histdb_fd_request ]]; then
    ble/histdb/sqlite3.flush
    ble/util/print "$1" >&"$_ble_histdb_fd_request"
  else
    [[ $1 == .exit ]] && return 0
    "$_ble_histdb_sqlite3" -quote ".timeout $_ble_histdb_timeout" "$_ble_histdb_file" "$1" 2>/dev/null
  fi
}

function ble/histdb/read-single-value {
  local line nl=$'\n' q=\' qq=\'\' Q="'\''"
  local IFS= TMOUT=
  if builtin read "${_ble_bash_tmout_wa[@]}" -r line && [[ $line == \'* ]]; then
    local out=$line ext=0
    while ((ext==0)) && ! ble/string#match "$out" '^'"$q"'([^'\'']|'"$qq"')*'"$q"'$'; do
      builtin read "${_ble_bash_tmout_wa[@]}" -r line; ext=$?
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
  if [[ $_ble_histdb_fd_request && _ble_bash -ge 40000 ]]; then
    ble/histdb/sqlite3.flush
    ble/util/print "$query" >&"$_ble_histdb_fd_request"

    local sync_command='ble/histdb/read-single-value <&"$_ble_histdb_fd_response"'
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
    ble/util/assign out '"$_ble_histdb_sqlite3" -quote ".timeout $_ble_histdb_timeout" "$_ble_histdb_file" "$query"' 2>/dev/null
    out=${out#$q}
    out=${out%$q}
    ret=${out//$qq/$q}
  fi
}

function ble/histdb/sqlite3.exec {
  exec "$_ble_histdb_sqlite3" -quote -cmd "-- [ble: $BLE_SESSION_ID]" "$_ble_histdb_file";
} <&"$_ble_histdb_fd_request" >&"$_ble_histdb_fd_response" 2>/dev/null

## @fn ble/histdb/sqlite3.open
##   @var[ref] _ble_histdb_file
##   @var[out] _ble_histdb_fd_request
##   @var[out] _ble_histdb_fd_response
function ble/histdb/sqlite3.open {
  if [[ $_ble_histdb_file ]]; then
    if [[ $_ble_histdb_bgpid ]] && ! kill -0 "$_ble_histdb_bgpid"; then
      ble/util/print 'background sqlite3 is inactive.' >&2
    else
      return 0
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

  local fname_request=$_ble_base_run/$$.histdb.request.pipe
  local fname_response=$_ble_base_run/$$.histdb.response.pipe
  [[ -e $fname_request || -h $fname_request || -e $fname_response || -h $fname_response ]] &&
    ble/bin/rm -f "$fname_request" "$fname_response"

  # Note: mkfifo may fail in MSYS-1
  _ble_histdb_fd_request=
  _ble_histdb_fd_response=
  if ble/bin/mkfifo "$fname_request" "$fname_response" 2>/dev/null; then
    ble/fd#alloc _ble_histdb_fd_request '<> "$fname_request"'
    ble/fd#alloc _ble_histdb_fd_response '<> "$fname_response"'
    _ble_histdb_bgpid=$(ble/histdb/sqlite3.exec __ble_suppress_joblist__ & ble/util/print "$!")
    ble/util/print "$_ble_histdb_bgpid" >| "$_ble_base_run/$$.histdb.pid"
  fi

  local ret q=\' qq=\'\'
  ble/histdb/sqlite3.request-single-value "
    BEGIN TRANSACTION;
    CREATE TABLE IF NOT EXISTS misc(key TEXT PRIMARY KEY, value INTEGER);
    INSERT OR IGNORE INTO misc values('version', 2);
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
  version=$ret

  if [[ $version ]] && ((version<2)); then
    local query="ALTER TABLE command_history ADD COLUMN inode INTEGER;"
    ble/histdb/sqlite3.request "$query"
  fi
}

function ble/histdb/sqlite3.close {
  [[ $_ble_histdb_file ]] || return 0
  local session_id=$_ble_base_session
  local time; ble/histdb/.get-time
  ble/histdb/sqlite3.request "
    UPDATE sessions SET
      last_time = '${time//$q/$qq}',
      last_wd = '${PWD//$q/$qq}'
      WHERE session_id = '${session_id//$q/$qq}';"
  ble/histdb/sqlite3.request ".exit"

  if [[ $_ble_histdb_fd_request ]]; then
    ble/fd#close _ble_histdb_fd_request
    _ble_histdb_fd_request=
  fi
  if [[ $_ble_histdb_fd_response ]]; then
    ble/fd#close _ble_histdb_fd_response
    _ble_histdb_fd_response=
  fi
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
  "${_ble_util_set_declare[@]//NAME/mark}"
  for word in "${collect_words[@]}"; do
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
  local session_id=$_ble_base_session
  local time; ble/histdb/.get-time; local issue_time=$time

  # @var history_index ... history index: The current command might not be
  # registered to the command history, but we always pick up the index of the
  # last entry because there is no way to check it reliably.  We could compare
  # the top element with BASH_COMMAND, but the history entry might be
  # transformed by HISTCONTROL=strip, etc.
  local history_index; ble/history/get-count -v history_index
  ((history_index++))

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
    BEGIN TRANSACTION;
    UPDATE sessions SET
      last_time = '${issue_time//$q/$qq}'
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
        command, cwd, inode, issue_time)
      VALUES(
        '${session_id//$q/$qq}', '${command_id//$q/$qq}',
        '${lineno//$q/$qq}', '${history_index//$q/$qq}',
        '${command//$q/$qq}', '${PWD//$q/$qq}', ${inode-None}, '${issue_time//$q/$qq}');
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

  local time; ble/histdb/.get-time; local last_time=$time

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
      last_time = '${last_time//$q/$qq}'
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
  ble/bin/.freeze-utility-path -n gzip || return 1

  local backup=${file%.sqlite3}.backup.sqlite3 q=\' qq=\'\'
  if [[ -s $backup.gz ]]; then
    # If there is already an up-to-date backup file, we skip the backup.
    local ret now
    ble/file#mtime "$backup.gz" || return 1
    ble/util/strftime -v now %s
    ((now>ret+24*3600)) || return 1
  fi

  "$_ble_histdb_sqlite3" "$file" \
    ".timeout $_ble_histdb_timeout" \
    "PRAGMA quick_check;" \
    ".backup '${backup//$q/$qq}'" \
    "ATTACH DATABASE '${backup//$q/$qq}' AS backup;
    PRAGMA backup.quick_check;" &&
    ble/bin/gzip -c "$backup" >| "$backup.gz.part" &&
    [[ -s $backup.gz.part ]] &&
    ble/bin/mv -f "$backup.gz.part" "$backup.gz" &&
    ble/bin/rm -f "$backup"
}

function ble/histdb/exit.hook {
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
blehook EXIT!=ble/histdb/exit.hook

#------------------------------------------------------------------------------
# auto-complete

function ble/complete/auto-complete/source:histdb-history {
  local ret
  ble/histdb/escape-for-sqlite-glob "$_ble_edit_str"; local pat=$ret?*

  ble/histdb/update-cwd-inode
  local inode=$_ble_histdb_exec_cwd_inode

  ble/histdb/sqlite3.request-single-value "
    SELECT coalesce(
      (SELECT command FROM (SELECT command, max(issue_time) FROM command_history WHERE command GLOB '${pat//$q/$qq}' AND cwd = '${PWD//$q/$qq}')),
      ${inode:+(SELECT command FROM (SELECT command, max(issue_time) FROM command_history WHERE command GLOB '${pat//$q/$qq}' AND inode = $inode)),}
      '');"
  [[ $ret == "$_ble_edit_str"?* ]] || return 1
  ble/complete/auto-complete/enter h 0 "${ret:${#_ble_edit_str}}" '' "$ret"
}

function ble/complete/auto-complete/source:histdb-word {
  # 閉じていない入れ子に対する列挙
  local iN=${#_ble_edit_str}
  ((iN>0)) || return 1

  local -a wbegins=()

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

  local -a sqls=()

  local i q=\' qq=\'\'
  for i in "${wbegins[@]}"; do
    local word=${_ble_edit_str:i:iN-i}
    [[ $word ]] || continue
    local ret; ble/histdb/escape-for-sqlite-glob "$word"
    local pat=$ret?*
    ble/array#push sqls "SELECT '$i:' || word FROM (SELECT word, max(mtime) FROM words WHERE word GLOB '${pat//$q/$qq}')"
  done
  ((${#sqls[@]})) || return 1

  ble/array#reverse sqls
  sqls=("${sqls[@]/#/(}")
  sqls=("${sqls[@]/%/)}")
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
  return 0
}
ble/util/import/eval-after-load core-complete '
  ble/array#insert-before _ble_complete_auto_source history histdb-history
  ble/array#push _ble_complete_auto_source histdb-word'
ble/function#try ble/util/idle.push ble/histdb/sqlite3.open

#------------------------------------------------------------------------------
# ble histdb command

function ble-histdb {
  local ret
  ble/histdb/.get-filename
  "$_ble_histdb_sqlite3" "$ret" '.timeout 1000' 'select command from command_history;'
}
