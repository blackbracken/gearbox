#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                xorg-xset \
                openbox \
                obkey-gtk3 \
                xcape \
                picom \
                feh \
                lightdm \
                lightdm-webkit2-greeter \
                light-locker \
                rofi \
                tint2 \
                otf-fantasque-sans-mono \

# settings for openbox
rm -rf $HOME/.config/openbox
ln -sf $HOME/gearbox/config/openbox $HOME/.config/openbox

# settings for lightdm
sudo sed -i -e "/greeter-session=/c\greeter-session=lightdm-webkit2-greeter" /etc/lightdm/lightdm.conf
sudo sed -i -e "/user-session=/c\user-session=openbox" /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm

# settings for rofi
rm -rf $HOME/.config/rofi
ln -sf $HOME/gearbox/config/rofi $HOME/.config/rofi

# settings for tint2
rm -rf $HOME/.config/tint2
ln -sf $HOME/gearbox/config/tint2 $HOME/.config/tint2
