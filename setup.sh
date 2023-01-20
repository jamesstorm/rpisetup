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
  tmux \
  -y



# ZSH
#
echo "ZSH"
sudo apt install zsh -y
chsh -s $(which zsh)
# ZSH - oh-my-zsh
echo "on-my-zsh"
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Powerlevel10k ZSH Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
wget https://github.com/jamesstorm/prime/blob/afb4c65ef5906df460490f5abb50c69daf8d4e5a/.zshrc
ln -f ~/rpisetup/.zshrc ~/.zshrc


#Snap - so that I can install the latest nvim

#sudo apt install snapd
#echo "REMINDER!!! You might need to reboot and run again because snap"
sudo snap install core

#Neovim
sudo snap install nvim --edge --classic
echo "REMINDER!!! You need to add /snap/bin to path at the top of .zshrc"
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
gh repo clone jamesstorm/nvim /home/$USERNAME/.config/nvim

#Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
gh auth login


screenfetch


