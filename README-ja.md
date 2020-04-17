# blesh-contrib
[akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh)向けの設定

<sup>〔訳註: これは[2020年4月16日時点のREADME.md](https://github.com/akinomyoga/blesh-contrib/blob/4adcf89e0d6fdc334f72da8354754c37435d2ec8/README.md)の，技術的内容を変更しない日本語訳です〕</sup>

## :pencil: fzfとの統合

### 選択肢その1: `~/.fzf.bash`内で設定する

fzfを`ble.sh`と共に用いたい場合，`.fzf.bash`を次のように書き直します（`/path/to/fzf`は各人のfzfへのパスに置き換えてください）。

```bash
# fzf.bash

# fzfの設定
# ---------

if [[ ! "$PATH" == *"/path/to/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi

# 自動補完
# ---------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-completion
else
  [[ $- == *i* ]] && source "/path/to/fzf/shell/completion.bash" 2> /dev/null
fi

# キー束縛
# ------------
if [[ $BLE_VERSION ]]; then
  ble-import -d contrib/fzf-key-bindings
else
  source "/path/to/fzf/shell/key-bindings.bash"
fi
```

### 選択肢その2: `~/.blerc`内で設定する

別の方法として，`blerc`において次のように直接設定を書くこともできます（`/path/to/fzf`は各人のfzfへのパスに置き換えてください）。
この場合，`.fzf.bash`を`.bashrc`の中で呼び出さ（`source`コマンドを用い）ないでください。

```bash
# blerc

# fzfの設定
if [[ ! "$PATH" == *"/path/to/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}/path/to/fzf/bin"
fi
ble-import -d contrib/fzf-completion
ble-import -d contrib/fzf-key-bindings
```

## :pencil: fzf-git

[fzf-git](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)での設定を`ble.sh`と共に用いるには，次のように設定してください。

```bash
# bashrc / fzf.bash
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
[[ $BLE_VERSION ]] &&
  ble-import -d contrib/fzf-git
```

または，`~/.blerc`内でも構成できます:

```bash
# blerc
_ble_contrib_fzf_git_config=key-binding:sabbrev:arpeggio
ble-import -d contrib/fzf-git
```

シェル変数`$_ble_contrib_fzf_git_config`にはコロン区切りで束縛の型を列挙します。
`key-binding`はキー束縛の形式であり，内容は<kbd>C-g C-f</kbd>, <kbd>C-g C-b</kbd>, <kbd>C-g C-t</kbd>, <kbd>C-g C-h</kbd>及び<kbd>C-g C-r</kbd>です。
`sabbrev`は静的略語展開する単語であり，内容は`gf`, `gb`, `gt`, `gh`及び`gr`です。
`arpeggio`は同時押下するキーの組み合せであり，内容は<kbd>g f</kbd>, <kbd>g b</kbd>, <kbd>g t</kbd>, <kbd>g h</kbd>及び<kbd>g r</kbd>です。
