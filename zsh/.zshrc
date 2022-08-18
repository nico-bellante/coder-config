export ZSH="/home/discord/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(gitfast autojump fzf)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

autoload -Uz compinit
compinit

_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh clyde)
}

if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi

# Disable retrieving git status in prompt
git config --global --replace-all oh-my-zsh.hide-status 1
git config --global --replace-all oh-my-zsh.hide-dirty 1

#compdef clyde
_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh  clyde)
}
if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi
