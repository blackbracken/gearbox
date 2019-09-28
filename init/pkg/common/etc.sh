#!/bin/bash

yes | sudo pacman --needed -S powerline-fonts \
                              adobe-source-han-sans-otc-fonts \
                              nm-connection-editor \
                              gnome-multi-writer \
                              exa \
                              tokei

yay -S powerline-rs \
       gedit \
       jetbrains-toolbox \
       discord \
       slack-desktop
