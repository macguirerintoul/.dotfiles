d () {
  git --git-dir=$HOME/dotfiles/ --work-tree=$HOME "$@"
}

# create the list of atom packages installed
apm list --installed --bare > ~/.atom/package.list

# add changed files
d add -u

# commit changed files
d commit -m "sync dotfiles"

# push
d push
