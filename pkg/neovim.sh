#!/bin/bash
cd `dirname $0`

readonly GEAR_ROOT="$HOME/.gear"

yes | sudo pacman --needed -S neovim

rm -rf $HOME/.config/nvim
ln -sf $GEAR_ROOT/config/nvim $HOME/.config
