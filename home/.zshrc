export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
source .zsh_plugins/zsh-z/zsh-z.plugin.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
zplug load
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
