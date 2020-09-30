# use sudo to run script

set -xe

SETUP_DIR=$PWD
HOME=$(eval echo ~${SUDO_USER})

APPS="zsh curl tmux fzf"

OS="`uname`"

case $OS in
	'Linux')
		OS='Linux'
		apt-get install $APPS
		apt remove --assume-yes vim-tiny && apt update && apt install --assume-yes vim
		cp -a .tmux.conf.linux $HOME/.tmux.conf
		;;
	'Darwin')
		OS='Mac'
		brew install $APPS
		cp -a .tmux.conf.darwin $HOME/.tmux.conf
		;;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
	echo "Could not install Oh My Zsh" >/dev/stderr
	exit 1
}
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


cd $SETUP_DIR
cp -a .zshrc $HOME
cp -a .vimrc $HOME

mkdir $HOME/.go-dirs

echo 'please run: source ~/.zshrc'
