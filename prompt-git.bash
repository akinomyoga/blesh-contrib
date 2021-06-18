# ble/contrib/prompt-git.bash (C) 2020-2021, akinomyoga

# bleopt rps1='\q{contrib/git-info}'
# bleopt rps1='\q{contrib/git-name}'
# bleopt rps1='\q{contrib/git-hash}'
# bleopt rps1='\q{contrib/git-branch}'
# bleopt rps1='\q{contrib/git-path}'

_ble_contrib_prompt_git_data=()
_ble_contrib_prompt_git_base=
_ble_contrib_prompt_git_base_dir=
_ble_contrib_prompt_git_vars=(git_base git_base_dir)

## @fn ble/contrib/prompt-git/.check-gitdir path
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/.check-gitdir {
  local path=$1
  [[ -f $path/.git/HEAD ]] || return 1
  ble/prompt/unit/assign _ble_contrib_prompt_git_base     "$path"
  ble/prompt/unit/assign _ble_contrib_prompt_git_base_dir "$path/.git"
  return 0
}
## @fn ble/contrib/prompt-git/.check-submodule path
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/.check-submodule {
  local path=$1 content
  [[ -f $path/.git ]] || return 1
  ble/util/mapfile content < "$path/.git"
  [[ $content == 'gitdir:'* ]] || return 1
  local git_base=$path
  local git_base_dir=${content#'gitdir:'}
  git_base_dir=${git_base_dir#' '}
  [[ $git_base_dir == /* ]] ||
    git_base_dir=$path/$git_base_dir
  [[ -f $git_base_dir/HEAD ]]
  ble/prompt/unit/assign _ble_contrib_prompt_git_base     "$git_base"
  ble/prompt/unit/assign _ble_contrib_prompt_git_base_dir "$git_base_dir"
  return 0
}
function ble/prompt/unit:_ble_contrib_prompt_git/update {
  ble/prompt/unit/add-hash '$PWD'

  type git &>/dev/null || return 1
  # [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]
  local path=$PWD found=
  while
    if ble/contrib/prompt-git/.check-gitdir "$path"; then
      [[ $prompt_unit_changed ]]
      return $?
    elif ble/contrib/prompt-git/.check-submodule "$path"; then
      [[ $prompt_unit_changed ]]
      return $?
    fi
    [[ $path == */* ]]
  do path=${path%/*}; done

  ble/prompt/unit/assign _ble_contrib_prompt_git_base ''
  [[ $prompt_unit_changed ]]
}

## @fn ble/contrib/prompt-git/initialize
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/initialize {
  ble/prompt/unit#update _ble_contrib_prompt_git
  ble/util/restore-vars _ble_contrib_prompt_ "${_ble_contrib_prompt_git_vars[@]}"
  [[ $git_base ]]
}

#------------------------------------------------------------------------------
## @fn ble/contrib/prompt-git/is-dirty
##   現在の working tree に編輯があるかどうかを非同期で取得します。
##   @var[in] git_base

_ble_contrib_prompt_git_dirty=
_ble_contrib_prompt_git_dirty_hash=
_ble_contrib_prompt_git_dirty_base=
_ble_contrib_prompt_git_dirty_clock=
_ble_contrib_prompt_git_dirty_bgpid=
_ble_contrib_prompt_git_dirty_tmpfile=$_ble_base_run/$$.prompt.git.dirty
function ble/contrib/prompt-git/.check-dirty.check {
  git diff --quiet
}
function ble/contrib/prompt-git/.check-dirty.worker {
  ble/contrib/prompt-git/.check-dirty.check
  ble/util/print "return $?" >| "$_ble_contrib_prompt_git_dirty_tmpfile"
}
function ble/contrib/prompt-git/.check-dirty.callback {
  _ble_contrib_prompt_git_dirty_bgpid=
  if source "$_ble_contrib_prompt_git_dirty_tmpfile"; then
    _ble_contrib_prompt_git_dirty=
  else
    _ble_contrib_prompt_git_dirty=1
  fi
  local ret; ble/util/clock
  _ble_contrib_prompt_git_dirty_clock=$ret
  return 0
}
function ble/contrib/prompt-git/is-dirty {
  [[ $_ble_contrib_prompt_git_base ]] || return 0

  local nbase=$_ble_contrib_prompt_git_base
  local nhash=$_ble_prompt_version
  local obase=$_ble_contrib_prompt_git_dirty_base
  local ohash=$_ble_contrib_prompt_git_dirty_hash
  local oclock=$_ble_contrib_prompt_git_dirty_clock

  local update= ret
  [[ $nbase != "$obase" ]] && update=1 _ble_contrib_prompt_git_dirty=
  [[ $nhash != "$ohash" && ! $_ble_contrib_prompt_git_dirty_bgpid ]] &&
    { ((nhash>=ohash+10)) || { ble/util/clock; ((ret>=oclock+1000)); } } &&
    update=1
  if [[ $update ]]; then
    _ble_contrib_prompt_git_dirty_hash=$nhash
    _ble_contrib_prompt_git_dirty_base=$nbase

    if ble/is-function ble/util/idle.push; then
      if [[ $_ble_contrib_prompt_git_dirty_bgpid ]]; then
        builtin kill -9 "$_ble_contrib_prompt_git_dirty_bgpid" &>/dev/null
        ble/util/idle.cancel ble/contrib/prompt-git/.check-dirty.callback
        _ble_contrib_prompt_git_dirty_bgpid=
      fi

      : >| "$_ble_contrib_prompt_git_dirty_tmpfile"
      _ble_contrib_prompt_git_dirty_bgpid=$(shopt -u huponexit; ble/contrib/prompt-git/.check-dirty.worker < /dev/null &> /dev/null & ble/util/print $!)
      ble/util/msleep 5
      if [[ -s $_ble_contrib_prompt_git_dirty_tmpfile ]]; then
        ble/contrib/prompt-git/.check-dirty.callback
      else
        ble/util/idle.push -F "$_ble_contrib_prompt_git_dirty_tmpfile" ble/contrib/prompt-git/.check-dirty.callback
      fi

    else
      if ble/contrib/prompt-git/.check-dirty.check; then
        _ble_contrib_prompt_git_dirty=
      else
        _ble_contrib_prompt_git_dirty=1
      fi
    fi
  fi

  ble/prompt/unit/add-hash '$_ble_contrib_prompt_git_dirty'
  [[ $_ble_contrib_prompt_git_dirty ]]
}

## @fn ble/contrib/prompt-git/get-head-information
##   @var[out] hash branch
function ble/contrib/prompt-git/get-head-information {
  branch= hash=

  local head_file=$git_base_dir/HEAD
  [[ -s $head_file ]] || return
  local content; ble/util/mapfile content < "$head_file"

  if [[ $content == *'ref: refs/heads/'* ]]; then
    branch=${content#*refs/heads/}

    local branch_file=$git_base_dir/refs/heads/$branch
    [[ -s $branch_file ]] || return
    local content; ble/util/mapfile content < "$branch_file"
  fi

  [[ ! ${content//[0-9a-fA-F]} ]] && hash=$content
  return 0
}
## @fn ble/contrib/prompt-git/get-tag-name hash
##   @var[out] tag
function ble/contrib/prompt-git/get-tag-name {
  # ble/util/assign-array tag 'git describe --tags --exact-match 2>/dev/null'
  tag=
  local hash=$1; [[ $hash ]] || return 1

  local file tagsdir=$git_base_dir/refs/tags hash1
  local files ret; ble/util/eval-pathname-expansion '"$tagsdir"/*'; files=("${ret[@]}")
  for file in "${files[@]}"; do
    local tag1=${file#$tagsdir/}
    [[ -s $file ]] || continue
    ble/util/mapfile hash1 < "$file"
    if [[ $hash1 == "$hash" ]]; then
      tag=$tag1
      return
    fi
  done
}

function ble/contrib/prompt-git/describe-head {
  local opts=:$1:
  ret=

  local dirty_mark=
  [[ $opts == *:check-dirty:* ]] &&
    ble/contrib/prompt-git/is-dirty &&
    dirty_mark=$'\e[1;38:5:202m*\e[m'

  local hash branch
  ble/contrib/prompt-git/get-head-information
  if [[ $branch ]]; then
    local sgr=$'\e[1;34m' sgr0=$'\e[m'
    ret=$sgr$branch$sgr0
    if [[ $opts == *:add-hash:* && $hash ]]; then
      ret="$ret (${hash::7}$dirty_mark)"
    else
      ret=$ret$dirty_mark
    fi
    return
  fi

  local DETACHED=$'\e[91mDETACHED\e[m'

  local tag
  ble/contrib/prompt-git/get-tag-name "$hash"
  if [[ $tag ]]; then
    local sgr=$'\e[1;32m' sgr0=$'\e[m'
    ret=$sgr$tag$sgr0
    [[ $opts == *:add-hash:* && $hash ]] &&
      ret="$ret ${hash::7}"
    ret=$ret$dirty_mark
    [[ $opts == *:check-detached:* ]] &&
      ret="$DETACHED ($ret)"
    return
  fi

  # "master~23" 等の分かりにくい説明なのでこれは使わない
  # ble/util/assign-array ret 'git describe --contains --all 2>/dev/null'
  # if [[ $ret ]]; then
  #   local sgr=$'\e[32m' sgr0=$'\e[m'
  #   ret="($DETACHED at $sgr$ret$sgr0)"
  #   return
  # fi

  if [[ $hash ]]; then
    ret=${hash::7}$dirty_mark
    [[ $opts == *:check-detached:* ]] &&
      ret="$DETACHED ($ret)"
    return
  fi

  ret=$'\e[91mUNKNOWN\e[m'
}

#------------------------------------------------------------------------------

function ble/prompt/backslash:contrib/git-info {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
  if ble/contrib/prompt-git/initialize; then
    local sgr=$'\e[1m' sgr0=$'\e[m'
    local name=$sgr${git_base##*?/}$sgr0
    local ret; ble/contrib/prompt-git/describe-head add-hash:check-dirty:check-detached; local branch=$ret
    ble/prompt/print "$name $branch"
    [[ $PWD == "$git_base"/?* ]] &&
      ble/prompt/print " /${PWD#$git_base/}"
    return 0
  else
    return 1
  fi
}
function ble/prompt/backslash:contrib/git-name {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
  if ble/contrib/prompt-git/initialize; then
    local name=${git_base%.git}
    name=${name%/}
    name=${name##*?/}
    ble/prompt/print "${git_base##*?/}"
  fi
}
function ble/prompt/backslash:contrib/git-hash {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
  if ble/contrib/prompt-git/initialize; then
    local hash branch
    ble/contrib/prompt-git/get-head-information
    ble/prompt/print "${hash::${1:-7}}"
  fi
}
function ble/prompt/backslash:contrib/git-branch {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
  if ble/contrib/prompt-git/initialize; then
    local ret; ble/contrib/prompt-git/describe-head check-dirty
    ble/prompt/print "$ret"
  fi
}
function ble/prompt/backslash:contrib/git-path {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}" # WA #D1570 checked
  if ble/contrib/prompt-git/initialize; then
    if [[ $PWD == "$git_base"/?* ]]; then
      ble/prompt/print "/${PWD#$git_base/}"
    elif [[ $PWD == "$git_base" ]]; then
      ble/prompt/print /
    fi
  fi
}
