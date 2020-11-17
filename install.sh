DOTDIR=~/.dotfiles

# Clone my dotfiles repo
if find ~/.dotfiles -maxdepth 0 -empty | read v; then
	git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles
fi

# If Homebrew isn't installed, install it
if ! command -v brew &> /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install antigen
curl -L git.io/antigen > antigen.zsh

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

# Install Node.js LTS via nvm
nvm install --lts

# Run OS-specific scripts
if command -v apt &> /dev/null; then
	# We're on Linux
	source $DOTDIR/linux/linux.sh
	cd $DOTDIR/linux 
elif [[ `uname` == "Darwin" ]]; then
	# We're on macOS
	source $DOTDIR/macos.sh
	cd $DOTDIR/macos
else
	# Who knows?
	echo 'Unknown OS!'
fi
brew bundle -v

# Run stow on every directory in ~/.dotfiles
# This creates a symlink in ~ to the contents of the directory
# e.g. ./vim/.vimrc -> ~/.vimrc
cd $DOTDIR/symlinks
for dir in */; do
	stow "$dir" -t ~ -v
done
