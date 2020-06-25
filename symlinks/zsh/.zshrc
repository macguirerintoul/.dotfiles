alias rl='source ~/.zshrc' # alias to reload the zsh configuration
alias gp='git push'
alias python='python3'
alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'
alias alc="vi ~/.alacritty.yml"
alias tmc="vi ~/.tmux.conf"
alias kc="vi ~/.config/kitty/kitty.conf"
alias bd="brew bundle dump --describe"
alias o='open "$(fzf)"'
alias :q="exit"

# renew upass automatically using @Armour's repo
upass() {
	python3 ~/dev/upass-sfu/upass.py
}

# dotfiles functions
df () {
  case ${1} in
    u ) 
      echo "Uploading dotfiles..."
      code --list-extensions > ~/.dotfiles/symlinks/vscode/.config/VSCode/extensions.txt
      dfg add -u # add changed files to commit
			if [ -z "$2" ] # if argument 2 is an empty string...
  			then
      		dfg commit -m "upload dotfiles" # commit changed files
			else
      	dfg commit -m "$2" # commit changed files
			fi
      dfg push # push
      echo "Upload complete."
      ;;
    x )
      extensions=$(cat ~/.config/VSCode/extensions.txt)
      installed=$(code --list-extensions)
      while read LINE
      do
        if [[ $extensions != *$LINE* ]] # if line from installed is not in extensions file...
        then # uninstall it
          echo "$LINE is not in extensions file. Uninstalling..."
          code --uninstall-extension $LINE
        fi # end if
      done < <(code --list-extensions) # use each line of output as input to while read loop
      while read LINE 
      do 
        if [[ $installed == *$LINE* ]] # if extension is already installed, do nothing
        then
          echo "$LINE is already installed."
        else # otherwise, install it
          echo "$LINE is not yet installed. Installing..."
          code --install-extension $LINE 
        fi # end if
      done < ~/.config/VSCode/extensions.txt # use each line of file as input to while read loop
      ;;
    status )
      dfg status
      ;;
    * )  
      echo "u: upload dotfiles"
      echo "d: download dotfiles"
      echo "x: install extensions"
      echo "status: git status of dotfiles"
      ;;
  esac
}

# switch iTerm profile with system theme
sith() {
	val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
	if [[ $val == "Dark" ]]; then
		i
	fi
}

# toggle iTerm profile
i() {
	if [[ $ITERM_PROFILE == "Light" ]]; then
		echo -ne "\033]50;SetProfile=Dark\a"
		export ITERM_PROFILE="Dark"
	else
		echo -ne "\033]50;SetProfile=Light\a"
		export ITERM_PROFILE="Light"
	fi
}

sith # call the above sith function

# enable/disable custom DNS configuration
dns() {
	case ${1} in
		on )
			networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001	
			;;
		off )
			networksetup -setdnsservers Wi-Fi 208.67.220.220 208.67.222.222
			;;
	esac
}

# shortcut to add all modified files & commit
g () {
  git add . && git commit -m "$1"
}

# source antigen since I install from brew
source $(brew --prefix)/share/antigen/antigen.zsh

# antigen setup
antigen use oh-my-zsh
antigen bundle rupa/z
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle zsh-users/zsh-autosuggestions
antigen theme jackharrisonsherlock/common
antigen apply

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# setup the `fuck` command
eval $(thefuck --alias) 

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
