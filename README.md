# lazyvim-thirata

個人用のNeovim設定です。[LazyVim](https://github.com/LazyVim/LazyVim)を
ベースに、普段使う言語やNeovide向けの設定を追加しています。

## 主な設定

- C/C++向けのclangd、Treesitter、Doxygenハイライト
- Java、Lean、Python向けのプラグイン設定
- セマンティックトークンに合わせた独自の配色
- Neovide向けのフォントと表示倍率操作
- ウィンドウ移動、バッファ削除、コメント操作などのキーマップ
- 42 Headerと`c_formatter_42`を使ったフォーマット操作

一部の機能には、clangd、`c_formatter_42`、Nerd Fontなどの外部ツールが
必要です。

## インストール

既存の設定がある場合は、先にバックアップしてください。

```sh
git clone git@github.com:hiratannnnnn/lazyvim-thirata.git ~/.config/nvim
nvim
```

初回起動時にlazy.nvimが必要なプラグインをインストールします。

## ベースについて

このリポジトリは
[LazyVim Starter](https://github.com/LazyVim/starter)を元に作成しています。
Starterのコミット履歴と作者情報は、出典が分かるようそのまま保持しています。

元のStarterはローカルで`upstream`、この個人用リポジトリは`origin`として
登録しています。

## ライセンス

[Apache License 2.0](LICENSE)
