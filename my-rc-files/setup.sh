# use sudo to run script
SETUP_DIR=$PWD
APPS="zsh git curl tmux fzf"

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

mkdir -p ~/work/setup

cd ~/work/setup
git clone https://github.com/vim/vim.git && cd vim/src && make && make install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


cd $SETUP_DIR
cp .zshrc ~
cp .vimrc ~

mkdir ~/.go-dirs

echo 'please run: source ~/.zshrc'
