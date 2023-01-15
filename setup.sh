#!/bin/sh

USERNAME=pi

# the usual update and upgrade
sudo apt update
sudo apt upgrade -y

sudo apt install \
  apt-transport-https \
  ca-certificates \
  software-properties-common \
  zsh \
  cockpit \
  screenfetch \
  snapd \
  core \
  -y


chsh -s $(which zsh)
# ZSH - oh-my-zsh
echo "on-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Powerlevel10k ZSH Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#Snap - so that I can install the latest nvim

#sudo apt install snapd
#echo "REMINDER!!! You might need to reboot and run again because snap"
#sudo snap install core

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


screenfetch


