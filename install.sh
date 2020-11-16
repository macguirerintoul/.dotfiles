# Clone my dotfiles repo
git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# For every directory within this one, run stow on it
# This creates a symlink in ~ to the contents of the directory
# e.g. ./vim/.vimrc -> ~/.vimrc
for dir in */; do
	stow "$dir"
done
