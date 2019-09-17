#!/bin/bash
cd `dirname $0`

yes | sudo pacman --needed -S $(pacman -Qg base-devel | cut -f2 -d " ") \
                                yay

for language in $(ls ./languages); do
  sh ./languages/$language
done

sh ./input.sh
sh ./commands.sh
