#!/bin/sh

USERNAME=pi

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
sudo snap install nvim --edge --classic
echo "REMINDER!!! You need to add /snap/bin to path at the top of .zshrc"

#Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
gh auth login
gh repo clone jamesstorm/prime /home/$USERNAME/prime


#Screenfetch
sudo apt install screenfetch
screenfetch


