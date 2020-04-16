# blesh-contrib
Settings for [akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh)

## :pencil: fzf integration

### Option 1: Setup in `~/.fzf.bash`

If you want to use fzf with `ble.sh`, you can rewrite your `.fzf.bash` in the following way (please replace `/path/to/fzf` by your fzf path):

```bash
# fzf.bash

# Setup fzf
# ---------

if [[ ! "$PATH" == *"/path/to/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-completion
else
  [[ $- == *i* ]] && source "/path/to/fzf/shell/completion.bash" 2> /dev/null
fi

# Key bindings
# ------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-key-bindings
else
  source "/path/to/fzf/shell/key-bindings.bash"
fi
```

### Option 2: Setup in `~/.blerc`

Or, you can directly write settings in your `blerc` as follows (please replace `/path/to/fzf` by your fzf path).
In this case do not source `.fzf.bash` in your `.bashrc`.

```bash
# blerc

# Setup fzf
if [[ ! "$PATH" == *"/path/to/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi
ble-import -d contrib/fzf-completion
ble-import -d contrib/fzf-key-bindings
```

## :pencil: fzf-git

You can use [fzf-git](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236) settings for `ble.sh` with the following settings.

```bash
# bashrc / fzf.bash
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
[[ $BLE_VERSION ]] &&
  ble-import -d contrib/fzf-git
```

Or you can configure it in `~/.blerc`:

```bash
# blerc
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
ble-import -d contrib/fzf-git
```

The shell variable `_ble_contrib_fzf_git_config` is a colon separated list of the type of bindings.
`key-binding` is the key bindings of the form <kbd>C-g C-f</kbd>, <kbd>C-g C-b</kbd>, <kbd>C-g C-t</kbd>, <kbd>C-g C-h</kbd> and <kbd>C-g C-r</kbd>.
`sabbrev` is the sabbrev expansion for the words `gf`, `gb`, `gt`, `gh` and `gr`.
`arpeggio` is the simultaneous key combinations of <kbd>g f</kbd>, <kbd>g b</kbd>, <kbd>g t</kbd>, <kbd>g h</kbd> and <kbd>g r</kbd>.


