#!/usr/bin/env bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install neovim

mkdir -p "~/.local/share/nvim/site/autoload/"

mkdir -p "~/.config/nvim"

ln -s "./vim/*" "~/.config/nvim"
