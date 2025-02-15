#!/bin/bash

# Ensure system is up to date
sudo dnf update -y

# Install required dependencies
sudo dnf install -y curl git procps

# Download and install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the shell profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc

# Apply changes
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Verify installation
brew --version


# install brew
brew install zsh

# installing omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


ln -fns ~/.dotfiles/.zshrc ~/.zshrc
ln -fns ~/.dotfiles/.gitconfig ~/.gitconfig
ln -fns ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -fns ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
