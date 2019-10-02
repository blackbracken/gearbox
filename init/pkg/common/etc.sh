#!/bin/bash

yes | sudo pacman --needed -S gnome-multi-writer \
                              lsd \
                              tokei

yay -S gedit \
       jetbrains-toolbox \
       discord \
       slack-desktop \
       libmnt
