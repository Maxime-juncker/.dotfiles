#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install curl -y
sudo apt-get install valgrind -y

# install neofetch
wget https://github.com/dylanaraps/neofetch/archive/master.zip
unzip master.zip
cd neofetch-master
sudo make install

# for neovim
sudo apt-get install ripgrep -y
sudo apt-get install fd-find -y
sudo apt-get install cppman -y

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo << eof >> ~/.zshrc
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eof

/home/linuxbrew/.linuxbrew/bin/brew install neovim
/home/linuxbrew/.linuxbrew/bin/brew install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

bash ./setup.sh

