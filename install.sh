#!/usr/bin/env bash
#
# Symlinks the contents of home/ into $HOME, prompting before
# overwriting any existing file or directory.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$DOTFILES_DIR/home"
TARGET_DIR="$HOME"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "error: $SOURCE_DIR not found" >&2
  exit 1
fi

confirm() {
  local prompt="$1"
  local reply
  read -r -p "$prompt [y/N] " reply
  case "$reply" in
    [yY][eE][sS]|[yY]) return 0 ;;
    *) return 1 ;;
  esac
}

link_item() {
  local src="$1"
  local dest="$2"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok: $dest already linked"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if confirm "warn: $dest already exists. Overwrite?"; then
      rm -rf "$dest"
    else
      echo "skip: $dest"
      return
    fi
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "link: $dest -> $src"
}

shopt -s dotglob
for item in "$SOURCE_DIR"/*; do
  name="$(basename "$item")"
  link_item "$item" "$TARGET_DIR/$name"
done
shopt -u dotglob

echo "done."
