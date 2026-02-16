#!/bin/bash


detect_os()
{
	if [ -f /etc/os-release ]; then
		. /etc/os-release # load os-release vars to env
		DISTRO=$ID
	elif [ -f /etc/redhat-release ]; then
		DISTRO="fedora"
	elif [ -f /etc/arch-release ]; then
		DISTRO="arch"
	else
		echo "Can't find os, aborting"
		exit 1
	fi
}

update_sys()
{
	case $DISTRO in
		ubuntu|debian|pop|linuxmint)
			sudo apt update && sudo	apt upgrade -y
			;;
		fedora|rhel|centos)
			sudo dnf update -y
			;;
		arch|manjaro)
			sudo pacman -Syu --noconfirm
			;;
}

install_packages() {
    case $DISTRO in
        ubuntu|debian|pop|linuxmint)
            sudo apt-get install -y curl valgrind ripgrep fd-find cppman \
                build-essential procps file git zsh tmux
            ;;
        fedora|rhel|centos)
            sudo dnf install -y curl valgrind ripgrep fd-find \
                gcc gcc-c++ make procps-ng file git zsh tmux
            sudo dnf install -y python3-pip && pip3 install cppman
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm curl valgrind ripgrep fd cppman \
                base-devel procps-ng file git zsh tmux
            ;;
    esac
}

echo "Detecting os"
detect_os
echo "Found: $DISTRO"

echo "Updating"
update_sys

echo "Installing packages"
install_packages

echo "Installing omz"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Installing homebrew"
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -d /home/linuxbrew/.linuxbrew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Installing neovim..."
brew install neovim

echo "Setting up symbolic links..."
mkdir -p "$HOME/.config"
ln -fns "$HOME/.dotfiles/.tmux" "$HOME/.tmux.conf"
ln -fns "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -fns "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
