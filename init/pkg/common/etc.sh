#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              gnome-screenshot \
                              keybase-gui \
                              openfortivpn \
                              lsd \
                              bat \
                              tokei

yay -S firefox \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       spotify \
       android-sdk-platform-tools \ 
       libmtp \
       gedit \
       thunar
