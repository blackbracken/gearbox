#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                xorg-xset \
                openbox \
                lightdm \
                lightdm-mini-greeter

# settings for lightdm
sudo sed -i -e "/greeter-session=/c\greeter-session=lightdm-mini-greeter" /etc/lightdm/lightdm.conf
sudo sed -i -e "/user-session=/c\user-session=openbox" /etc/lightdm/lightdm.conf

# settings for lightdm-mini-greeter
sudo sed -i -e "/^user = /c\user = $(whoami)" /etc/lightdm/lightdm-mini-greeter.conf
sudo sed -i -e "/^password-label-text = /c\password-label-text = " /etc/lightdm/lightdm-mini-greeter.conf
sudo sed -i -e "/^window-color = /c\window-color = \"#1B51B5\"" /etc/lightdm/lightdm-mini-greeter.conf

rm -rf $HOME/.config/openbox
ln -sf $HOME/gearbox/config/openbox $HOME/.config/openbox

#sudo systemctl enable lightdm
