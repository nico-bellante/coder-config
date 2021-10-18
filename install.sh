/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install neovim

mkdir -p "~/.local/share/nvim/site/autoload/"

mkdir -p "~/.config/nvim"

cp -r "vim/*" "~/.config/nvim/"
