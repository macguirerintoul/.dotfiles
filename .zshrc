alias rl='source ~/.zshrc' # alias to reload the zsh configuration
alias dfg='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias gp='git push'
alias python='python3'
alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'

# renew upass automatically using @Armour's repo
upass() {
	python3 ~/dev/upass-sfu/upass.py
}

# dotfiles functions
df () {
  case ${1} in
    i ) 
      ./install.sh # run the dotfiles install script
			df x # run df x (not sure if this will work)
      ;;
    u ) 
      echo "Uploading dotfiles..."
      code --list-extensions > ~/.dfconfig/vscode/extensions.txt # export vscode extensions
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
    d ) 
      echo "Downloading dotfiles..."
      dfg pull # pull dotfiles from github
      echo "Download complete."
      ;;
    x )
      extensions=$(cat ~/.dfconfig/vscode/extensions.txt)
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
      done < ~/.dfconfig/vscode/extensions.txt # use each line of file as input to while read loop
      ;;
    status )
      dfg status
      ;;
    * )  
      echo "i: run install script"
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
	if [[ $ITERM_PROFILE == "Default" ]]; then
		echo -ne "\033]50;SetProfile=Dark\a"
		export ITERM_PROFILE="Dark"
	else
		echo -ne "\033]50;SetProfile=Default\a"
		export ITERM_PROFILE="Default"
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

# compress a PDF
compresspdf() {
    echo 'Usage: compresspdf [input file] [output file]'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/ebook -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# source antigen since I install from brew
source $(brew --prefix)/share/antigen/antigen.zsh

# antigen setup
antigen use oh-my-zsh
antigen theme jackharrisonsherlock/common
antigen bundle z
antigen bundle MichaelAquilina/zsh-you-should-use
antigen apply

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# setup the `fuck` command
eval $(thefuck --alias) 

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
