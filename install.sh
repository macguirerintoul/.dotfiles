DOTDIR=~/.dotfiles

# Clone my dotfiles repo
if find ~/.dotfiles -maxdepth 0 -empty | read v; then
	git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles
fi

# Run stow on every directory in ~/.dotfiles
# This creates a symlink in ~ to the contents of the directory
# e.g. ./vim/.vimrc -> ~/.vimrc
cd $DOTDIR/symlinks
for dir in */; do
	stow "$dir" -t ~ -v
done

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

# If Homebrew isn't installed, install it
if ! type brew > /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install nvm if not installed
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if ! type nvm > /dev/null; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
fi

# Source ~/.zshrc so brew/nvm/... can be used
source ~/.zshrc

# Install Node.js LTS via nvm
nvm install --lts

