#!/bin/bash

sudo pacman --needed -S alacritty adobe-source-code-pro-fonts

rm -rf $HOME/.config/alacritty
ln -sf $HOME/.gearbox/config/alacritty $HOME/.config
