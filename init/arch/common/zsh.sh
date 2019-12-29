#!/bin/bash

yay --needed -S zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh
