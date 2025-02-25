printf "installing nerd font\n"

$FILE="~/Downloads/jetbrainfont.tar.xz"

wget --content-disposition -O "$FILE" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.tar.xz"
tar -xzf "$FILE" -C "~/Downloads/jetbrainfont"

mkdir -p ~/.local/share/fonts
mv /tmp/jetbrainfont/*.ttf ~/.local/share/fonts/
fc-cache -fv
printf "done\n"

printf "setting up config files\n"
ln -fns ~/.dotfiles/.zshrc ~/.zshrc
ln -fns ~/.dotfiles/.gitconfig ~/.gitconfig
ln -fns ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -fns ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

# nvim
ln -fns ~/.dotfiles/nvim ~/.config/


printf "done\n"
