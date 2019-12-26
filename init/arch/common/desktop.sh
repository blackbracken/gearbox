#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                openbox \
                lightdm \
                lightdm-mini-greeter

#rm -rf $HOME/.config/openbox
#ln -sf $HOME/gearbox/config/openbox $HOME/.config

#sudo cp $HOME/gearbox/config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
#sudo cp $HOME/gearbox/config/lightdm/lightdm-mini-greeter.conf /etc/lightdm/lightdm-mini-greeter.conf

#sudo systemctl enable lightdm
