# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.zgen/zgen.zsh

if ! zgen saved; then
	# Oh-my-zsh plugins
	zgen oh-my-zsh
	zgen oh-my-zsh themes/gentoo

	zgen save
fi
