[ Languages: **English** | [日本語](README-ja.md) (Japanese) ]

# blesh-contrib
Settings for [akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh)

## :pencil: fzf integration

### Option 1: Setup in `~/.fzf.bash`

If you want to use fzf with `ble.sh`, you can rewrite your `.fzf.bash` in the following way (please replace `/path/to/fzf` by your fzf path):

```bash
# fzf.bash

# Setup fzf
# ---------
_ble_contrib_fzf_base=/path/to/fzf
if [[ ! "$PATH" == *"$_ble_contrib_fzf_base/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-completion
else
  [[ $- == *i* ]] && source "$_ble_contrib_fzf_base/shell/completion.bash" 2> /dev/null
fi

# Key bindings
# ------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-key-bindings
else
  source "$_ble_contrib_fzf_base/shell/key-bindings.bash"
fi
```

### Option 2: Setup in `~/.blerc`

Or, you can directly write settings in your `blerc` as follows (please replace `/path/to/fzf` by your fzf path).
In this case do not source `.fzf.bash` in your `.bashrc`.

```bash
# blerc

# Setup fzf
_ble_contrib_fzf_base=/path/to/fzf
ble-import -d contrib/fzf-completion
ble-import -d contrib/fzf-key-bindings
```

## :pencil: `contrib/fzf-git`

You can use [fzf-git](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236) settings for `ble.sh` with the following settings.

```bash
# bashrc / fzf.bash
if [[ $BLE_VERSION ]]; then
  _ble_contrib_fzf_base=/path/to/fzf
  _ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
  ble-import -d contrib/fzf-git
fi
```

Or you can configure it in `~/.blerc`:

```bash
# blerc
_ble_contrib_fzf_base=/path/to/fzf
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
ble-import -d contrib/fzf-git
```

The shell variable `_ble_contrib_fzf_git_config` is a colon-separated list of the enabled types of bindings.
The value `key-binding` enables the key bindings of the form <kbd>C-g C-f</kbd>, <kbd>C-g C-b</kbd>, <kbd>C-g C-t</kbd>, <kbd>C-g C-h</kbd> and <kbd>C-g C-r</kbd>.
The value `sabbrev` enables the sabbrev expansion for the words `gf`, `gb`, `gt`, `gh` and `gr`.
The value `arpeggio` enables the simultaneous key combinations of <kbd>g f</kbd>, <kbd>g b</kbd>, <kbd>g t</kbd>, <kbd>g h</kbd> and <kbd>g r</kbd>.

# &#x2699; Prompt sequences

## :pencil: `contrib/prompt-vim-mode`

### `\q{contrib/vim-mode}`

This prompt sequence expands to the vim mode name.

```bash
# blerc (example)

ble-import contrib/prompt-vim-mode
PS1='[\u@\h \W]\q{contrib/vim-mode}\$ ' # show mode name in PS1
bleopt keymap_vi_mode_show:=            # hide mode line
```

## :pencil: `contrib/prompt-git`

```bash
# blerc (example)

ble-import contrib/prompt-git
bleopt rps1='\q{contrib/git-info}'
```

### `\q{contrib/git-info}`

This expands to a string that explains the current git status.

### `\q{contrib/git-name}`

This expands to the directory name of the repository.

### `\q{contrib/git-hash N}`

This expands to the commit hash.
The hash is truncated to the length `N`.
The default value for `N` is `7`.

### `\q{contrib/git-branch}`

This expands to the branch name (or tag name or hash) of `HEAD`.

### `\q{contrib/git-path}`

This expands to the current path relative to the root directory of the repository.
