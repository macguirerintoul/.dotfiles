# install homebrew, macOS package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# create a terminal config to allow italic text
tic .dfconfig/xterm-256color-italic.terminfo

# clone pass repo
git clone https://github.com/macguirerintoul/.password-store.git

