#!/bin/bash

readonly DOTFILES_REPO="https://raw.githubusercontent.com/blackbracken/dotfiles/master"

sudo pacman -Syu
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

# wallpaper
curl -L "$DOTFILES_REPO/wallpaper.b64"
base64 -d wallpaper.b64 > ~/Pictures/wallpaper.jpg
rm wallpaper.b64
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/wallpaper.jpg

# mozc
fcitx-configtool &

# git
git config --global user.name BlackBracken
git config --global user.email me@bracken.black

# neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -Lo ~/.config/nvim/init.vim "$DOTFILES_REPO/init.vim"

# sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Kotlin with gradle
sdk install gradle
sdk install kotlin

# copy configs
curl -Lo ~/.bashrc       "$DOTFILES_REPO/.bashrc"
curl -Lo ~/.bash_profile "$DOTFILES_REPO/.bash_profile"
curl -Lo ~/.xprofile     "$DOTFILES_REPO/.xprofile"

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
