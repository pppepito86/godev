#!/bin/bash

set -e -x

add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
apt-get -y update
apt-get -y clean

apt-get install -y curl git gcc make python-dev vim-nox jq cgroup-lite silversearcher-ag

# install go
apt-get install golang -y
mkdir -p /go/src
mkdir -p /go/bin
echo "GOPATH=/go" >> /etc/environment
echo "GOBIN=/go/bin" >> /etc/environment
source /etc/environment

# Set up vim for golang development
git clone https://github.com/luan/vimfiles.git $HOME/.vim
curl vimfiles.luan.sh/install | bash

# set up bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
~/.bash_it/install.sh --silent
echo "echo -e -n \"\x1b[\x35 q\"" > ~/.bash_it/custom/cursor.sh

# Set up tmux
wget -O $HOME/.tmux.conf https://raw.githubusercontent.com/luan/dotfiles/master/tmux.conf
