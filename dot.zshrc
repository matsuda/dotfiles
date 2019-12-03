# for alias
alias ls='ls -G'
alias ll='ls -lavG'
alias less=lv
alias safari="open -a Safari"
alias prev="open -a Preview"
# alias firefox="open -a Firefox"
# alias exl="open -a 'Microsoft Excel'"
# alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"


# gitコマンド保管
#
# via) https://gist.github.com/d-kuro/352498c993c51831b25963be62074afa
#
# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
# zshの補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
# Homebrewのコマンド補完を有効にする
fpath=(~/.zsh/functions/ $fpath)
# 自作した補完関数等は~/.zsh/functions/Completionに置く
fpath=(~/.zsh/functions/Completion(N-/) ${fpath})

# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
setopt correct
# SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

#
# https://qiita.com/funyatomo/items/372f02dcd4d708d218b1
#
setopt PROMPT_SUBST
source /usr/local/etc/bash_completion.d/git-prompt.sh

#GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWSTASHSTATE=1

PROMPT='[%n@%m:%~]$(__git_ps1 " (%s)")%# '

# page up/downキーでのヒストリー補完
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

# ヒストリの共有
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# プロセスを横断してヒストリを共有
setopt inc_append_history
# ヒストリの共有の有効化
setopt share_history
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
