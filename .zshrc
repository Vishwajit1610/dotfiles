# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -e

autoload -Uz compinit
compinit

eval "$(starship init zsh)"



