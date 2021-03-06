setopt aliases

# ls
case "${OSTYPE}" in
darwin*)
  alias ls='ls -F -G' ;;
linux*)
  alias ls='ls -F --color=auto' ;;
esac
alias ll='ls -l'
alias la='ls -la'

# grep
alias gr='grep --color=auto'
alias fgr='fgrep --color=auto'
alias egr='egrep --color=auto'

# rm
alias rm='rm -i'

# git
alias g='git'
alias ga='g add'
alias gb='g branch'
alias gc='g commit'
alias gca='g commit --amend'
alias gcah='g commit --amend -C HEAD'
alias gco='g checkout'
alias gchp='g cherry-pick'
alias gd='g diff'
alias gds='g diff --staged'
alias gf='g fetch'
alias gfp='g fetch --prune'
alias ggr='g grep'
alias ggr='g grep'
alias gl='g log'
alias glr='g log --reverse'
alias gm='g merge'
alias gmv='g mv'
alias gr='g rebase'
alias grm='g rm'
alias grs='g reset'
alias grsh='g reset --hard'
alias gs='g stash'
alias gsh='g show'
alias gsp='g stash pop'
alias gst='g status'
alias gtr='g tree'

# Homebrew
alias b='brew'
alias bi='brew install'
alias bs='brew search'
alias bu='brew update'
alias bug='brew upgrade'

# tmux
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
