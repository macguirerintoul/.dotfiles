# install homebrew, macOS package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew packages
brew install antigen
brew install vim
brew install alacritty
brew install pass
brew install spotifyd
brew install Rigellute/tap/spotify-tui

# install apps via cask
brew cask install visual-studio-code
brew cask install firefox
brew cask install google-chrome 
brew cask install flux
brew cask install macs-fan-control
brew cask install rocket

# get fonts from brew
brew tap homebrew/cask-fonts
brew cask install font-iosevka
brew cask install font-fantasque-sans-mono
brew cask install font-ibm-plex

# create a terminal config to allow italic text
tic .dfconfig/xterm-256color-italic.terminfo

# clone pass repo
git clone https://github.com/macguirerintoul/.password-store.git

