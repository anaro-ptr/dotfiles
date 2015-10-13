# aliases
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias la='ll'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias g='git'
alias t='tmux'
alias ta='tmux attach'

# completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
