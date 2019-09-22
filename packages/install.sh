#!/bin/bash
cd `dirname $0`

yes | sudo pacman --needed -S yay
yay -Syu --devel --timeupdate

for lang in $(ls ./lang); do
  sh ./languages/$lang
done

sh ./app.sh
sh ./japanize.sh
sh ./commands.sh
sh ./neovim.sh
sh ./powerline.sh
