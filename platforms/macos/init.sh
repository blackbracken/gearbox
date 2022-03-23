#!/usr/bin/env bash
set -eu -o pipefail

export LC_ALL=C

cd `dirname $0`

for dotfile in $(ls -A dotfiles); do
  rm -f $HOME/$dotfile;
  ln -sf `pwd`/dotfiles/$dotfile $HOME/$dotfile;
done

chmod +x scripts/*.sh
./scripts/install-brew.sh
./scripts/install-fish.sh
./scripts/install-neovim.sh
./scripts/install-sdkman.sh
./scripts/install-rust.sh
./scripts/install-scala.sh
