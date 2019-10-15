#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              gnome-screenshot \
                              lsd \
                              bat \
                              tokei

yay -S vivaldi \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       spotify \
       libmnt \
       gedit \
       ntpdate
