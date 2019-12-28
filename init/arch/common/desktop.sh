#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                xorg-xset \
                openbox \
                lightdm \
                lightdm-webkit2-greeter

# settings for lightdm
sudo sed -i -e "/greeter-session=/c\greeter-session=lightdm-webkit2-greeter" /etc/lightdm/lightdm.conf
sudo sed -i -e "/user-session=/c\user-session=openbox" /etc/lightdm/lightdm.conf

rm -rf $HOME/.config/openbox
ln -sf $HOME/gearbox/config/openbox $HOME/.config/openbox

sudo systemctl enable lightdm
