#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install curl -y
sudo apt-get install valgrind -y

# for neovim
sudo apt-get install ripgrep -y
sudo apt-get install fd-find -y

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

