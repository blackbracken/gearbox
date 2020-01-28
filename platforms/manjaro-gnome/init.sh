#!/bin/bash

sudo pacman -Syu
sudo pacman --needed -S base-devel yay

yay --needed -S `cat pkg.txt | egrep -v "^#.*|^$"`
