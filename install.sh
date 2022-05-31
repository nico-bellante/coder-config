#!/bin/bash

set -e

echo "Checking if Homebrew is installed..."

if test ! $(which brew); then
  echo "Installing Homebrew..."
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    
    echo "Running apt-get update..."
    sudo apt-get -y update
    
    echo "Installing developer tools..."
    sudo apt-get -y install build-essential

    echo "Installing net-tools"
    sudo apt-get -y install net-tools
  fi
else
  echo "Homebrew is already installed..."
fi

brew install coreutils



# zsh
if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -s -f ~/dotfiles/zsh/.aliases ~/.aliases
ln -s -f ~/dotfiles/zsh/.zshrc ~/.zshrc

brew install zsh
brew install neovim
brew install autojump
brew install bat
brew install rg

# Update and Upgrade
echo "Updating and upgrading Homebrew..."
yes | brew update
yes | brew upgrade


sudo npm install -g typescript typescript-language-server
sudo npm install -g pyright

mkdir -p ~/.local/share/nvim/site/autoload/
mkdir -p ~/.config/nvim

ln -s -f ~/dotfiles/vim/* ~/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
