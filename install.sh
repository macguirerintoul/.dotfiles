# install homebrew, macOS package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install antigen, a zsh manager
brew install antigen

# install apps via cask
brew cask install visual-studio-code
brew cask install firefox
brew cask install flux
brew cask install iterm2
brew cask install spotify
brew cask install macs-fan-control

# enable homebrew to install fonts
brew tap homebrew/cask-fonts
brew cask install font-iosevka
brew cask install font-jetbrains-mono

# setup iTerm to support italics
tic .dfconfig/xterm-256color-italic.terminfo

