# Copyright (c) 2016, 2022 Junegunn Choi
# ble/contrib/integration/fzf-git.bash (C) 2020, 2023, akinomyoga
#
# 2020-04-16 https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236 (Revision 2019-03-14)
# 2023-06-30 https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236 (Revision 2022-08-16)
# 2023-06-30 https://github.com/junegunn/fzf-git.sh/commit/4bc0323b4822b3426989863996cc266c52c7f25a

ble-import contrib/integration/fzf-initialize

[[ $- == *i* ]] || return 0

# GIT heart FZF
# -------------

# Redefine this function to change the options
_fzf_git_fzf() {
  fzf-tmux -p80%,60% --layout=reverse --multi --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_fzf_git_check() {
  git rev-parse HEAD > /dev/null 2>&1
}

# Sometimes bat is installed as batcat
export _fzf_git_cat=cat
if command -v batcat > /dev/null; then
  _fzf_git_cat="batcat --style='${BAT_STYLE:-numbers}' --color=always --pager=never"
elif command -v bat > /dev/null; then
  _fzf_git_cat="bat --style='${BAT_STYLE:-numbers}' --color=always --pager=never"
fi

_fzf_git_files() {
  _fzf_git_check || return
  (git -c color.status=always status --short
   git ls-files | grep -vf <(git status -s | grep '^[^?]' | cut -c4-) | sed 's/^/   /') |
  _fzf_git_fzf -m --ansi --nth 2..,.. \
    --prompt 'Git Files> ' \
    --preview "git diff --color=always -- {-1} | sed 1,4d; $_fzf_git_cat {-1}" |
  cut -c4- | sed 's/.* -> //'
}

_fzf_git_branches() {
  _fzf_git_check || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  _fzf_git_fzf --ansi --tac --preview-window right,70% \
    --prompt 'Git Branches> ' \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

_fzf_git_tags() {
  _fzf_git_check || return
  git tag --sort -version:refname |
  _fzf_git_fzf --preview-window right,70% \
    --prompt 'Git Tags> ' \
    --preview 'git show --color=always {}'
}

_fzf_git_hashes() {
  _fzf_git_check || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  _fzf_git_fzf --ansi --no-sort --bind 'ctrl-s:toggle-sort' \
    --prompt 'Git Hashes> ' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

_fzf_git_remotes() {
  _fzf_git_check || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  _fzf_git_fzf --tac \
    --prompt 'Git Remotes> ' \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {1}/"$(git rev-parse --abbrev-ref HEAD)"' |
  cut -d$'\t' -f1
}

_fzf_git_stashes() {
  _fzf_git_check || return
  git stash list | _fzf_git_fzf \
    --prompt 'Git Stashes> ' \
    -d: --preview 'git show --color=always {1}' |
  cut -d: -f1
}

# export FZF_DEFAULT_OPTS=--no-unicode

: "${_ble_contrib_fzf_git_config=key-binding}"

# original
function ble/contrib:integration/fzf-git/type:original/init {
  bind '"\er": redraw-current-line'
}
function ble/contrib:integration/fzf-git/type:original {
  local binding='"\C-g\C-'$1'": "$(_fzf_git_'$2')\e\C-e\er"'
  bind "$binding"
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
  function is_in_git_repo { _fzf_git_fzf "$@"; }
  function fzf-down { _fzf_git_check "$@"; }
}
function ble/contrib:integration/fzf-git/type:old-functions {
  builtin eval "function g$1 { _fzf_git_$2 \"\$@\"; }"
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
  done
  unset -f "$FUNCNAME"
}
ble/contrib:integration/fzf-git/initialize
