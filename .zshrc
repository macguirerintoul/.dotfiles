alias reload='source ~/.zshrc' # alias to reload the zsh configuration
alias dfg='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias python='python3'
alias zrc='vi ~/.zshrc'

upass() {
	python3 ~/dev/upass-sfu/upass.py
}

df () {
  case ${1} in
    i ) 
      ./install.sh
      ;;
    u ) 
      echo "Uploading dotfiles..."
      code --list-extensions > ~/.dfconfig/vscode-extensions.txt # export vscode extensions
      dfg add -u # add changed files to commit
      dfg commit -m "upload dotfiles" # commit changed files
      dfg push # push
      echo "Upload complete."
      ;;
    d ) 
      echo "Downloading dotfiles..."
      dfg pull # pull dotfiles from github
      echo "Download complete."
      ;;
    * )  
      echo "i: run install script"
      echo "u: upload dotfiles"
      echo "d: download dotfiles"
      ;;
  esac
}

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

compresspdf() {
    echo 'Usage: compresspdf [input file] [output file]'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/ebook -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

source $(brew --prefix)/share/antigen/antigen.zsh # source antigen since I install from brew

antigen use oh-my-zsh
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen theme robbyrussell
antigen apply

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval $(thefuck --alias) # setup the `fuck` command

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
