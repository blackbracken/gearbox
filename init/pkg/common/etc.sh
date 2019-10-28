#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              gnome-screenshot \
                              keybase-gui \
                              openfortivpn \
                              lsd \
                              bat \
                              tokei

yay -S vivaldi \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       spotify \
       libmtp \
       gedit \
       ntpdate
