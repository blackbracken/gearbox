#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                openbox \
                lightdm \
                lightdm-mini-greeter

# change greeter
sudo sed -i -e "/greeter-session=/c\greeter-session=lightdm-mini-greeter" /etc/lightdm/lightdm.conf

# change user to login as
sudo sed -i -e "/^user = /c\user = $(whoami)" /etc/lightdm/lightdm-mini-greeter.conf

#rm -rf $HOME/.config/openbox
#ln -sf $HOME/gearbox/config/openbox $HOME/.config

#sudo systemctl enable lightdm
