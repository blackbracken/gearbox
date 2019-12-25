#!/bin/bash
cd `dirname $0`

sh ./ordered/git.sh
sh ./ordered/yay.sh

yay
yay --needed -S base-devel

for file in `\find ./common -maxdepth 1 -name '*.sh'`; do
  sh $file
done
