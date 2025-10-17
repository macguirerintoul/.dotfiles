source ~/.zsh_plugins/zsh-z/zsh-z.plugin.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '`' autosuggest-accept
bindkey '`^M' autosuggest-execute
MNML_PROMPT=(mnml_status)
source ~/.zsh_plugins/minimal/minimal.zsh
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


# Loads oh-my-visier's entrypoint
source ~/oh_my_visier/entrypoint.sh

#export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/offline-ca001.yvr.default.dc.visier.network.pem 


# Load Angular CLI autocompletion.
source <(ng completion script)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
