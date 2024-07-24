
sudo apt remove --purge  gnome-2048 gnome-chess gnome-klotski hitori gnome-sudoku gnome-nibbles gnome-robots tali gnome-taquin gnome-tetravex swell-foop shotwell gnome-sound-recorder quadrapassel gnome-mines gnome-mahjongg gnome-music gnome-maps lightsoff  gnome-contacts cheese rhythmbox simple-scan evince transmission-gtk firefox-esr totem evolution aisleriot five-or-more four-in-a-row libreoffice-* iagno totem gnome-color-manager gnome-weather 

sudo apt install curl gnome-tweaks mpv zathura xsel ffmpeg mediainfo tree ibus-libpinyin vim-gtk3 build-essential cmake tmux git gdb valgrind zsh flatpak gnome-software-plugin-flatpak trash-cli

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.miniconda3\
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/.miniconda3/miniconda.sh\
bash ~/.miniconda3/miniconda.sh -b -u -p ~/.miniconda3\
trash ~/.miniconda3/miniconda.sh\
~/.miniconda3/bin/conda init bash\

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
