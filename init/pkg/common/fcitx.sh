#!/bin/bash

yes | sudo pacman --needed -S fcitx \
                              fcitx-{gtk2,gtk3,qt5,mozc,configtool}

fcitx-configtool &
