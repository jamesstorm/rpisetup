#!/bin/sh

# the usual update and upgrade
sudo apt update
sudo apt upgrade -y

# ZSH
sudo apt install zsh -y

#OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Snap - so that I can install the latest nvim

sudo apt install snapd
echo "REMINDER!!! You might need to reboot and run again because snap"
sudo snap install core



#Neovim
sudo snap install --beta nvim --classic
echo "REMINDER!!! You need to add /snap/bin to path at the top of .zshrc"

#Screenfetch
sudo apt install screenfetch
screenfetch


