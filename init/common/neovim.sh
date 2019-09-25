#!/bin/bash

sudo pacman --needed -S neovim

rm -rf $HOME/.config/nvim
ln -sf $GEAR_ROOT/config/nvim $HOME/.config
