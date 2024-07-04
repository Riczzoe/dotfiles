#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

echo $(pwd)

OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi

    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

# ===============================
# Backup old dotfiles
# ===============================
echo "[dotfiles] [Backup] Backing up old dotfiles"
backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.tmux.conf
backup_if_exists ~/.profile

# ===============================
# Config Terminal
# ===============================

echo "[dotfiles] [Terminal]"
# install zsh
echo "[dotfiles] [Terminal] Installing zsh"
sudo apt install zsh
echo "[dotfiles] [Terminal] Configuring zsh"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
sudo bash ./shell-tools/zsh/config_zprezto.sh
if [ ! -f ~/.zshrc ]; then
    touch ~/.zshrc
fi
echo "source $(pwd)/shell-tools/zsh/alias.zsh" >> ~/.zshrc
echo "source $(pwd)/shell-tools/zsh/exports.zsh" >> ~/.zshrc
echo "source $(pwd)/shell-tools/zsh/pyenv.zsh" >> ~/.zshrc
ln -fs $(pwd)/shell-tools/zsh/zpreztorc ~/.zpreztorc

# install vim
echo "[dotfiles] [Terminal] Installing vim"
sudo apt install vim-gtk3
echo "[dotfiles] [Terminal] Configuring vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs $(pwd)/shell-tools/vim/settings ~/.vim/settings
ln -fs $(pwd)/shell-tools/vim/keymap ~/.vim/keymap
ln -fs $(pwd)/shell-tools/vim/plugconfig ~/.vim/plugconfig
ln -fs $(pwd)/shell-tools/vim/vimrc ~/.vimrc
sudo curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&apt-get install -y nodejs

# install bat
echo "[dotfiles] [Terminal] Installing bat"
sudo apt install bat
echo "[dotfiles] [Terminal] Configuring bat"
ln -fs $(pwd)/shell-tools/bat ~/.config/bat

# install tmux
echo "[dotfiles] [Terminal] Installing tmux"
sudo apt install tmux
echo "[dotfiles] [Terminal] Configuring tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -fs $(pwd)/shell-tools/tmux/tmux.conf ~/.tmux.conf
sudo apt install  xsel
sudo ln -s $(pwd)/shell-tools/tmux/tmux-window-list.sh /usr/local/bin/tmux-window-list

# install tree
echo "[dotfiles] [Terminal] Installing tree"
sudo apt install tree

# install ffmpeg
echo "[dotfiles] [Terminal] Installing ffmpeg"
sudo apt install ffmpeg

echo "[dotfiles] [Terminal] Installing mediainfo"
sudo apt install mediainfo


# ===============================
# Gnome Desktop Environment
# ===============================
# add Flatpak support
echo "[dotfiles] [Gnome Desktop Environment] Adding Flatpak support"
sudo apt install flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# remove libreoffice
echo "[dotfiles] [Gnome Desktop Environment] Removing libreoffice"
sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome libreoffice-gtk3 libreoffice-help-common libreoffice-help-en-us libreoffice-style-colibre libreoffice-style-elementary

echo "[dotfiles] [Gnome Desktop Environment] Installing flameshot"
sudo apt install flameshot

echo "[dotfiles] [Gnome Desktop Environment] Installing mpv"
sudo apt install mpv
ln -fs $(pwd)/desktop-tools/mpv ~/.config

echo "[dotfiles] [Gnome Desktop Environment] Beautify"
mkdir -p ~/util/gnome-theme/ ~/util/gnome-wallpapers/

echo "[dotfiles] [Gnome Desktop Environment] Installing WhiteSur-gtk-theme"
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/util/gnome-theme/WhiteSur-gtk-theme
~/util/gnome-theme/WhiteSur-gtk-theme/install.sh -m -l -c Light --round
sudo ./tweaks.sh -g

# install trash
echo "[dotfiles] [Gnome Desktop Environment] Installing trash"
sudo apt install trash-cli

# ===============================
# Config Development Environment
# ===============================
echo "[dotfiles] [Development Environment]"
# install java
echo "[dotfiles] [Development Environment] Installing java"
sudo apt install openjdk-17-jdk

# install python
echo "[dotfiles] [Development Environment] Installing python"
sudo apt install python3
