# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -e

# Add your local bin to your path variable, which helps execute ANY shell script
# No matter where you are in a dir.
export PATH="$HOME/.local/bin:$PATH"

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

