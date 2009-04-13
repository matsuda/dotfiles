# for lang
export LANG=ja_JP.UTF-8

# Make bash check it's window size after a process completes
shopt -s checkwinsize

# for macports
PATH="/usr/bin:/usr/sbin:/bin:/sbin"
MANPATH="/usr/share/man"
test -d /usr/local && PATH=/usr/local/bin:/usr/local/sbin:$PATH &&
                      MANPATH=/usr/local/share/man:$MANPATH
test -d /usr/X11   && PATH=$PATH:/usr/X11/bin &&
                      MANPATH=$MANPATH:/usr/X11/man
test -d /opt       && PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:$PATH &&
                      MANPATH=/opt/local/share/man:$MANPATH
export PATH MANPATH

# export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH="/usr/local/man:/usr/share/man:"
# test -d /opt && export PATH=/opt/local/bin:/opt/local/sbin:$PATH && export MANPATH=/opt/local/share/man:$MANPATH

# for alias
alias ls='ls -lav'
alias less=lv
alias emacsc="open -a Emacs"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
# alias mate="open -a textmate"
alias cot="open -a CotEditor"
alias exl="open -a 'Microsoft Excel'"

# 
# for export
# 
# export PS1='\u \w$'
export PS1='[\u@\h \W]\$ '
# If not running interactively, don't do anything
test -z "$PS1" && return

export BLOCKSIZE=k

# 
# editor
# 
if test -x /opt/local/bin/emacs; then
	EDITOR=/opt/local/bin/emacs; export EDITOR
else
	EDITOR=/usr/bin/emacs; export EDITOR
fi

export SVN_EDITOR=emacs
# export SVN_EDITOR="mate -w"
export GIT_EDITOR=emacs
# export GIT_EDITOR="mate -w"

# LV
if test -x /opt/local/bin/lv; then
  PAGER=/opt/local/bin/lv; export PAGER
  LV="-E'$EDITOR +%d'"; export LV
else
  PAGER=/usr/bin/less; export PAGER
fi
export LESSCHARSET=utf-8

# ???
# umask 22
# ulimit -c unlimited
# ulimit -d unlimited
# ulimit -s 65532
# ulimit -u 532
# ulimit -n 10240
