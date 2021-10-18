#!/usr/bin/env bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/discord/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


brew install neovim

mkdir -p "~/.local/share/nvim/site/autoload/"

mkdir -p "~/.config/nvim"

ln -s -f "./vim/*" "~/.config/nvim"