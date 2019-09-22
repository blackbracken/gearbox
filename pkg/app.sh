#!/bin/bash
cd `dirname $0`

yes | sudo pacman --needed -S tree \
                              tokei

yes | yay -S jetbrains-toolbox \
             slack-desktop \
             discord
