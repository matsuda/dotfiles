#!/bin/zsh

# set -e : エラーが発生したらスクリプトを終了
# set -u : 未定義の変数を使ったらエラー
set -eu

# 現在のスクリプトのディレクトリを取得
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🔧 Installing dotfiles from: $DOTFILES_DIR"
echo "📦 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# 対象となる dotfile の一覧
DOTFILES=(
  "emacs"
  "gemrc"
  "gitconfig"
  "gitignore"
  "inputrc"
  "irbrc"
  "lvrc"
  "rvmrc"
  "screenrc"
  "sqliterc"
  "zshenv"
  "zshrc"
)

# 各ファイルに対してシンボリックリンクを作成
for file in $DOTFILES; do
  src="$DOTFILES_DIR/dot.$file"
  dest="$HOME/.$file"

  if [[ -L "$dest" || -f "$dest" ]]; then
    echo "⚠️  $dest が既に存在します。バックアップします。"
    mv "$dest" "$BACKUP_DIR/"
  fi

  echo "➡️  $src → $dest"
  ln -s "$src" "$dest"
done

echo "✅ すべてのシンボリックリンクを作成しました！"
