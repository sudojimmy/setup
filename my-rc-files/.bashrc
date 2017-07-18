# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mc='make -s  clean'
alias mr='make -s'
alias sea='history | grep'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
function go {
	if [ "x$1" = "x" ]; then
		echo "Directories:"
		for i in ~/.go-dirs/*
		do
			printf "%20s %s\n" `basename $i` `cat $i`
		done
	else
		cd `cat ~/.go-dirs/$1`
	fi
}
function go {
	if [ "x$1" = "x" ]; then
		echo "Directories:"
		for i in ~/.go-dirs/*
		do
			printf "%20s %s\n" `basename $i` `cat $i`
		done
	else
		cd `cat ~/.go-dirs/$1`
	fi
}

function pgo {
	if ["x$1" = "x"	]; then
		echo "Missing argument"
	else
		pushd `cat ~/.go-dirs/$1`
	fi
}

function save {
	if [ "x$1" = "x" ]; then
		echo "Missing argument"
	else
		pwd > ~/.go-dirs/$1
	fi
}

function unsave {
	rm -v ~/.go-dirs/$1
}

function vd {
	vi */**/$1
}

function vg {
	vi `gss | awk '{print $2}' | grep -o "\S*$@.*\..*" `
}

#function vf {
#	$(!!) | awk '{print $1}' | grep $1 | cut -f '1' -d ':' | xargs vi
#}

function vU {
	vi `gss | grep 'U' | awk '{print $2}'`
}

# normal alias
alias g++='g++ -std=c++14 -g -Wall'
alias mc='make -s  clean'
alias mr='make -s'
alias learn='man $(ls /bin | shuf | head -1)'
alias s='ssh -Y j585zhan@linux.student.cs.uwaterloo.ca'
alias gdb="gdbtui"
alias gpo='git push origin'
alias gaa='git add --all'
alias gl='git pull'
alias gcl='git clone'
alias ggpush='git push origin'
alias gcam='git commit -a -m'
alias gb='git branch'
alias gd='git diff'
alias gco='git checkout'
alias gsb='git status -sb'

# vim alias
alias bi="vi"
alias vo="vi"
alias vu="vi"
alias vbi="vi"
alias vui="vi"
alias vio="vi"
alias iv="vi"
alias scd='cd'
alias sl="ls"
alias ks="ls"
alias og="go"
alias gp="go"
alias gi="go"

# grep alias
alias grep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias hg='history | grep'
alias ag='alias | grep'

# rc file alias
alias brc="vi ~/.bashrc"
alias vrc="vi ~/.vimrc"
alias so="source ~/.bashrc"

# docker command alias
alias dps="docker ps"
alias dst="docker stop"
alias drm="docker rm"

# script to command alias
alias mk="/home/jim/work/scripts/makefile_generate.sh"
