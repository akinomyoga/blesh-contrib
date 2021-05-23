# ble/contrib/prompt-git.bash (C) 2020, akinomyoga

# bleopt rps1='\q{contrib/git-info}'
# bleopt rps1='\q{contrib/git-name}'
# bleopt rps1='\q{contrib/git-hash}'
# bleopt rps1='\q{contrib/git-branch}'
# bleopt rps1='\q{contrib/git-path}'

_ble_contrib_prompt_git_prompt_update=
_ble_contrib_prompt_git_vars=(git_base git_base_dir)

function ble/contrib/prompt-git/.load-cache {
  [[ $_ble_contrib_prompt_git_prompt_update == "$_ble_prompt_update" ]] || return 2
  local var
  for var in "${_ble_contrib_prompt_git_vars[@]}"; do
    eval "$var=\$_ble_contrib_prompt_$var"
  done
  [[ $git_base ]]
}
function ble/contrib/prompt-git/.save-cache {
  _ble_contrib_prompt_git_prompt_update=$_ble_prompt_update
  if [[ $1 == none ]]; then
    _ble_contrib_prompt_git_base=
  else
    local var
    for var in "${_ble_contrib_prompt_git_vars[@]}"; do
      eval "_ble_contrib_prompt_$var=\$$var"
    done
  fi
}

## @fn ble/contrib/prompt-git/.initialize-gitdir path
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/.initialize-gitdir {
  local path=$1
  [[ -f $path/.git/HEAD ]] || return 1
  git_base=$path
  git_base_dir=$path/.git
  return 0
}
## @fn ble/contrib/prompt-git/.initialize-submodule path
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/.initialize-submodule {
  local path=$1 content
  [[ -f $path/.git ]] || return 1
  ble/util/mapfile content < "$path/.git"
  [[ $content == 'gitdir:'* ]] || return 1
  git_base=$path
  git_base_dir=${content#'gitdir:'}
  git_base_dir=${git_base_dir#' '}
  [[ $git_base_dir == /* ]] ||
    git_base_dir=$path/$git_base_dir
  [[ -f $git_base_dir/HEAD ]]
}
## @fn ble/contrib/prompt-git/initialize
##   @var[out] git_base git_base_dir
function ble/contrib/prompt-git/initialize {
  ble/contrib/prompt-git/.load-cache; local ext=$?
  ((ext==2)) || return "$ext"

  type git &>/dev/null || return 1
  # [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]
  local path=$PWD
  while
    if ble/contrib/prompt-git/.initialize-gitdir "$path"; then
      ble/contrib/prompt-git/.save-cache
      return 0
    elif ble/contrib/prompt-git/.initialize-submodule "$path"; then
      ble/contrib/prompt-git/.save-cache
      return 0
    fi
    [[ $path == */* ]]
  do path=${path%/*}; done
  ble/contrib/prompt-git/.save-cache none
  return 1
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

  local hash branch
  ble/contrib/prompt-git/get-head-information
  if [[ $branch ]]; then
    local sgr=$'\e[1;34m' sgr0=$'\e[m'
    ret=$sgr$branch$sgr0
    [[ $opts == *:add-hash:* && $hash ]] &&
      ret="$ret (${hash::7})"
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
    ret=${hash::7}
    [[ $opts == *:check-detached:* ]] &&
      ret="$DETACHED ($ret)"
    return
  fi

  ret=$'\e[91mUNKNOWN\e[m'
}

function ble/prompt/backslash:contrib/git-info {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}"
  if ble/contrib/prompt-git/initialize; then
    local sgr=$'\e[1m' sgr0=$'\e[m'
    local name=$sgr${git_base##*?/}$sgr0
    local ret; ble/contrib/prompt-git/describe-head add-hash:check-detached; local branch=$ret
    ble/prompt/print "$name $branch"
    [[ $PWD == "$git_base"/?* ]] &&
      ble/prompt/print " /${PWD#$git_base/}"
    return 0
  else
    return 1
  fi
}
function ble/prompt/backslash:contrib/git-name {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}"
  if ble/contrib/prompt-git/initialize; then
    local name=${git_base%.git}
    name=${name%/}
    name=${name##*?/}
    ble/prompt/print "${git_base##*?/}"
  fi
}
function ble/prompt/backslash:contrib/git-hash {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}"
  if ble/contrib/prompt-git/initialize; then
    local hash branch
    ble/contrib/prompt-git/get-head-information
    ble/prompt/print "${hash::${1:-7}}"
  fi
}
function ble/prompt/backslash:contrib/git-branch {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}"
  if ble/contrib/prompt-git/initialize; then
    local ret; ble/contrib/prompt-git/describe-head
    ble/prompt/print "$ret"
  fi
}
function ble/prompt/backslash:contrib/git-path {
  local "${_ble_contrib_prompt_git_vars[@]/%/=}"
  if ble/contrib/prompt-git/initialize; then
    if [[ $PWD == "$git_base"/?* ]]; then
      ble/prompt/print "/${PWD#$git_base/}"
    elif [[ $PWD == "$git_base" ]]; then
      ble/prompt/print /
    fi
  fi
}
