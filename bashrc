# .bashrc

appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath $HOME/.local/bin
appendpath $HOME/.local/opt/maple/bin
appendpath $HOME/.local/opt/dotnet
appendpath $HOME/.local/opt/MultiMC/bin
appendpath $HOME/.fly/bin
appendpath $HOME/.local/share/pnpm
appendpath $HOME/.local/opt/zig-linux-x86_64-0.10.0-dev

# Setup XDG directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#export XDG_DATA_DIRS=$HOME/.local/share/
export MANPATH=:$HOME/.local/share/man
export FLYCTL_INSTALL=$HOME/.fly
export GOPATH=$HOME/.local/go
export PNPM_HOME=$HOME/.local/share/pnpm

export EDITOR=vim
alias code=code-oss
alias sxiv=nsxiv
alias sl='sl -a'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function fgcolor() {
	echo -ne "\[\e[38;5;$1m\]"
}
function resetcolor() {
	echo -ne "\[\e[0m\]"
}

alias ls='ls --color=auto'
PS1="$(fgcolor 13)\h$(resetcolor) in $(fgcolor 226)\W$(resetcolor) $(fgcolor 2)->$(resetcolor) "

