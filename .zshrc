zstyle :compinstall filename '$HOME/.zshrc'

# 補完機能の有効化
autoload -U compinit
compinit

# プロンプトのカラー化
autoload -U colors
colors

# ディレクトリ名のみで移動
setopt auto_cd
# cd時にディレクトリスタックにpushdする
setopt auto_pushd
# ディレクトリスタックの重複不可
setopt pushd_ignore_dups
# 引数無しのpushdをpushd $HOMEへ
setopt pushd_to_home
# 絶対パスを入った変数をディレクトリとして扱う
setopt cdable_vars

# 補完候補が複数あるときに自動的にメニューをリストアップ
setopt auto_list
# 連続する補完要求があると自動的にメニューをリストアップ
setopt auto_menu
# 絶対パスが入った変数をディレクトリとして扱う
setopt auto_name_dirs
# パスが入った変数を補完した時に末尾に/を足す
setopt auto_param_slash
# 上記の設定で足された/の後にスペースを入力すると自動削除
setopt auto_remove_slash
# 補完候補の余白の自動圧縮表示
setopt list_packed
# 補完の表示順序を水平方向に
setopt list_rows_first
# 補完候補にファイル情報
setopt list_types

# ファイルグロブの有効化
setopt glob
# 拡張グロブの有効化 []の外でも^の使用可など
setopt extended_glob
# ファイルグロブで大文字小文字を区別しない
unsetopt case_glob
# =コマンドをコマンドの絶対パスに変換
setopt equals
# ファイル候補のソートで数値を正しく認識
setopt numeric_glob_sort
# lsコマンドなどでパターンマッチを複数指定した場合に
# 途中でエラーがあっても結果を表示する
setopt nomatch

# セッションが終了した際にヒストリに追記
setopt append_history
# !によるヒストリ展開の有効化
setopt bang_hist
# ヒストリ関係のビープ音をオフ
unsetopt hist_beep
# 古いヒストリの削除時に重複コマンドを優先
setopt hist_expire_dups_first
# 同じコマンドの連続は記録しない
setopt hist_ignore_dups
# 先頭にスペースがあるコマンドは記録しない
setopt hist_ignore_space
# ヒストリに関数定義は記録しない
setopt hist_no_functions
# historyコマンドは記録しない
setopt hist_no_store
# 余分なスペースを削除して記録
setopt hist_reduce_blanks
# ヒストリファイル保存時に古いコマンドと同じなら無視する
setopt hist_save_no_dups

# エイリアスの有効化
setopt aliases
# コマンド名のスペル訂正
setopt nocorrect
# スペル訂正時にDVORAK配列を前提に
setopt dvorak
# Ctrl+S, Ctrl+Qの無効化
unsetopt flow_control
# Ctrl+Dによるログアウトの抑制
setopt ignore_eof
# 対話的シェルでコメントの有効化
setopt interactive_comments
# コマンドとパスの対応にハッシュテーブルを利用
setopt hash_cmds
# コマンド名のハッシュ時にディレクトリもハッシュ化
setopt hash_dirs
# コマンドに/が含まれていても通常のパス検索を行う
setopt path_dirs
# 制御構文で短縮形の有効化
setopt short_loops

# バックグラウンドジョブを低優先度で実行
setopt bg_nice
# ジョブ制御を可能にする
setopt monitor
# バックグラウンドジョブの状態を即時表示
setopt notify
# ディレクトリを変数として扱う
set cdable_vars
# '#'以降をコメントとして扱う
setopt interactive_comments

# カラーリングの設定
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export CLICOLOR=$LS_COLORS
export TERM=xterm-256color

# ls
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

# autoloadされる関数を検索するパスの追加
fpath=($fpath ~/.zfunc)

# プロンプトの設定
setopt PROMPT_SUBST
PROMPT="[%n@%m] %{${fg[cyan]}%}%~ %{${fg[white]}%}%# "

autoload -Uz vcs_info
zstyle ':vcs_info:*' format '(%s)[%b]'
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
# 右プロンプトの設定
RPROMPT="%1(v|%F{green}%1v%f|)"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# 重複した設定の自動削除
typeset -U path cdpath fpath manpath
