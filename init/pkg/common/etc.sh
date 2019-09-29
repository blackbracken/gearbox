#!/bin/bash

yes | sudo pacman --needed -S nm-connection-editor \
                              gnome-multi-writer \
                              exa \
                              tokei

yay -S gedit \
       jetbrains-toolbox \
       discord \
       slack-desktop
