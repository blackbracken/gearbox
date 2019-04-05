#!/bin/bash

readonly BASH="${HOME}/.bashrc"
readonly XMODMAP="${HOME}/.xmodmap"
readonly VIM_CONFIG="${HOME}/.config/nvim/init.vim"

# essential packages
sudo pacman -S git
sudo pacman -S python

# haskell install
sudo pacman -S stack

# git settings
git config --global user.name BlackBracken
git config --global user.email me@bracken.black

# rewrite CapsLock to L_Ctrl
echo "keycode  66 = Control_L Control_L Control_L Control_L" >  $XMODMAP
echo "remove Lock = Control_L"                               >> $XMODMAP
echo "add Control = Control_L"                               >> $XMODMAP
echo "/usr/bin/xmodmap ${XMODMAP}"                           >> $BASH

# install neovim & dein.vim
sudo pacman -S neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ${HOME}/.cache/dein
rm ./dein_installer.sh
curl https://raw.githubusercontent.com/blackbracken/dotfiles/master/init.vim > $VIM_CONFIG
sed -i -e "s/blackbracken/${USER}/" $VIM_CONFIG
echo "alias vim=nvim" >> $BASH

# update pacman packages
sudo pacman -Syu

echo "Setup has been successful! Do not forget to restart terminal."
