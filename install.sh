#!/usr/bin/env bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/discord/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install neovim
brew install autojump
brew install bat

mkdir -p ~/.local/share/nvim/site/autoload/

mkdir -p ~/.config/nvim

ln -s -f ~/dotfiles/vim/* ~/.config/nvim
