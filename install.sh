#!/bin/bash

# installing deps
sudo apt update && sudo apt upgrade -y
sudo apt-get install curl -y
sudo apt-get install valgrind -y
sudo apt-get install ripgrep -y
sudo apt-get install fd-find -y
sudo apt-get install cppman -y

# install zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# set conf files
ln -s ./.gitconfig $HOME/.gitconfig
ln -s ./.tmux $HOME/.tmux
ln -s ./.zshrc $HOME/.zshrc
ln -s ./nvim $HOME/.config/nvim

