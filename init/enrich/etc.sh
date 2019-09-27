#!/bin/bash

yes | sudo pacman --needed -S imagewriter \
                              tree \
                              tokei

yay --needed -S jetbrains-toolbox \
      		slack-desktop \
       		discord
