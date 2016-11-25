zstyle :compinstall filename '$HOME/.zshrc'

# 補完機能の有効化
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1
# プロンプトのカラー化
autoload -U colors
colors

# カラーリングの設定
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export CLICOLOR=$LS_COLORS
export TERM=xterm-256color

# autoloadされる関数を検索するパスの追加
fpath=($fpath ~/.zfunc)

source ${HOME}/.zsh/options.zsh
source ${HOME}/.zsh/aliases.zsh
source ${HOME}/.zsh/prompt.zsh
source ${HOME}/.zsh/paths.zsh

if [ -f "${HOME}/.zsh/locals.zsh" ]; then
  source ${HOME}/.zsh/locals.zsh
fi

# 重複したパスの自動削除
typeset -U path cdpath fpath manpath
