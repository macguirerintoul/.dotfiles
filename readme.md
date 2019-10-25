# Macguire's dotfiles

## Installing
Issues? See [here](https://www.atlassian.com/git/tutorials/dotfiles).

1. `git clone --bare https://github.com/macguirerintoul/dotfiles.git $HOME/dotfiles`
2. `alias df='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME`
3. `df checkout` **Note:** this may fail if there are existing configuration files in `~` that clash with the repository. It will tell you which files are clashing, and you can backup or remove them.
4. `df config --local status.showUntrackedFiles no`

## Updating
1. `cd ~`
3. `df add -u`
4. `df push`

## Usage

`df` (short for dotfiles) is a shortcut alias to run `git` in `~` while storing the actual repository in `~/dotfiles/`.
