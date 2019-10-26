#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              gnome-screenshot \
                              keybase-gui \
                              openfortivpn \
                              lsd \
                              bat \
                              tokei \
                              grex

yay -S vivaldi \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       spotify \
       libmnt \
       gedit \
       ntpdate
