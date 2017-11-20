if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
   source /usr/local/etc/bash_completion.d/git-prompt.sh
   source /usr/local/etc/bash_completion.d/git-completion.bash
   export GIT_PS1_SHOWUNTRACKEDFILES=1
   export PS1='[\u@\h \W:$(__git_ps1)]\$ '
fi

if [ -f /usr/local/etc/bash_completion.d/nodebrew ]; then
   source /usr/local/etc/bash_completion.d/nodebrew
fi

# Make bash check it's window size after a process completes
shopt -s checkwinsize

# for alias
alias ls='ls -G'
alias ll='ls -lavG'
alias less=lv
alias safari="open -a Safari"
alias prev="open -a Preview"
# alias cot="open -a CotEditor"
# alias firefox="open -a Firefox"
# alias exl="open -a 'Microsoft Excel'"
# alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
