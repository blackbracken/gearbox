#!/bin/bash

sudo pacman --needed -S neovim

rm -rf $HOME/.config/nvim
ln -sf $HOME/.config/config/nvim $HOME/.config
