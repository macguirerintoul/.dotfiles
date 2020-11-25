DOTDIR=~/.dotfiles
OS=null

# Clone my dotfiles repo if it doesn't already exist
if [ -d "~/.dotfiles" ]; then
	git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles
fi

# Check what OS we're on for later
if type apt &> /dev/null; then
	# We're on Linux 😎
	OS=Linux
elif [[ `uname` == "Darwin" ]]; then
	OS=macOS
else
	# Who knows?
	echo 'Unknown OS!'
fi

# Get stow if we don't have it
if ! type stow &> /dev/null; then
	if [[ $OS == 'Linux' ]]; then
		sudo apt install stow
	elif [[ $OS == 'macOS' ]]; then
		# Note sure if macOS comes with stow or not, but let's get it anyways.
		# Source .zshrc if it exists;
		# We can't know if brew is installed until we run the 'eval' thing for brew that you have to put in .zprofile
		if [ -f "~/.zprofile" ]; then
			source ~/.zprofile
		fi
		# If brew isn't installed, get it
		if ! type brew > /dev/null; then
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		fi
		eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
		# Then, get stow!
		brew install stow
	fi
fi

# Run stow on every directory in ~/.dotfiles
# This creates a symlink in ~ to the contents of the directory
# e.g. ./vim/.vimrc -> ~/.vimrc
cd $DOTDIR/symlinks
for dir in */; do
	stow "$dir" -t ~ -v
done

# Now, zsh stuff is where it's supposed to be and we can source it (on Linux, we haven't yet)
source ~/.zshrc
source ~/.zprofile

# If brew isn't installed, get it (on Linux, we haven't yet)
if ! type brew > /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Run OS-specific scripts
# and go to the directory where each OS' Brewfile is
if [[ $OS == 'Linux' ]]; then
	source $DOTDIR/linux/linux.sh
	cd $DOTDIR/linux 
elif [[ $OS == macOS ]]; then
	source $DOTDIR/macos.sh
	cd $DOTDIR/macos
fi
brew bundle -v # Then, install from the Brewfile

# Install nvm if not installed
if ! type nvm > /dev/null; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
fi

# Install Node.js LTS via nvm
nvm install --lts

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

