# Macguire's dotfiles

## Installing

Issues? See [here](https://www.atlassian.com/git/tutorials/dotfiles).

1. `git clone --bare https://github.com/macguirerintoul/dotfiles.git $HOME/dotfiles`
2. `alias df='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME`
3. `dfg checkout` **Note:** this may fail if there are existing configuration files in `~` that clash with the repository. It will tell you which files are clashing, and you can backup or remove them.
4. `dfg config --local status.showUntrackedFiles no`
5. `df i` to run the install script

## Usage

`df d`: pull dotfiles from GitHub

`df u`: commit any changes and push dotfiles to GitHub

`df i`: run the install script

`dfg`: run `git` in `~` (while storing the actual repository in `~/dotfiles/`)
