#!/bin/bash

yay --needed -S alacritty \
                adobe-source-code-pro-fonts \
                powerline-rs \
                powerline-fonts

rm -rf $HOME/.config/alacritty
ln -sf $HOME/gearbox/config/alacritty $HOME/.config/alacritty
