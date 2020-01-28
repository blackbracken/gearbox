#!/bin/bash
cd `dirname $0`

sudo pacman -Syu
sudo pacman --needed -S base-devel yay

# common packages
# yay --needed -S `cat pkg.txt | egrep -v "^#.*|^$"`

# dotfiles
for dotfile in $(ls -A dotfiles); do
  rm -f $HOME/$dotfile;
  ln -sf `pwd`/dotfiles/$dotfile $HOME;
  echo "Set the symbolic: $dotfile"
done

# config
for config in $(ls config); do
  rm -rf $HOME/.config/$config
  ln -sf `pwd`/config/$config $HOME/.config;
  echo "Set the symbolic: $config/"
done

# gnome settings
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $(whoami)

# zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh
