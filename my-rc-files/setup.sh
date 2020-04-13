# use sudo to run script
APPS="zsh git curl vim-common vim-doc vim-runtime vim-gnome tmux fzf"

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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


cp .zshrc ~
cp .vimrc ~

mkdir ~/.go-dirs

echo 'please run: source ~/.zshrc'
