# :pencil: Integration with `fzf`

## Configure fzf's `completion` and `key-bindings`

In the following cases, a special care is needed to make it work with `ble.sh`.

- When you want to load fzf's `completion.bash` (sometimes installed at
  `/etc/bash_completion.d/fzf` or `/usr/share/bash-completion/completions/fzf`)
  or `key-bindings.bash`.
- When you want to load fzf's settings by `eval "$(fzf --bash)"` (supported by
  `fzf >= 0.48.0`).

We require those settings to be loaded through our modules :pencil:
[`contrib/integration/fzf-completion`](https://github.com/akinomyoga/blesh-contrib/blob/master/integration/fzf-completion.bash)
and :pencil:
[`contrib/integration/fzf-key-bindings`](https://github.com/akinomyoga/blesh-contrib/blob/master/integration/fzf-key-bindings.bash).

> [!IMPORTANT]
> If you want to integrate fzf's `completion.bash` with
> [`bash-completion`](https://github.com/scop/bash-completion),
> `bash-completion` needs to be loaded before fzf's `completion.bash` is
> loaded.

> [!IMPORTANT]
> In the Bash sessions where `ble.sh` is loaded, fzf's settings loaded
> elsewhere needs to be disabled.  If you want to support the case without
> `ble.sh`, please enable the fzf's settings conditionally when `ble.sh` is not
> loaded.

There are several ways to configure them.

### Option 1: Set up in `~/.blerc`

The current recommended way is to directly write settings in your `.blerc` as follows:

```bash
# blerc

# If ble/contrib/integration/fzf cannot find the fzf directory, please set the
# following variable "_ble_contrib_fzf_base" manually.  The value
# "/path/to/fzf-directory" should be replaced by a path to the fzf directory
# such as "$HOME/.fzf" or "/usr/share/fzf" that contain
# "shell/{completion,key-bindings}.bash" or "{completion,key-bindings}.bash".

#_ble_contrib_fzf_base=/path/to/fzf-directory


# Note: If you would like to combine fzf-completion with bash_completion, you
# need to load bash_completion earlier than fzf-completion.

#source -- /path/to/bash_completion.sh


# Set up fzf
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
```

#### When you have additional settings for fzf

The option `-d` of `ble-import` in the above example means the asynchronous
loading of the modules.  If you need to immediately load the module, please
drop the option `-d`.  For example, if the user needs to call a function
defined in a module, the module can be loaded immediately, so that the user can
use the function.

```bash
ble-import integration/fzf-completion
_fzf_set_up_completion foo bar
```

However, in most cases, the user would probably want to reserve the execution
of the commands relying on the module by using the `-C callback` option.  In
this way, the reserved command is evaluated when the module is successfully
loaded.

```bash
ble-import -d integration/fzf-completion \
  -C '_fzf_set_up_completion foo bar'
```

### Option 2: Set up in `~/.fzf.bash`

If you have `~/.fzf.bash` for the fzf settings, you can rewrite your
`.fzf.bash` in the following way.  In this case, `.fzf.bash` needs to be
sourced after `ble.sh`.  Please replace `/path/to/fzf-directory`,
`/path/to/fzf/...` and `/path/to/bash_completion.sh` if necessary.

```bash
# fzf.bash

# If ble/contrib/integration/fzf cannot find the fzf directory, please set the
# following variable "_ble_contrib_fzf_base" manually.  The value
# "/path/to/fzf-directory" should be replaced by a path to the fzf directory
# such as "$HOME/.fzf" or "/usr/share/fzf" that contain
# "shell/{completion,key-bindings}.bash" or "{completion,key-bindings}.bash".

#_ble_contrib_fzf_base=/path/to/fzf-directory

# Setup fzf
# ---------
if [[ ! "$PATH" == *"/path/to/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ $- == *i* ]]; then
  # Note: If you would like to combine fzf-completion with bash_completion, you
  # need to load bash_completion earlier than fzf-completion.

  #source -- /path/to/bash_completion.sh

  if [[ ${BLE_VERSION-} ]]; then
    ble-import -d integration/fzf-completion
  else
    source -- /path/to/fzf/shell/completion.bash 2> /dev/null
  fi
fi

# Key bindings
# ------------
if [[ ${BLE_VERSION-} ]]; then
  ble-import -d integration/fzf-key-bindings
else
  source -- /path/to/fzf/shell/key-bindings.bash
fi
```

## :pencil: `integration/fzf-completion`

The module `integration/fzf-completion` mentioned above also provides a widget.

### Widget `fzf-complete`

This widget performs fzf's completion normally triggered by the key `**`.

```
widget: fzf-complete [type]

  @param[in,opt] type
    This specifies the type of the completion.  The shell function
    "_fzf_${type}_completion" is used to perform the '**' completion.  The
    values available by default are "path", "file", "dir", "proc", "host",
    "var", and "alias".
```

## :pencil: `integration/fzf-git`

If you want to use
[`junegunn/fzf-git.sh`](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)
(fzf settings for `git` formerly provided as a
[Gist](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)) with
`ble.sh`, you instead need to use :pencil:
[`contrib/integration/fzf-git`](https://github.com/akinomyoga/blesh-contrib/blob/master/integration/fzf-git.bash).

```bash
# bashrc / fzf.bash
if [[ ${BLE_VERSION-} ]]; then
  # If needed. See above for details:
  #_ble_contrib_fzf_base=/path/to/fzf-directory

  _ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
  ble-import -d integration/fzf-git
fi
```

Or you can configure it in `~/.blerc`:

```bash
# blerc

# If needed. See above for details:
#_ble_contrib_fzf_base=/path/to/fzf-directory

_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
ble-import -d integration/fzf-git
```

The shell variable `_ble_contrib_fzf_git_config` is a colon-separated list of the enabled types of bindings.
The value `key-binding` enables the key bindings of the form <kbd>C-g C-f</kbd>, <kbd>C-g C-b</kbd>, <kbd>C-g C-t</kbd>, <kbd>C-g C-h</kbd>, <kbd>C-g C-r</kbd>, and <kbd>C-g C-s</kbd>.
The value `sabbrev` enables the sabbrev expansion for the words `gf`, `gb`, `gt`, `gh`, `gr`, and `gs`.
The value `arpeggio` enables the simultaneous key combinations of <kbd>g f</kbd>, <kbd>g b</kbd>, <kbd>g t</kbd>, <kbd>g h</kbd>, <kbd>g r</kbd>, and <kbd>g s</kbd>.
The value `old-functions` enables old function names: `is_in_git_repo`, `fzf-down`, `gh`, `gb`, `gt`, `gh`, `gr`, and `gs`.

## :pencil: `integration/fzf-menu`

This module configures so that when the menu completion is started, fzf is
started instead of `menu-complete` built in `ble.sh`.

```bash
# blerc

ble-import -d integration/fzf-menu
```
