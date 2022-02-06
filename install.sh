#!/bin/bash

# make a separate script for installing packages 
#sudo pacman -S zsh neovim starship vim alacritty kitty

# make a link function that prints out a message if the file exists
# maybe option to overwrite

mkdir -p ~/.config/alacritty
ln -s "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/kitty
ln -s "$(pwd)/kitty/kitty.conf" ~/.config/kitty/kitty.conf

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --cmd "PlugInstall" \
		-c 'qa!'
mkdir -p ~/.config/nvim
ln -s "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim
ln -s "$(pwd)/nvim/themes" ~/.config/nvim/themes

#sh -c "$(curl -fsSL https://git.io/zinit-install)"
ln -s "$(pwd)/zsh/.zshrc" ~/.zshrc

ln -s "$(pwd)/starship/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/dunst
ln -s "$(pwd)/dunstrc" ~/.config/dunst/dunstrc

mkdir -p ~/.config/picom
ln -s "$(pwd)/picom/picom.conf" ~/.config/picon.conf
