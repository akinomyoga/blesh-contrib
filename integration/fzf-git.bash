# Copyright (c) 2016, 2022 Junegunn Choi
# ble/contrib/integration/fzf-git.bash (C) 2020, 2023, akinomyoga
#
# 2020-04-16 https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236 (Revision 2019-03-14)
# 2023-06-30 https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236 (Revision 2022-08-16)
# 2023-06-30 https://github.com/junegunn/fzf-git.sh/commit/4bc0323b4822b3426989863996cc266c52c7f25a
# 2023-06-30 https://github.com/junegunn/fzf-git.sh/commit/b6192ec86609afea761c7d3954f9b539a512dc80
# 2023-11-09 https://github.com/junegunn/fzf-git.sh/blob/aacab4ae557657e0f9de288d688f312a28b86d21/fzf-git.sh

if [[ $- != *i* ]]; then
  if (($# == 1)); then
    function ble/contrib/integration:fzf-git/sub:branches {
      git branch "$@" --sort=-committerdate --sort=-HEAD --format=$'%(HEAD) %(color:yellow)%(refname:short) %(color:green)(%(committerdate:relative))\t%(color:blue)%(subject)%(color:reset)' --color=always | column -ts$'\t'
    }
    function ble/contrib/integration:fzf-git/sub:refs {
      git for-each-ref --sort=-creatordate --sort=-HEAD --color=always --format=$'%(refname) %(color:green)(%(creatordate:relative))\t%(color:blue)%(subject)%(color:reset)' |
        builtin eval -- "$1" |
        sed 's#^refs/remotes/#\x1b[95mremote-branch\t\x1b[33m#; s#^refs/heads/#\x1b[92mbranch\t\x1b[33m#; s#^refs/tags/#\x1b[96mtag\t\x1b[33m#; s#refs/stash#\x1b[91mstash\t\x1b[33mrefs/stash#' |
        column -ts$'\t'
    }
    case $1 in
    (branches)
      printf '%s\n' $'CTRL-O (open in browser) ╱ ALT-A (show all branches)\n'
      ble/contrib/integration:fzf-git/sub:branches
      ;;
    (all-branches)
      printf '%s\n' $'CTRL-O (open in browser)\n'
      ble/contrib/integration:fzf-git/sub:branches -a
      ;;
    (refs)
      printf '%s\n' $'CTRL-O (open in browser) ╱ ALT-E (examine in editor) ╱ ALT-A (show all refs)\n'
      ble/contrib/integration:fzf-git/sub:refs 'grep -v ^refs/remotes'
      ;;
    (all-refs)
      printf '%s\n' $'CTRL-O (open in browser) ╱ ALT-E (examine in editor)\n'
      ble/contrib/integration:fzf-git/sub:refs 'cat'
      ;;
    (nobeep) ;;
    (*) exit 1 ;;
    esac
  elif (($# > 1)); then
    set -e

    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [[ $branch = HEAD ]]; then
      branch=$(git describe --exact-match --tags 2> /dev/null || git rev-parse --short HEAD)
    fi

    # Only supports GitHub for now
    case $1 in
    (commit)
      hash=$(grep -o "[a-f0-9]\{7,\}" <<< "$2")
      path=/commit/$hash
      ;;
    (branch|remote-branch)
      branch=$(sed 's/^[* ]*//' <<< "$2" | cut -d' ' -f1)
      remote=$(git config branch."${branch}".remote || printf 'origin\n')
      branch=${branch#$remote/}
      path=/tree/$branch
      ;;
    (remote)
      remote=$2
      path=/tree/$branch
      ;;
    (file) path=/blob/$branch/$(git rev-parse --show-prefix)$2 ;;
    (tag)  path=/releases/tag/$2 ;;
    (*)    exit 1 ;;
    esac

    remote=${remote:-$(git config branch."${branch}".remote || printf 'origin\n')}
    remote_url=$(git remote get-url "$remote" 2> /dev/null || printf '%s\n' "$remote")

    if [[ $remote_url =~ ^git@ ]]; then
      url=${remote_url%.git}
      url=${url#git@}
      url=https://${url/://}
    elif [[ $remote_url =~ ^http ]]; then
      url=${remote_url%.git}
    fi

    case $(uname -s) in
    (Darwin) open "$url$path"     ;;
    (*)      xdg-open "$url$path" ;;
    esac
  fi
  exit 0
fi

#------------------------------------------------------------------------------

ble-import contrib/integration/fzf-initialize

[[ $- == *i* ]] || return 0

## @fn ble/contrib/integration:fzf-git/initialize bash_source
##   @param[in] bash_source
##   @var[out] __fzf_git
function ble/contrib/integration:fzf-git/initialize {
  local ret
  ble/util/readlink "$1"
  __fzf_git=$ret
}
ble/contrib/integration:fzf-git/initialize "${BASH_SOURCE[0]:-}"

# GIT heart FZF
# -------------

#------------------------------------------------------------------------------
# Redefine this function to change the options
_fzf_git_fzf() {
  fzf-tmux -p80%,60% -- \
    --layout=reverse --multi --height=50% --min-height=20 --border \
    --border-label-pos=2 \
    --color='header:italic:underline,label:blue' \
    --preview-window='right,50%,border-left' \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

function ble/contrib/integration:fzf-git/fzf {
  [[ $_ble_term_state == internal ]] && ble/term/leave-for-widget
  _fzf_git_fzf "$@"
  local ext=$?
  [[ $_ble_term_state == internal ]] && ble/term/enter-for-widget
  return "$ext"
}

_fzf_git_check() {
  git rev-parse HEAD > /dev/null 2>&1 && return 0

  [[ -n $TMUX ]] && tmux display-message "Not in a git repository"
  return 1
}

if [[ -z $_fzf_git_cat ]]; then
  # Sometimes bat is installed as batcat
  export _fzf_git_cat="cat"
  _fzf_git_bat_options="--style='${BAT_STYLE:-full}' --color=always --pager=never"
  if command -v batcat > /dev/null; then
    _fzf_git_cat="batcat $_fzf_git_bat_options"
  elif command -v bat > /dev/null; then
    _fzf_git_cat="bat $_fzf_git_bat_options"
  fi
fi

_fzf_git_files() {
  _fzf_git_check || return "$?"
  (git -c color.status=always status --short --no-branch
   git ls-files | grep -vxFf <(git status -s | grep '^[^?]' | cut -c4-; ble/util/print :) | sed 's/^/   /') |
  ble/contrib/integration:fzf-git/fzf -m --ansi --nth 2..,.. \
    --border-label '📁 Files' \
    --header $'CTRL-O (open in browser) ╱ ALT-E (open in editor)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git file {-1}" \
    --bind "alt-e:execute:${EDITOR:-vim} {-1} > /dev/tty" \
    --preview "git diff --no-ext-diff --color=always -- {-1} | sed 1,4d; $_fzf_git_cat {-1}" "$@" |
  cut -c4- | sed 's/.* -> //'
}

_fzf_git_branches() {
  _fzf_git_check || return "$?"
  bash "$__fzf_git" branches |
  ble/contrib/integration:fzf-git/fzf --ansi \
    --border-label '🌲 Branches' \
    --header-lines 2 \
    --tiebreak begin \
    --preview-window down,border-top,40% \
    --color hl:underline,hl+:underline \
    --no-hscroll \
    --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git branch {}" \
    --bind "alt-a:change-prompt(🌳 All branches> )+reload:bash \"$__fzf_git\" all-branches" \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' "$@" |
  sed 's/^..//' | cut -d' ' -f1
}

_fzf_git_tags() {
  _fzf_git_check || return "$?"
  git tag --sort -version:refname |
  ble/contrib/integration:fzf-git/fzf --preview-window right,70% \
    --border-label '📛 Tags' \
    --header $'CTRL-O (open in browser)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git tag {}" \
    --preview 'git show --color=always {}' "$@"
}

_fzf_git_hashes() {
  _fzf_git_check || return "$?"
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  ble/contrib/integration:fzf-git/fzf --ansi --no-sort --bind 'ctrl-s:toggle-sort' \
    --border-label '🍡 Hashes' \
    --header $'CTRL-O (open in browser) ╱ CTRL-D (diff) ╱ CTRL-S (toggle sort)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git commit {}" \
    --bind 'ctrl-d:execute:grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git diff > /dev/tty' \
    --color hl:underline,hl+:underline \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git show --color=always' "$@" |
  awk 'match($0, /[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]*/) { print substr($0, RSTART, RLENGTH) }'
}

_fzf_git_remotes() {
  _fzf_git_check || return "$?"
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  ble/contrib/integration:fzf-git/fzf --tac \
    --border-label '📡 Remotes' \
    --header $'CTRL-O (open in browser)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git remote {1}" \
    --preview-window right,70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {1}/"$(git rev-parse --abbrev-ref HEAD)"' "$@" |
  cut -d$'\t' -f1
}

_fzf_git_stashes() {
  _fzf_git_check || return "$?"
  git stash list | ble/contrib/integration:fzf-git/fzf \
    --border-label '🥡 Stashes' \
    --header $'CTRL-X (drop stash)\n\n' \
    --bind 'ctrl-x:execute-silent(git stash drop {1})+reload(git stash list)' \
    -d: --preview 'git show --color=always {1}' "$@" |
  cut -d: -f1
}

_fzf_git_lreflogs() {
  _fzf_git_check || return "$?"
  git reflog --color=always --format="%C(blue)%gD %C(yellow)%h%C(auto)%d %gs" | ble/contrib/integration:fzf-git/fzf --ansi \
    --border-label '📒 Reflogs' \
    --preview 'git show --color=always {1}' "$@" |
  awk '{print $1}'
}

_fzf_git_each_ref() {
  _fzf_git_check || return "$?"
  bash "$__fzf_git" refs | ble/contrib/integration:fzf-git/fzf --ansi \
    --nth 2,2.. \
    --tiebreak begin \
    --border-label '☘️  Each ref' \
    --header-lines 2 \
    --preview-window down,border-top,40% \
    --color hl:underline,hl+:underline \
    --no-hscroll \
    --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git {1} {2}" \
    --bind "alt-e:execute:${EDITOR:-vim} <(git show {2}) > /dev/tty" \
    --bind "alt-a:change-prompt(🍀 Every ref> )+reload:bash \"$__fzf_git\" all-refs" \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {2}' "$@" |
  awk '{print $2}'
}
#------------------------------------------------------------------------------

# export FZF_DEFAULT_OPTS=--no-unicode

: "${_ble_contrib_fzf_git_config=key-binding}"

# original
function ble/contrib:integration/fzf-git/type:original/init {
  ble/builtin/bind '"\er": redraw-current-line'
}
function ble/contrib:integration/fzf-git/type:original {
  local binding='"\C-g\C-'$1'": "$(_fzf_git_'$2')\e\C-e\er"'
  ble/builtin/bind "$binding"
}
# function ble/contrib:integration/fzf-git/type:original {
#   local binding='"\C-g\C-'$1'": "$(_fzf_git_'$2')\M-\C-e\M-\C-l"'
#   bind "$binding"
# }

function ble/widget/fzf-git {
  ble/widget/insert-string "$(_fzf_git_$1)"
  ble/textarea#invalidate
}

# key-binding
function ble/contrib:integration/fzf-git/type:key-binding {
  ble-bind -f "C-g C-$1" "fzf-git $2"
}

# sabbrev
function ble/contrib:integration/fzf-git/type:sabbrev/init {
  function fzf-git.sabbrev {
    COMPREPLY=$(_fzf_git_$1)
    ble/textarea#invalidate
  }
}
function ble/contrib:integration/fzf-git/type:sabbrev {
  ble-sabbrev -m "g$1"="fzf-git.sabbrev $2"
}

# arpeggio
function ble/contrib:integration/fzf-git/type:arpeggio/init {
  ble-import 'lib/vim-arpeggio.sh'
}
function ble/contrib:integration/fzf-git/type:arpeggio {
  ble/lib/vim-arpeggio.sh/bind -f "g$1" "fzf-git $2"
}

# old-functions
function ble/contrib:integration/fzf-git/type:old-functions/init {
  function is_in_git_repo { _fzf_git_check "$@"; }
  function fzf-down { ble/contrib/integration:fzf-git/fzf "$@"; }
}
function ble/contrib:integration/fzf-git/type:old-functions {
  # Note: To suppress duplicate adjustment of the terminal states, we override
  # "_ble_term_state" with the temporary environment. I.e., when fzf is called
  # through these old function names, we never adjust the terminal states.
  builtin eval "function g$1 { _ble_term_state= _fzf_git_$2 \"\$@\"; }"
}

function ble/contrib:integration/fzf-git/initialize {
  local type
  for type in original key-binding sabbrev arpeggio old-functions; do
    [[ :$_ble_contrib_fzf_git_config: == *:"$type":* ]] || continue

    ble/function#try ble/contrib:integration/fzf-git/type:"$type"/init
    ble/contrib:integration/fzf-git/type:"$type" f files
    ble/contrib:integration/fzf-git/type:"$type" b branches
    ble/contrib:integration/fzf-git/type:"$type" t tags
    ble/contrib:integration/fzf-git/type:"$type" h hashes
    ble/contrib:integration/fzf-git/type:"$type" r remotes
    ble/contrib:integration/fzf-git/type:"$type" s stashes
    ble/contrib:integration/fzf-git/type:"$type" l lreflogs
    ble/contrib:integration/fzf-git/type:"$type" e each_ref
  done
  builtin unset -f "$FUNCNAME"
}
ble/contrib:integration/fzf-git/initialize
