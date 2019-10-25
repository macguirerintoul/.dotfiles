alias reload='source ~/.zshrc'
# dotfiles alias
alias df='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

eval $(thefuck --alias)

source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
# next two lines are for the pure prompt
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply
