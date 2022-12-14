DOTDIR=~/.dotfiles
OS=null

# Clone my dotfiles repo if it doesn't already exist
if [ -d "~/.dotfiles" ]; then
	git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles
fi

# Check what OS we're on for later
if [[ `uname` == "Linux" ]]; then
	echo "OS=Ubuntu"
	OS=ubuntu
elif [[ `uname` == "Darwin" ]]; then
	echo "OS=macOS"
	OS=macOS
else
	# Who knows?
	echo 'Unknown OS!'
fi

if [[ $OS == 'macOS' ]]; then
	echo "Installing macOS software"
	# Install Homebrew
	if ! type brew > /dev/null; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi

	# Taps
	brew tap homebrew/cask-fonts
	brew tap zegervdv/zathura

	# Formulae
	brew install ffmpegthumbnailer libreoffice nnn stow tmux vim viu zathura zathura-pdf-poppler zplug zsh
	sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
	mkdir -p $(brew --prefix zathura)/lib/zathura
	ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib

	# Casks
	for cask in flux font-cozette google-chrome iterm2 macs-fan-control monitorcontrol visual-studio-code
	do
		if ! brew info $cask &>/dev/null; then
			brew install --cask $cask
		fi
	done

	# nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install --lts
elif [[ $OS == 'Ubuntu' ]]; then
	if ! type stow &> /dev/null; then
		sudo apt install stow
	fi
fi

cd $DOTDIR
stow symlink -t ~ -v

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug install
source ~/.zshrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

