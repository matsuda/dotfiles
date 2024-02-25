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
# https://sue445.hatenablog.com/entry/2012/08/30/005627
#
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
#source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
#PROMPT='[%n@%m:%~]$(__git_ps1 " (%s)")%# '

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

######################################
# git
######################################
function gitmain() {
  git config --global user.name "matsuda"
  git config --global user.email "kosukematsuda@gmail.com"
  source ~/.zshrc
}

function gitsub() {
  git config --global user.name "mtsd"
  git config --global user.email "mtsd@live.com"
  source ~/.zshrc
}

######################################
# rbenv
######################################
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

######################################
# nodebrew
######################################
if [ -f /usr/local/bin/nodebrew ]; then
   export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

######################################
# nodenv
######################################
if [ -e "$HOME/.nodenv" ]; then
    export PATH=$HOME/.nodenv/bin:$PATH
    eval "$(nodenv init -)"
fi

######################################
# flutter
######################################
if [ -e "$HOME/Dev/flutter/bin" ]; then
    export PATH="$PATH:$HOME/Dev/flutter/bin"
fi

######################################
# flutterfire (firebase for flutter)
######################################
if [ -e "$HOME/.pub-cache" ]; then
    export PATH="$PATH":"$HOME/.pub-cache/bin"
fi

######################################
# adb
######################################
if [ -d $HOME/Library/Android/sdk/platform-tools ]; then
   export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
fi
