#!/bin/bash -eu

readonly GEAR_ROOT="$HOME/.gear"

if [ "`whoami`" == "root" ]; then
  echo "Gear must be spun without the privilege."
  exit 1
fi

rm -rf $GEAR_ROOT
git clone https://github.com/blackbracken/gear.git $GEAR_ROOT

rm -rf $HOME/.config/nvim
ln -sf $GEAR_ROOT/config/nvim $HOME/.config
