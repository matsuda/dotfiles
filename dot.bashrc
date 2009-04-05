#alias less=lv
alias ls="ls -la"
alias emacsc="open -a emacs"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export MANPATH="/usr/local/man:/usr/share/man:"

test -d /opt && export PATH=/opt/local/bin:/opt/local/sbin:$PATH && export MANPATH=/opt/local/share/man:$MANPATH

export LANG=ja_JP.UTF-8

export EDITOR=emacs
export GIT_EDITOR="mate -w"
export PAGER=lv
export LV="-E'emacs +%d'"
export BLOCKSIZE=k
export LESSCHARSET=utf-8

alias mate="open -a TextMate"
