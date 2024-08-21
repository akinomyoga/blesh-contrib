# &#x2699; Prompt sequences

## :pencil: `contrib/prompt-vim-mode`

Source: [`prompt-vim-mode.bash`](https://github.com/akinomyoga/blesh-contrib/blob/master/prompt-vim-mode.bash)

### Prompt sequence `\q{contrib/vim-mode}`

This prompt sequence expands to the vim mode name.

```bash
# blerc (example)

ble-import contrib/prompt-vim-mode
PS1='[\u@\h \W]\q{contrib/vim-mode}\$ ' # show mode name in PS1
bleopt keymap_vi_mode_show:=            # hide mode line
```

## :pencil: `contrib/prompt-git`

Source: [`prompt-git.bash`](https://github.com/akinomyoga/blesh-contrib/blob/master/prompt-git.bash)

```bash
# blerc (example)

ble-import contrib/prompt-git
bleopt prompt_rps1='\q{contrib/git-info}'
```

### Prompt sequence `\q{contrib/git-info}`

This expands to a string that explains the current git status.

### Prompt sequence `\q{contrib/git-name}`

This expands to the directory name of the repository.

### Prompt sequence `\q{contrib/git-hash N}`

This expands to the commit hash.
The hash is truncated to the length `N`.
The default value for `N` is `7`.

### Prompt sequence `\q{contrib/git-branch}`

This expands to the branch name (or tag name or hash) of `HEAD`.

### Prompt sequence `\q{contrib/git-path}`

This expands to the current path relative to the root directory of the repository.

## :pencil: `contrib/prompt-elapsed`

Source: [`prompt-elapsed.bash`](https://github.com/akinomyoga/blesh-contrib/blob/master/prompt-elapsed.bash)

Measures the time of the previous command execution.

```bash
# blerc (example)

ble-import contrib/prompt-elapsed
bleopt prompt_rps1='\g{fg=69,italic}\q{contrib/elapsed}'
```

### Prompt sequence `\q{contrib/elapsed}`

This expands to the high-resolution elapsed time for the command execution.

### Prompt sequence `\q{contrib/elapsed-real}`

This expands to the `real` time of `time`.

### Prompt sequence `\q{contrib/elapsed-user}`

This expands to the `user` time of `time`.

### Prompt sequence `\q{contrib/elapsed-sys}`

This expands to the `sys` time of `time`.

### Prompt sequence `\q{contrib/elapsed-cpu}`

This expands to the average cpu usage.
