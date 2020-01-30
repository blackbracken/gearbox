#!/bin/bash

yay --needed -S neovim npm

rm -rf $HOME/.config/nvim
ln -sf $HOME/gearbox/config/nvim $HOME/.config/nvim
