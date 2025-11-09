#!/usr/bin/env zsh

# Git prompt (__git_ps1) のロード（自動ダウンロード対応）
if ! command -v git >/dev/null 2>&1; then
    echo "Git がインストールされていません"
else
    # Git の git-prompt.sh の場所候補
    GIT_PROMPT_FILES=(
        "/usr/share/git/completion/git-prompt.sh"
        "/usr/share/git-core/contrib/completion/git-prompt.sh"
        "$HOME/.git-prompt.sh"
    )

    __git_ps1_loaded=false

    for f in "${GIT_PROMPT_FILES[@]}"; do
        if [ -f "$f" ]; then
            source "$f"
            __git_ps1_loaded=true
            break
        fi
    done

    # なければ自動でダウンロード
    if [ "$__git_ps1_loaded" = false ]; then
        echo "git-prompt.sh が見つからないためダウンロードします..."
        curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
        source ~/.git-prompt.sh
    fi
fi
