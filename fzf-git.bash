# ble/contrib/fzf-git.bash (C) 2020, akinomyoga
# Ported from https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236

ble-import contrib/fzf-initialize

[[ $- == *i* ]] || return 0

# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
             --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
    cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf-down --ansi --multi --tac --preview-window right:70% \
             --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}

gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
    fzf-down --multi --preview-window right:70% \
             --preview 'git show --color=always {} | head -'$LINES
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
             --header 'Press CTRL-S to toggle sort' \
             --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
    grep -o "[a-f0-9]\{7,\}"
}

gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
             --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
    cut -d$'\t' -f1
}

# export FZF_DEFAULT_OPTS=--no-unicode

: "${_ble_contrib_fzf_git_config=key-binding}"

if [[ :$_ble_contrib_fzf_git_config: == *:original:* ]]; then
  bind '"\er": redraw-current-line'
  bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
  bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
  bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
  bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
  bind '"\C-g\C-r": "$(gr)\e\C-e\er"'

  # bind '"\C-g\C-f": "$(gf)\M-\C-e\M-\C-l"'
  # bind '"\C-g\C-b": "$(gb)\M-\C-e\M-\C-l"'
  # bind '"\C-g\C-t": "$(gt)\M-\C-e\M-\C-l"'
  # bind '"\C-g\C-h": "$(gh)\M-\C-e\M-\C-l"'
  # bind '"\C-g\C-r": "$(gr)\M-\C-e\M-\C-l"'
fi

if [[ :$_ble_contrib_fzf_git_config: == *:key-binding:* ]]; then
  function ble/widget/fzf-git {
    ble/widget/insert-string "$($1)"
    ble/textarea#invalidate
  }
  ble-bind -f 'C-g C-f' 'fzf-git gf'
  ble-bind -f 'C-g C-b' 'fzf-git gb'
  ble-bind -f 'C-g C-t' 'fzf-git gt'
  ble-bind -f 'C-g C-h' 'fzf-git gh'
  ble-bind -f 'C-g C-r' 'fzf-git gr'
fi

if [[ :$_ble_contrib_fzf_git_config: == *:sabbrev:* ]]; then
  function fzf-git.sabbrev {
    COMPREPLY=$($1)
    ble/textarea#invalidate
  }
  ble-sabbrev -m gf='fzf-git.sabbrev gf'
  ble-sabbrev -m gb='fzf-git.sabbrev gb'
  ble-sabbrev -m gt='fzf-git.sabbrev gt'
  ble-sabbrev -m gh='fzf-git.sabbrev gh'
  ble-sabbrev -m gr='fzf-git.sabbrev gr'
fi

if [[ :$_ble_contrib_fzf_git_config: == *:arpeggio:* ]]; then
  ble-import 'lib/vim-arpeggio.sh'
  ble/lib/vim-arpeggio.sh/bind -f 'gf' 'fzf-git gf'
  ble/lib/vim-arpeggio.sh/bind -f 'gb' 'fzf-git gb'
  ble/lib/vim-arpeggio.sh/bind -f 'gt' 'fzf-git gt'
  ble/lib/vim-arpeggio.sh/bind -f 'gh' 'fzf-git gh'
  ble/lib/vim-arpeggio.sh/bind -f 'gr' 'fzf-git gr'
fi
