# for lang
export LANG=ja_JP.UTF-8

# PATH
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin
export PATH

# ANSI Color
export LSCOLORS=exfxcxdxbxegedabagacad

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
if test -x /usr/local/bin/emacs; then
    EDITOR=/usr/local/bin/emacs; export EDITOR
else
    EDITOR=/usr/bin/emacs; export EDITOR
fi
export SVN_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
export GIT_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# LV
if test -x /usr/local/bin/lv; then
  PAGER=/usr/local/bin/lv; export PAGER
  LV="-E'$EDITOR +%d'"; export LV
else
  PAGER=/usr/bin/less; export PAGER
fi
export LESSCHARSET=utf-8

if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# 各環境依存設定
[[ -e "$HOME/.bash_local" ]] && source "$HOME/.bash_local"
