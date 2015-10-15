if [[ -d ${HOME}/.rbenv/ ]]; then
	export PATH=${HOME}/.rbenv/bin:$PATH
	eval "$(rbenv init - zsh)"
fi

if [[ -s ${HOME}/.nvm/nvm.sh ]];
	then source ${HOME}/.nvm/nvm.sh
fi

if [ -d ${HOME}/.zsh/zsh-completions/src ] ; then
	fpath=(${HOME}/.zsh/zsh-completions/src $fpath)
	compinit
fi

