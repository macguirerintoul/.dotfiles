# Clone my dotfiles repo
git clone https://github.com/macguirerintoul/.dotfiles.git ~/.dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Zero.sh
brew install zero-sh/tap/zero

# Run Zero.sh
zero setup
