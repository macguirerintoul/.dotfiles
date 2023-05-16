source ~/.zsh_plugins/zsh-z/zsh-z.plugin.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
MNML_PROMPT=(mnml_status)
source ~/.zsh_plugins/minimal/minimal.zsh
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
