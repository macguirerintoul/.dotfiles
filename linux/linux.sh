packages=( zsh stow )
for package in "${packages[@]}"
if ! command -v $package &> /dev/null
then
	sudo apt install $package
fi

# Change default shell to zsh
chsh -s $(which zsh)
