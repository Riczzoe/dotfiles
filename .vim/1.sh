echo "Setting up dotfiles"
if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]; then
    ln -fs ~/dotfiles/.vim/.wsl_vimrc ~/.vimrc
else
    ln -fs ~/dotfiles/.vim/.normal_vimrc ~/.vimrc
fi
