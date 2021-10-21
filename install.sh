#!/usr/bin/env bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/discord/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -f ~/dotfiles/zsh/.aliases ~/.aliases
ln -s -f ~/dotfiles/zsh/.zshrc ~/.zshrc

brew install neovim
brew install autojump
brew install bat

mkdir -p ~/.local/share/nvim/site/autoload/
mkdir -p ~/.config/nvim

ln -s -f ~/dotfiles/vim/* ~/.config/nvim
