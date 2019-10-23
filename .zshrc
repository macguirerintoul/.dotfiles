# dotfiles alias
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# zsh stuff

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mtr/.oh-my-zsh"

plugins=(
	z
  git
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# setup fuck
eval $(thefuck --alias)
