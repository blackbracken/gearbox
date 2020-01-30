#!/bin/bash

yay --needed -S pulseaudio pavucontrol volumeicon

pulseaudio --start

# settings for volumeicon
rm -rf $HOME/.config/volumeicon
ln -sf $HOME/gearbox/config/volumeicon $HOME/.config/volumeicon
