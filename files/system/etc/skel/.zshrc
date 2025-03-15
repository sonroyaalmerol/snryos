# Enable Zsh completion
autoload -Uz compinit
compinit

# Enable autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autocd
setopt autocd

# Custom key bindings
bindkey '^ ' autosuggest-accept

# Direnv log format
export DIRENV_LOG_FORMAT=""

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
