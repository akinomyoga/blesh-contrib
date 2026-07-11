[ Languages: **English** | [日本語](README-ja.md) (Japanese) ]

# blesh-contrib
Settings for [akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh)

Unless otherwise specified, files in this repository are provided under the
[BSD 3-clause license](LICENSE).  The files in `airline` are provided under the
MIT License.  The details are explained in sub-pages:


## &#x2699; Integration with `fzf` and `skim`

This includes the following modules.  The details are described in
[integration/fzf.md](integration/fzf.md).

- :pencil: Module `integration/fzf-initialize`
- :pencil: Module `integration/fzf-completion`
- :pencil: Module `integration/fzf-key-bindings`
- :pencil: Module `integration/fzf-git`
- :pencil: Module `integration/fzf-menu`
- :pencil: Module `integration/skim-completion`
- :pencil: Module `integration/skim-initialize`
- :pencil: Module `integration/skim-key-bindings`

## &#x2699; Other integrations

- :pencil: Module `integration/bash-preexec`

The following modules will be automatically loaded by `ble.sh` when necessary.

- :pencil: Module `integration/bash-completion`
- :pencil: Module `integration/nix-completion`
- :pencil: Module `integration/zoxide`

## &#x2699; Theming and coloring

The colorglass module can be used to adjust the global behavior of the colors
of `ble.sh`'s interface.  This can be used to perform various color
manipulations, including gamma correction, color blending, hue rotation,
saturation, monochrome, and color blindness emulation.

- :pencil: Module [`colorglass`](colorglass.md)

## &#x2699; Advanced command history

This module enables recoding of the detailed command history.  The `sqlite3`
command is required as a dependency.

- :pencil: Module `histdb`

The command history is saved in an sqlite3 database at
`~/.local/state/blesh/history@host.sqlite3`.  The query can be sent by
`ble-histdb query "<sqlite query>;"`:

```console
$ ble-histdb query .schema
$ ble-histdb query "SELECT command, issue_time FROM command_history;"
```

The statistics and graphs can be shown by the following commands:

```console
$ ble-histdb stats
$ ble-histdb calendar
$ ble-histdb week
$ ble-histdb top
```

## &#x2699; Prompt sequences

The following modules define named prompt sequences, which can be called in
`PS1`, etc. with the prompt sequence `\q{contrib/...}`.  The details are
described [here](prompt.md).

- :pencil: Module `prompt-defer`
- :pencil: Module `prompt-elapsed`
- :pencil: Module `prompt-git`
- :pencil: Module `prompt-vim-mode`

## :file_folder: Color schemes

The modules in the subdirectory `scheme` define color schemes that can be
specified to `bleopt color_scheme`.  The details are described in
[`scheme/README.md`](scheme/README.md).

- :pencil: Modules `scheme/*`

## :file_folder: Airline themes

The modules in the subdirectory `airline` define the airline themes that can be
specified to `bleopt vim_airline_theme`.

- :pencil: Modules `airline/*`

## :file_folder: Highlighting layers

The modules in the subdirectory `layer` defines the layers that can be
specified to the `_ble_highlight_layer_list` array, or the utilitities for
defining layers.

- :pencil: Modules `layer/*`

## :file_folder: Miscellaneous configurations

The modules in the subdirectory `config` provide examples of specific settings.

- :pencil: Module `config/alias-tips`
- :pencil: Module `config/execmark`
- :pencil: Module `config/github265-prompt-path-level-colors`
- :pencil: Module `config/github288-filter-sabbrev-completion`
- :pencil: Module `config/github296-named-execmark`
- :pencil: Module `config/github302-perlre-server`
- :pencil: Module `config/github481-elapsed-mark-without-command`
- :pencil: Module `config/github483-elapsed-mark-on-error`
- :pencil: Module `config/github499-append-to-last-modified`
- :pencil: Module `config/github678-expand-command-suffix`
- :pencil: Module `config/readline`
