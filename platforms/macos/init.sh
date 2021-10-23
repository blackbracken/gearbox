#!/usr/bin/env bash
set -eu -o pipefail

export LC_ALL=C

cd `dirname $0`

if !(type "brew" > /dev/null 2>&1); then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

for dotfile in $(ls -A dotfiles); do
  rm -f $HOME/$dotfile;
  ln -sf `pwd`/dotfiles/$dotfile $HOME/$dotfile;
done

brew tap homebrew/cask-fonts
brew install `cat common-pkg.txt | egrep -v "^#.*|^$"`
brew install --cask `cat common-pkg-cask.txt | egrep -v "^#.*|^$"`

(bash ./scripts/install-fish.sh)
(bash ./scripts/install-neovim.sh)
