# for lang
export LANG=ja_JP.UTF-8

# for macports
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export MANPATH="/usr/local/man:/usr/share/man:"
test -d /opt && export PATH=/opt/local/bin:/opt/local/sbin:$PATH && export MANPATH=/opt/local/share/man:$MANPATH

# for alias
alias less=lv
alias ls="ls -la"
alias emacsc="open -a Emacs"
# alias mate="open -a TextMate"

# for export
export EDITOR=emacs
export GIT_EDITOR=emacs
# export GIT_EDITOR=mate
export PAGER=lv
export LV="-E'emacs +%d'"
export BLOCKSIZE=k
export LESSCHARSET=utf-8
