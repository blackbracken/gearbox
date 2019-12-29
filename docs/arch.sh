#!/bin/bash

readonly GEARBOX_DIR="$HOME/gearbox"

if [ "`whoami`" == "root" ]; then
  echo "gearbox must be executed without the privilege."
  exit 1
fi

sudo pacman -Syu
sudo pacman -S git base-devel

rm -rf $GEARBOX_DIR
git clone https://github.com/blackbracken/gearbox.git $GEARBOX_DIR

(cd $GEARBOX_DIR; make initialize TARGET=arch)
