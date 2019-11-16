d () {
  git --git-dir=$HOME/dotfiles/ --work-tree=$HOME "$@"
}
d pull
apm install --packages-file ~/.atom/package.list
