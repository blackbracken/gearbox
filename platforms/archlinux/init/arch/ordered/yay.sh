#!/bin/bash

type yay > /dev/null 2>&1 && exit 0

git clone https://aur.archlinux.org/yay.git
(cd yay; makepkg -si)
rm -rf yay
