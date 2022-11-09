echo "Switching to home dir"
pushd ~

echo "Installing tmux"
sudo apt install tmux

echo "Installing emacs"
sudo apt install emacs

echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -d ~/.Oh-my-zsh ]; then
    echo "Uninstalling oh_my_zsh"
    zsh
    uninstall_oh_my_zsh
fi

echo "Installing zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo "Init zprezto"
zsh ~/.dotfiles/zprezto/init-zprezto.sh
echo "change zprezto config"
ln -fs ~/dotfiles/zprezto/prompt_sorin_setup ~/.zprezto/modules/prompt/functions/prompt_sorin_setup
ln -fs ~/dotfiles/zprezto/.zpreztorc ~/.zpreztorc
echo "Setting zsh"
echo "source ~/dotfiles/zshconfig" >> ~/.zshrc


echo "Setting up dotfiles"
if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]; then
    ln -fs ~/dotfiles/.vim/.wsl_vimrc ~/.vimrc
else
    ln -fs ~/dotfiles/.vim/.normal_vimrc ~/.vimrc
fi
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.tmux.conf ~/.tmux.conf


echo "Check if the environment is WSL"
source ~/dotfiles/check_env.sh
