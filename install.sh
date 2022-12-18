DOTDIR=~/.dotfiles
OS=null

# Clone my dotfiles repo if it doesn't already exist
if [ -d "~/.dotfiles" ]; then
	git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles
fi

# Check what OS we're on for later
if [ -n "$(uname -a | grep Ubuntu)" ]; then
	OS=ubuntu
elif [ -n "$(uname -a | grep Darwin)" ]; then
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
	brew install ffmpegthumbnailer most nnn stow tmux tree vim viu zathura zathura-pdf-poppler zplug zsh

	# Zathura	
	mkdir -p $(brew --prefix zathura)/lib/zathura
	ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib

	# Casks
	for cask in flux font-cozette google-chrome iterm2 libreoffice macs-fan-control monitorcontrol spotify visual-studio-code
	do
		if ! brew info $cask &>/dev/null; then
			brew install --cask $cask
		fi
	done

	# nvm/node.js
	if ! type nvm > /dev/null; then
			curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	fi
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install --lts

	# iTerm2
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/.iterm"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

	# macOS preferences
	defaults write com.apple.dock autohide -bool true
	defaults write com.apple.dock magnification -bool false
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock autohide-time-modifier -float 1
	defaults write NSGlobalDomain _HIHideMenuBar -bool true
	killall Dock
elif [[ $OS == 'Ubuntu' ]]; then
	sudo apt install most nnn stow tmux tree vim zsh
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# symlink files in home
cd $DOTDIR
stow home -t ~ -v

# Install nnn plugins
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug install
source ~/.zshrc

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

