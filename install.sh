#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install curl

# for neovim
sudo apt-get install ripgrep -y
sudo apt-get install fd-find -y


sudo apt-get install neovim -y
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

bash ./setup.sh

