# use sudo to run script
APPS="git vim-common vim-doc vim-runtime vim-gnome tmux fzf"

OS="`uname`"

case $OS in
	'Linux')
		OS='Linux'
		apt-get install $APPS
		cp .tmux.conf.linux ~
		;;
	'Darwin')
		OS='Mac'
		brew install $APPS
		cp .tmux.conf.darwin ~
		;;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .zshrc ~
cp .vimrc ~
mkdir ~/.go-dirs
source ~/.zshrc
save script
