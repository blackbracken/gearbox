#!/bin/bash

readonly DOTFILES_REPO="https://raw.githubusercontent.com/blackbracken/dotfiles/master"

sudo pacman -Syuu
yes | sudo pacman --needed -S $(pacman -Qg base-devel | cut -f2 -d " ") \
                        powerline-fonts \
                        otf-fira-code \
                        otf-ipafont \
                        adobe-source-han-sans-otc-fonts \
                        fcitx \
                        fcitx-{gtk2,gtk3,qt5,mozc,configtool} \
                        neovim \
                        go \
                        python \
                        python-pip \
                        npm \
                        tokei \

# gnome setting
curl -L "$DOTFILES_REPO/wallpaper.b64" | base64 -d > ~/Pictures/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/wallpaper.jpg
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# mozc
fcitx-configtool &

# git
git config --global user.name BlackBracken
git config --global user.email me@bracken.black

# neovim
curl --create-dirs -Lo ~/.config/nvim/init.vim "$DOTFILES_REPO/init.vim"

# sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# copy configs
curl -Lo ~/.bashrc       "$DOTFILES_REPO/.bashrc"
curl -Lo ~/.bash_profile "$DOTFILES_REPO/.bash_profile"
curl -Lo ~/.xprofile     "$DOTFILES_REPO/.xprofile"

# install aur packages
for package in $(echo "jetbrains-toolbox \
                       slack-desktop \
                       powerline-go"); do
    pacman -Qi $package > /dev/null
    if [ $? -ne 0 ] ; then    
        git clone "https://aur.archlinux.org/$package.git"
        cd "./$package"
        yes | makepkg -si --needed
        cd "../"
        rm -rf "$package/"
    fi
done
