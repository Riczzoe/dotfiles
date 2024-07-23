# config zsh
zsh ./shell-tools/zsh/config_zprezto.sh

if [ ! -f ~/.zshrc ]; then
    touch ~/.zshrc
fi

echo "source $(pwd)/shell-tools/zsh/alias.zsh" >> ~/.zshrc
echo "source $(pwd)/shell-tools/zsh/exports.zsh" >> ~/.zshrc
echo "source $(pwd)/shell-tools/zsh/pyenv.zsh" >> ~/.zshrc
ln -fs $(pwd)/shell-tools/zsh/zpreztorc ~/.zpreztorc


# config vim
ln -fs $(pwd)/shell-tools/vim/settings ~/.vim/settings
ln -fs $(pwd)/shell-tools/vim/keymap ~/.vim/keymap
ln -fs $(pwd)/shell-tools/vim/plugconfig ~/.vim/plugconfig
ln -fs $(pwd)/shell-tools/vim/vimrc ~/.vimrc
ln -fs $(pwd)/shell-tools/vim/gvimrc ~/.gvimrc

# config tmux
ln -fs $(pwd)/shell-tools/tmux/tmux.conf ~/.tmux.conf

# config mpv
ln -fs $(pwd)/desktop-tools/mpv ~/.config
