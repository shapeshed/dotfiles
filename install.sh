#!/usr/bin/env sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Function to link files from a source directory to a destination directory.
# Usage: link_files SOURCE_DIR DEST_DIR
link_files() {
  src_dir="$1"
  dest_dir="$2"

  mkdir -p "$dest_dir"

  for f in "$src_dir"/*; do
    target="$dest_dir/$(basename "$f")"

    # If the target is a symbolic link remove it
    [ -L "$target" ] && rm "$target"

    # If the target does not exist as a regular file or a symlink
    # create it
    if [ ! -e "$target" ]; then
      ln -s "$f" "$target"
    else
      echo "Skipping $target - target exists and is not a symlink"
    fi
  done
}

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_BIN_HOME="$HOME/.local/bin"

link_files "$DOTFILES_DIR/config" "$XDG_CONFIG_HOME"
link_files "$DOTFILES_DIR/local/bin" "$XDG_BIN_HOME"
link_files "$DOTFILES_DIR/Pictures" "$HOME/Pictures"
