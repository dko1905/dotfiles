# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source ~/.zgen/zgen.zsh

if ! zgen saved; then
	# Oh-my-zsh plugins
	zgen oh-my-zsh
	zgen oh-my-zsh themes/gentoo

	zgen save
fi

# Fix FUCKING gpg2 bug
export GPG_TTY=$(tty)
# Use vim
export EDITOR=vim

# Best aliases ever
alias sls='/bin/ls -lh --color=auto'
alias ls='exa -lh'

# Rarely use these
alias xi='xbps-install -S'
alias xr='xbps-remove -R'
alias xq='xbps-query -R'
alias xs='xbps-query -Rs'

# Setup display on lxd
if [ -n "$DISPLAY" ]; then
	echo "ok" > /dev/null
else
	# I use this place as a lxd test
	export DISPLAY=:0
	export PATH=$PATH:/snap/bin
fi
