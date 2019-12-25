#!/bin/bash
cd `dirname $0`

sudo pacman -Syu

sh ./ordered/git.sh
sh ./ordered/yay.sh

for file in `\find ./common -maxdepth 1 -name '*.sh'`; do
  sh $file
done
