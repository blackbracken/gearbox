#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              gnome-screenshot \
                              lsd \
                              bat \
                              tokei

yay -S gedit \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       libmnt
