# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# go script
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
    if ["x$1" = "x" ]; then
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
alias zrc="vi ~/.zshrc"
alias vrc="vi ~/.vimrc"
alias so="source ~/.zshrc"

# docker command alias
alias dps="docker ps"
alias dst="docker stop"
alias drm="docker rm"

# script to command alias
alias sf="/home/jim/work/scripts/sfml_compile.sh"
alias fin="/home/jim/work/scripts/devportal_ui_test_start.sh"
alias mk="/home/jim/work/scripts/makefile_generate.sh"

export PATH=~/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH=/opt/eclipse/neon:$PATH
