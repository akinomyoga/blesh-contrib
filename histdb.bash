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
_ble_histdb_exec_ignore=
_ble_histdb_bgpid=

function ble/histdb/sqlite3.flush {
  if [[ $_ble_histdb_fd_response ]]; then
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
    "$_ble_histdb_sqlite3" -quote '.timeout 5000' "$_ble_histdb_file" "$1" 2>/dev/null
  fi
}

function ble/histdb/sqlite3.request-single-value {
  local query=$1
  ble/histdb/sqlite3.open
  if [[ $_ble_histdb_fd_request ]]; then
    ble/histdb/sqlite3.flush
    ble/util/print "$query" >&"$_ble_histdb_fd_request"
    builtin read -t 1 -r ret <&"$_ble_histdb_fd_response"
  else
    ble/util/assign '"$_ble_histdb_sqlite3" -quote ".timeout 5000" "$_ble_histdb_file" "$query"' 2>/dev/null
  fi
}

function ble/histdb/sqlite3.exec {
  exec "$_ble_histdb_sqlite3" -quote "$_ble_histdb_file";
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
  fi

  local q=\' qq=\'\'
  ble/histdb/sqlite3.request "
    .timeout 5000
    CREATE TABLE IF NOT EXISTS misc(key TEXT PRIMARY KEY, value INTEGER);
    INSERT OR IGNORE INTO misc values('version', 1);
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
      command TEXT, cwd TEXT, issue_time INTEGER,
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
        '${_ble_prompt_const_l//$q/$qq}');"
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

function ble/histdb/preexec.hook {
  local command=$_ble_edit_exec_BASH_COMMAND
  if [[ $bleopt_histdb_ignore ]]; then
    local patterns pattern
    ble/string#split patterns : "$bleopt_histdb_ignore"
    for pattern in "${patterns[@]}"; do
      if [[ $command == $pattern ]]; then
        _ble_histdb_exec_ignore=1
        return 0
      fi
    done
  fi
  _ble_histdb_exec_ignore=

  local session_id=$_ble_base_session
  local command_id=$_ble_edit_exec_command_id
  local time; ble/histdb/.get-time; local issue_time=$time

  # @var index ... history index: The current command might not be registered
  # to the command history, but we always pick up the index of the last entry
  # because there is no way to check it reliably.  We could compare the top
  # element with BASH_COMMAND, but the history entry might be transformed by
  # HISTCONTROL=strip, etc.
  local index; ble/history/get-index

  local q=\' qq=\'\' ret=
  ble/histdb/sqlite3.request "
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
        command, cwd, issue_time)
      VALUES(
        '${session_id//$q/$qq}', '${command_id//$q/$qq}',
        '${_ble_edit_LINENO//$q/$qq}', '${index//$q/$qq}',
        '${command//$q/$qq}', '${PWD//$q/$qq}',
        '${issue_time//$q/$qq}');"
}

function ble/histdb/postexec.hook {
  [[ $_ble_histdb_exec_ignore ]] && return 0

  local session_id=$_ble_base_session
  local command_id=$_ble_edit_exec_command_id
  local time; ble/histdb/.get-time; local last_time=$time

  IFS=, builtin eval 'local pipestatus="${_ble_edit_exec_PIPESTATUS[*]}"'
  local lastarg=$_ble_edit_exec_lastarg
  ((${#lastarg}>=1000)) && lastarg=${lastarg::1000}...

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

function ble/histdb/exit.hook {
  ble/histdb/sqlite3.close
}

# 設定が変化して記録先の history.sqlite3 のパスが変わったら現在のファイルは閉じ
# る。必要になった時に初めて新しいファイルを開く。
function ble/histdb/exec_end.hook {
  local ret; ble/histdb/.get-filename
  [[ $ret == "$_ble_histdb_file" ]] ||
    ((${#_ble_edit_exec_lines[@]})) ||
    ble/histdb/sqlite3.close
}

blehook PREEXEC+=ble/histdb/preexec.hook
blehook POSTEXEC+=ble/histdb/postexec.hook
blehook exec_end+=ble/histdb/exec_end.hook
blehook EXIT+=ble/histdb/exit.hook

function ble-histdb {
  local ret
  ble/histdb/.get-filename
  "$_ble_histdb_sqlite3" "$ret" '.timeout 1000' 'select command from command_history;'
}
