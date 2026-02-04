#!/bin/bash

# installing deps
sudo apt update && sudo apt upgrade -y
sudo apt-get install curl -y
sudo apt-get install valgrind -y
sudo apt-get install ripgrep -y
sudo apt-get install fd-find -y
sudo apt-get install cppman -y
sudo apt install build-essential procps curl file git -y

# install zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install tmux -y
sudo apt install kitty -y

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install neovim


echo "setup symbolic links"
# set conf files
ln -fns $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -fns $HOME/.dotfiles/.tmux $HOME/.tmux
ln -fns $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -fns $HOME/.dotfiles/nvim $HOME/.config/nvim

