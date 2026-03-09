#!/bin/bash

# macOS専用スクリプトのため、macOS以外では終了
if [[ "$(uname -s)" != "Darwin"* ]]; then
    echo "This script is for macOS only"
    exit 0
fi

# Xcodeのアーカイブディレクトリ
ARCHIVE_DIR="$HOME/Library/Developer/Xcode/Archives"

# 削除したいアーカイブの経過日数（例：30日以上経過したもの）
DAYS_OLD=30

# OS検出して適切なdateコマンドを使用
if [[ "$(uname -s)" == "Darwin"* ]]; then
    # macOS (BSD date)
    CUTOFF_DATE=$(date -v-${DAYS_OLD}d +%Y-%m-%d)
else
    # Linux (GNU date) - このスクリプトはmacOS専用だが念のため
    CUTOFF_DATE=$(date -d "${DAYS_OLD} days ago" +%Y-%m-%d)
fi

echo "削除対象: $CUTOFF_DATE より前のアーカイブ"

# 古いアーカイブを見つけて削除
find "$ARCHIVE_DIR" -type d -name "*.xcarchive" -print0 | while IFS= read -r -d '' archive; do
    # アーカイブの作成日を取得（macOS用）
    if [[ "$(uname -s)" == "Darwin"* ]]; then
        # macOS (BSD stat)
        CREATED_DATE=$(stat -f "%Sm" -t "%Y-%m-%d" "$archive")
    else
        # Linux (GNU stat) - このスクリプトはmacOS専用だが念のため
        CREATED_DATE=$(stat -c "%y" "$archive" | cut -d' ' -f1)
    fi

    # カットオフ日より古いかチェック
    if [[ "$CREATED_DATE" < "$CUTOFF_DATE" ]]; then
        echo "削除: $archive (作成日: $CREATED_DATE)"
        # 実際に削除する場合はコメントを外す
        rm -rf "$archive"
    fi
done

# アーカイブ削除後、空になった日付ディレクトリ（YYYY-MM-DD）を削除
find "$ARCHIVE_DIR" -mindepth 1 -maxdepth 1 -type d -name "????-??-??" -empty -print0 | while IFS= read -r -d '' empty_date_dir; do
    echo "空ディレクトリ削除: $empty_date_dir"
    rmdir "$empty_date_dir"
done

echo "クリーニング完了"
