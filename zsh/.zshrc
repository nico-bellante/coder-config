export ZSH="/home/discord/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git autojump)

source ~/.aliases

autoload -Uz compinit
compinit

_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh clyde)
}

if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi
