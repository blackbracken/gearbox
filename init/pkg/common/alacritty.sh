#!/bin/bash

sudo pacman --needed -S alacritty

rm -rf $HOME/.config/alacritty
ln -sf $HOME/.gearbox/config/alacritty $HOME/.config
