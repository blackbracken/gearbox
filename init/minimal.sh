#!/bin/bash

sudo pacman --needed -S curl git

git config --global user.name BlackBracken
git config --global user.email me@bracken.black

if !(type "yay" > /dev/null 2>&1); then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ../
  rm -rf yay
fi
