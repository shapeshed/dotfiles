# Dotfiles

Follows the [XDG Base Directory Specification][1].

## Installation

These files are specific to my needs but if you want to install please read the
dotfiles script before running it.

```sh
git clone git@github.com:shapeshed/dotfiles.git
./local/bin/dotfiles install
```

This symlinks the dotfiles folders and files into your home folder.

## Making changes

1. Make changes to the dotfiles repo
2. `dotfiles install`
3. Commit
4. Push

## Removing dotfiles

```sh
dotfiles uninstall
```

Note that this removes the dotfiles script from your `$PATH` so if you do this
you will need to install again.

[1]:
  https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
