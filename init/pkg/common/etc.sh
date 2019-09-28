#!/bin/bash

yes | sudo pacman --needed -S powerline-fonts \
                              adobe-source-han-sans-otc-fonts \
                              exa \
                              tokei

yay -S powerline-rs \
       imagewriter \
       gedit \
       jetbrains-toolbox \
       discord \
       slack-desktop
