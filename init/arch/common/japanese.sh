#!/bin/bash

yay --needed -S fcitx \
                fcitx-{gtk2,gtk3,qt5,mozc,configtool} \
                adobe-source-han-sans-otc-fonts \
                noto-fonts-emoji

fcitx &
