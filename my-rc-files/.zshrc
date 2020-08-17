# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	fzf
	git
	zsh-autosuggestions
	zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# go script
function to {
	if [ $# -gt 1 ]; then
		/usr/local/go/bin/go "$@"
	elif [ "x$1" = "x" ]; then
		echo "Directories:"
		for i in ~/.go-dirs/*
		do
			printf "%20s %s\n" `basename $i` `cat $i`
		done
	else
		cd `cat ~/.go-dirs/$1`
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

function swap {
	mv $1 .$1.tmp
	mv $2 $1
	mv .$1.tmp $2
}

function tst {
	if [ $# -eq 0 ]; then
		echo "Usage: test [TEST_NAME] [FILES_TO_CARRY...]"
	else
		name=$1
		_tst_path="$HOME/work/test/$name"
		shift
		echo $_tst_path
		mkdir $_tst_path
		cp "$@" $_tst_path
		cd $_tst_path
	fi
}

function bkup {
	if [ $# -ne 1 ]; then
		echo "Usage: bkup [FILE_NAME]"
	else
		cp $1 .$1.bkup
	fi
}

function piu {
	cp "$@" ~/.piupia/
}

function pia {
	mv ~/.piupia/* .
}

function issh {
	cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
}

# normal alias
alias g++='g++ -std=c++14 -g -Wall'
alias mc='make -s  clean'
alias mr='make -s run'
alias gpo='git push origin'
alias sl="ls"

# grep alias
alias grep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias hg='history | grep'
alias ag='alias | grep'

# rc file alias
alias zrc="vi ~/.zshrc"
alias zhs="vi ~/.zsh_history"
alias vrc="vi ~/.vimrc"
alias so="source ~/.zshrc"

# docker command alias
alias dps="docker ps"
alias dst="docker stop"
alias drm="docker rm"

# tmux
alias tls="tmux ls"
alias tns="tmux new -s"
alias tas="tmux a -t"

# terraform
alias tinit="terraform init"
alias tvali="terraform validate"
alias tplan="terraform plan"

alias dcd='dev cd'
alias dcl='dev clone'
alias dup='dev up'
alias ddn='dev down'
alias dud='dev update'


#fzf

# open files from gsb output
function fsb() {
	vim -o `gss | awk '{print $2}' | fzf`
}
alias fvi='vi $(fzf)'

export GOPATH='/home/jim/go'
export PATH=$PATH:/usr/local/go/bin

eval $(thefuck --alias f) # sudo pip3 install thefuck
