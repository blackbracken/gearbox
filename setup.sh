#!/bin/bash

readonly DOTFILES_REPO="https://raw.githubusercontent.com/blackbracken/dotfiles/master"

sudo pacman --needed -S $(pacman -Qg base-devel | cut -f2 -d " ") \
                        gnome-terminal-fedora \
                        powerline-fonts \
                        otf-fira-code \
                        otf-ipafont \
                        adobe-source-han-sans-otc-fonts \
                        $(pacman -Qg fcitx-im | cut -f2 -d " ") \
                        fcitx-mozc \
                        fcitx-configtool \
                        neovim \
                        python \
                        python-pip \
                        npm \

# mozc
fcitx-configtool &

# git
git config --global user.name BlackBracken
git config --global user.email me@bracken.black

# neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -Lo ~/.config/nvim/init.vim "$DOTFILES_REPO/init.vim"

# copy configs
curl -Lo ~/.bashrc  "$DOTFILES_REPO/.bashrc"
curl -Lo ~/.xmodmap "$DOTFILES_REPO/.xprofile"

# install aur packages
for package in $(echo "jetbrains-toolbox \
                       slack-desktop \
                       powerline-go"); do
  git clone "https://aur.archlinux.org/$package.git"
  cd "./$package"
  makepkg -si --needed
  cd "../"
  rm -rf "$package/"
done
