# aliases
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias la='ll'

alias rm='rm -i'

alias gr='grep --color=auto'
alias fgr='fgrep --color-auto'
alias egr='egrep --color-auto'

alias b='brew'
alias g='git'
alias t='tmux'
alias ta='tmux attach'

# completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
