\[ Language: [English](README.md) | **日本語** ]

# blesh-contrib
[akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh)向けの設定

特に指定のない限りこのリポジトリのファイルは [3条項 BSD ライセンス](LICENSE) で提供されます。
サブディレクトリ `airline` 以下のファイルは MIT ライセンスで提供されます。

<sup>〔訳註: これは[2020年5月20日（日本標準時）時点のREADME.md](https://github.com/akinomyoga/blesh-contrib/blob/8d89d469bd46d9d1158ab5295cd48a3df6942074/README.md) (8d89d46)の，技術的内容を変更しない日本語訳です〕</sup>

## :pencil: fzfとの統合

### 選択肢その1: `~/.fzf.bash`内で設定する

fzfを`ble.sh`と共に用いたい場合，`.fzf.bash`を次のように書き直します（`/path/to/fzf`は fzf ディレクトリへのパスに置き換えてください。※fzf バイナリではなくて **fzf ディレクトリ**へのパスです）。

```bash
# fzf.bash

# fzfの設定
# ---------

_ble_contrib_fzf_base=/path/to/fzf
if [[ ! "$PATH" == *"$_ble_contrib_fzf_base/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi

# 自動補完
# ---------------
if [[ ${BLE_VERSION-} ]]; then
  ble-import -d integration/fzf-completion
else
  [[ $- == *i* ]] && source "$_ble_contrib_fzf_base/shell/completion.bash" 2> /dev/null
fi

# キー束縛
# ------------
if [[ ${BLE_VERSION-} ]]; then
  ble-import -d integration/fzf-key-bindings
else
  source "$_ble_contrib_fzf_base/shell/key-bindings.bash"
fi
```

### 選択肢その2: `~/.blerc`内で設定する

別の方法として，`blerc`において次のように直接設定を書くこともできます（`/path/to/fzf`は各人のfzfへのパスに置き換えてください）。
この場合，`.fzf.bash`を`.bashrc`の中で呼び出さ（`source`コマンドを用い）ないでください。

```bash
# blerc

# fzfの設定
_ble_contrib_fzf_base=/path/to/fzf
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
```

## :pencil: fzf-git

[fzf-git](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)での設定を`ble.sh`と共に用いるには，次のように設定してください。

```bash
# bashrc / fzf.bash
if [[ ${BLE_VERSION-} ]]; then
  _ble_contrib_fzf_base=/path/to/fzf
  _ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
  ble-import -d integration/fzf-git
fi
```

または，`~/.blerc`内でも構成できます:

```bash
# blerc
_ble_contrib_fzf_base=/path/to/fzf
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
ble-import -d integration/fzf-git
```

シェル変数`$_ble_contrib_fzf_git_config`には，有効にする束縛の種別をコロン区切りで列挙します。
`key-binding`という値で，次の形式のキー束縛を有効にします: <kbd>C-g C-f</kbd>, <kbd>C-g C-b</kbd>, <kbd>C-g C-t</kbd>, <kbd>C-g C-h</kbd>及び<kbd>C-g C-r</kbd>。
`sabbrev`という値で，次の語に対する静的略語展開を有効にします: `gf`, `gb`, `gt`, `gh`及び`gr`。
`arpeggio`という値で，次のキーの組み合わせを同時に押下できるようにします: <kbd>g f</kbd>, <kbd>g b</kbd>, <kbd>g t</kbd>, <kbd>g h</kbd>及び<kbd>g r</kbd>。

## :pencil: プロンプトシーケンス

### プロンプトシーケンス `\q{contrib/vim-mode}`

この指定はVimのモード名に展開されます。 

```bash
# blerc（例）
ble-import contrib/prompt-vim-mode
PS1='[\u@\h \W]\q{contrib/vim-mode}\$ ' # PS1にモード名を表示
bleopt keymap_vi_mode_show:=            # モード行を表示しない
```
