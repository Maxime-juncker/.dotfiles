#!/bin/bash

DIR="$HOME"
BIN_DIR="$DIR/bin"

mkdir -p $DIR
mkdir -p $BIN_DIR

#
# intall homebrew
#
mkdir -p $DIR/homebrew
if [ "$(ls -A $DIR/homebrew)" ]; then
    echo "Homebrew directory is not empty, skipping"
else
    echo installing homebrew
    export HOMEBREW_PREFIX="$DIR/apps"
    git clone https://github.com/Homebrew/brew $DIR/homebrew
    eval "$($DIR/homebrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"

    ln -fns $DIR/homebrew/bin/brew $BIN_DIR/brew
fi

#
# installing oh-my-zsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ "$(ls -A $HOME/.oh-my-zsh/custom/themes/powerlevel10k)" ]; then
    echo "powerlevel10k directory is not empty, skipping"
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi
#
# install kitty
#
mkdir -p $HOME/.local/kitty.app
if [ "$(ls -A $HOME/.local/kitty.app)" ]; then
    echo "Kitty directory is not empty, skipping"
else
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    ln -fns $HOME/.local/kitty.app/bin/kitty $BIN_DIR/kitty
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list

    xdg-mime default org.kde.dolphin.desktop inode/directory
fi

#
# install neovim
#
mkdir -p $DIR/neovim
if [ "$(ls -A $DIR/neovim)" ]; then
    echo "neovim directory is not empty, skipping"
else
    echo downlading neovim
    wget -O $DIR/neovim/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz 2> /dev/null
    echo extracting neovim
    tar -xvzf $DIR/neovim/nvim-linux-x86_64.tar.gz -C $DIR/neovim > /dev/null
    rm $DIR/neovim/nvim-linux-x86_64.tar.gz

    ln -fns $DIR/neovim/nvim-linux-x86_64/bin/nvim $BIN_DIR/nvim
    ln -fns $HOME/.dotfiles/nvim $HOME/.config/
    echo neovim OK
fi

#
# neovim
#
mkdir -p $DIR/neovim
if [ "$(ls -A $DIR/neovim)" ]; then
    echo "neovim directory is not empty, skipping"
else
    echo downlading neovim
    wget -O $DIR/neovim/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz 2> /dev/null
    echo extracting neovim
    tar -xvzf $DIR/neovim/nvim-linux-x86_64.tar.gz -C $DIR/neovim > /dev/null
    rm $DIR/neovim/nvim-linux-x86_64.tar.gz

    ln -fns $DIR/neovim/nvim-linux-x86_64/bin/nvim $BIN_DIR/nvim
    ln -fns $HOME/.dotfiles/nvim $HOME/.config/
    echo neovim OK
fi

#
# discord
#
mkdir -p $DIR/Discord
if [ "$(ls -A $DIR/Discord)" ]; then
    echo "discord directory is not empty, skipping"
else
    echo downlading discord
    curl -L https://discord.com/api/download\?platform\=linux\&format\=tar.gz --output $DIR/discord.tar.gz
    echo extracting discord
    tar -xvzf $DIR/discord.tar.gz -C $DIR > /dev/null
    rm $DIR/discord.tar.gz

    ln -fns $DIR/Discord/Discord $BIN_DIR/discord
    cp $DIR/Discord/discord.desktop ~/.local/share/applications/
    echo 'discord.desktop' > ~/.config/xdg-terminals.list

    xdg-mime default org.kde.dolphin.desktop inode/directory

    echo discord OK
fi

#
# neofetch
#
mkdir -p $DIR/neofetch
if [ "$(ls -A $DIR/neofetch)" ]; then
    echo "neofetch directory is not empty, skipping"
else	
    git clone https://github.com/dylanaraps/neofetch $DIR/neofetch
	ln -fns $DIR/neofetch/neofetch $BIN_DIR/neofetch
    echo neofetch OK
fi

printf "setting up sym links\n"
ln -fns $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -fns $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -fns $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

echo Done
