#!/bin/bash

yay --needed -S xorg-server \
                xorg-xinit \
                xorg-xset \
                openbox \
                openbox-theme-arcbox \
                obkey-gtk3 \
                xcape \
                picom \
                feh \
                lightdm \
                lightdm-webkit2-greeter \
                light-locker \
                rofi \
                tint2

# settings for openbox
rm -rf $HOME/.config/openbox
ln -sf $HOME/gearbox/config/openbox $HOME/.config/openbox

# settings for lightdm
sudo sed -i -e "/greeter-session=/c\greeter-session=lightdm-webkit2-greeter" /etc/lightdm/lightdm.conf
sudo sed -i -e "/user-session=/c\user-session=openbox" /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm
sudo systemctl start lightdm
sudo cp -r ~/gearbox/res/zen /usr/share/lightdm-webkit/themes/
sudo sed -i -e "/^webkit_theme/c\webkit_theme = zen" /etc/lightdm/lightdm-webkit2-greeter.conf

# settings for rofi
rm -rf $HOME/.config/rofi
ln -sf $HOME/gearbox/config/rofi $HOME/.config/rofi

# settings for tint2
rm -rf $HOME/.config/tint2
ln -sf $HOME/gearbox/config/tint2 $HOME/.config/tint2
