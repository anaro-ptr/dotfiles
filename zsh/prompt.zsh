autoload -Uz vcs_info
zstyle ':vcs_info:*' format '(%s)[%b]'
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="
%{${fg[cyan]}%}%~%1(v|%F{green}%1v%f|)
%{${fg[white]}%}[%n@%m] %# "

RPROMPT="" # "%1(v|%F{green}%1v%f|)"
