echo "Switching to home dir"
pushd ~

echo "Installing tmux"
sudo apt install tmux

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
ln -fs ~/dotfiles/.vimrc ~/.vimrc
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.tmux.conf ~/.tmux.conf

