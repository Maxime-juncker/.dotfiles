#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --noconfirm curl valgrind ripgrep fd cppman unzip wget make base-devel

# Install neofetch (from official repos, easier than manual build)
sudo pacman -S --noconfirm neofetch

# --- OR if you really want to build manually (not needed usually) ---
# wget https://github.com/dylanaraps/neofetch/archive/master.zip
# unzip master.zip
# cd neofetch-master
# sudo make install
# cd ..
# rm -rf neofetch-master master.zip

# Install Homebrew (same as on Ubuntu)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.zshrc

# Install packages with Homebrew
/home/linuxbrew/.linuxbrew/bin/brew install neovim zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run your setup script
bash ./setup.sh
