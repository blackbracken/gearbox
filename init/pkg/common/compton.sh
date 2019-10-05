#!/bin/bash

sudo pacman --needed -S compton

rm -rf $HOME/.config/compton
rm -rf $HOME/.config/compton.conf
ln -sf $HOME/.gearbox/config/compton $HOME/.config
