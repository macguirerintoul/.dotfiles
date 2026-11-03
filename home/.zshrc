source ~/.zsh_plugins/zsh-z/zsh-z.plugin.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '`' autosuggest-accept
bindkey '`^M' autosuggest-execute
MNML_PROMPT=(mnml_status)
source ~/.zsh_plugins/minimal/minimal.zsh
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[[ -d /usr/local/bazelisk ]] && export PATH=/usr/local/bazelisk:$PATH
[[ -d /usr/local/ibazel ]] && export PATH=/usr/local/ibazel:$PATH

[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"


if [[ -d ~/oh_my_visier ]]; then
  # Loads oh-my-visier's entrypoint
  source ~/oh_my_visier/entrypoint.sh



  # Load Angular CLI autocompletion.
  command -v ng &>/dev/null && source <(ng completion script)
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  command -v pyenv &>/dev/null && eval "$(pyenv init -)"
fi

# Machine-specific/private settings (untracked)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
