if [ -f ~/git-completion.bash ]; then
   source ~/git-completion.bash
   export PS1='[\u@\h \W:$(__git_ps1)]\$ '
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
