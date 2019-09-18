#!/bin/bash
cd `dirname $0`

yes | yay -S powerline-go
sudo pacman --needed -S powerline-fonts
