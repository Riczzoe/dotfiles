sudo ln -fs $(pwd)/shell-tools/tmux/tmux-window-list.sh /usr/local/bin/tmux-window-list

sudo mkdir -p /etc/keyd
sudo ln -fs $(pwd)/shell-tools/keyd/keyd.conf /etc/keyd/default.conf
sudo systemctl enable keyd && sudo systemctl start keyd
