# for lang
export LANG=ja_JP.UTF-8

# PATH
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin
export PATH

# ANSI Color
export LSCOLORS=gxfxcxdxbxegedabagacad

# 
# for export
# 
export PS1='[\u@\h \W]\$ '
# If not running interactively, don't do anything
test -z "$PS1" && return

export BLOCKSIZE=k

# 
# editor
# 
# PSQL_EDITOR
# if test -x /usr/local/bin/emacs; then
#     EDITOR=/usr/local/bin/emacs; export EDITOR
# else
#     EDITOR=/usr/bin/emacs; export EDITOR
# fi
# export SVN_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
# export GIT_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# LV
if test -x /usr/local/bin/lv; then
  PAGER=/usr/local/bin/lv; export PAGER
  LV="-E'$EDITOR +%d'"; export LV
else
  PAGER=/usr/bin/less; export PAGER
fi
export LESSCHARSET=utf-8

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bash_local ]; then
   source ~/.bash_local
fi

######################################
# rbenv
# https://github.com/sstephenson/rbenv
######################################
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#source ~/.rbenv/completions/rbenv.bash

######################################
# nodebrew
######################################
if [ -f /usr/local/bin/nodebrew ]; then
   export PATH=$HOME/.nodebrew/current/bin:$PATH
   export NODEBREW_ROOT=/usr/local/var/nodebrew
fi
