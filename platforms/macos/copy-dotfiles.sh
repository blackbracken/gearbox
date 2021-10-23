#!/usr/bin/env bash

cd `dirname $0`

for dotfile in $(ls -A dotfiles); do
  cp -f ./dotfiles/$dotfile $HOME/;
  # ln -sf `pwd`/dotfiles/$dotfile $HOME;
done
