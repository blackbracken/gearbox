#!/bin/bash
cd `dirname $0`

yes | sudo pacman --needed -S $(pacman -Qg base-devel | cut -f2 -d " ") \
                                yay

yes | sudo pacman -Syuu
yes | yay -Syuu

for language in $(ls ./languages); do
  sh ./languages/$language
done

sh ./apps.sh
sh ./input.sh
sh ./commands.sh
sh ./neovim.sh
sh ./powerline.sh
