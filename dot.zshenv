# for Charset
export LANG=ja_JP.UTF-8

# ANSI Color
export LSCOLORS=gxfxcxdxbxegedabagacad

export BLOCKSIZE=k

# PATH
######################################
# homebrew
######################################
# for Apple silicon
export PATH="/opt/homebrew/bin:$PATH"
# for Intel
#export PATH=/usr/local/bin:$PATH

# LV
if test -x /usr/local/bin/lv; then
  PAGER=/usr/local/bin/lv; export PAGER
  LV="-E'$EDITOR +%d'"; export LV
else
  PAGER=/usr/bin/less; export PAGER
fi
export LESSCHARSET=utf-8


#if [ -f ~/.zshrc ]; then
#   source ~/.zshrc
#fi

#if [ -f ~/.zsh_local ]; then
#   source ~/.zsh_local
#fi

######################################
# rbenv
# https://github.com/sstephenson/rbenv
######################################
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
