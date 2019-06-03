#!/bin/bash

readonly BASHRC="${HOME}/.bashrc"
readonly NETRC="${HOME}/.netrc"
readonly XMODMAP="${HOME}/.xmodmap"
readonly XPROFILE="${HOME}/.xprofile"
readonly VIM_CONFIG="${HOME}/.config/nvim/init.vim"

# https://github.com/nagygergo/jetbrains-toolbox-install/blob/master/jetbrains-toolbox.sh
# licensed under MIT License; Copyright nagygergo 2016
readonly USER_AGENT='User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'
readonly JETBRAINS_TOOLBOX_URL=$(curl 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')

# essential packages
sudo pacman -S git

# install languages
sudo pacman -S jre-openjre jdk-openjdk
sudo pacman -S python
sudo pacman -S stack
sudo pacman -S npm
sudo npm -g pug pug-cli sass

# install fonts
sudo pacman -S otf-fira-code

# git settings
git config --global user.name BlackBracken
git config --global user.email me@bracken.black

# japanize keyboard-layout
sudo pacman -S otf-ipafont adobe-source-han-sans-otc-fonts 
sudo pacman -S fcitx-gtk2 fcitx-gtk3 fcitx-qt4
sudo pacman -S fcitx-im fcitx-mozc
echo "export GTK_IM_MODULE=fcitx"    >  $XPROFILE
echo "export QT_IM_MODULE=fcitx"     >> $XPROFILE
echo "export XMODIFIERS='@IM=fcitx'" >> $XPROFILE

# rewrite CapsLock to L_Ctrl
echo "keycode  66 = Control_L Control_L Control_L Control_L" >  $XMODMAP
echo "remove Lock = Control_L"                               >> $XMODMAP
echo "add Control = Control_L"                               >> $XMODMAP
echo "/usr/bin/xmodmap ${XMODMAP}"                           >> $BASHRC

# install jetbrains-toolbox
wget -c --output-document="jetbrains-toolbox.tar.gz" $JETBRAINS_TOOLBOX_URL
tar --strip=1 -zxf "jetbrains-toolbox.tar.gz"
rm "jetbrains-toolbox.tar.gz"
./jetbrains-toolbox

# install neovim & dein.vim
sudo pacman -S neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ${HOME}/.cache/dein
rm ./dein_installer.sh
curl https://raw.githubusercontent.com/blackbracken/dotfiles/master/init.vim > $VIM_CONFIG
sed -i -e "s/blackbracken/${USER}/" $VIM_CONFIG
echo "alias vim=nvim" >> $BASHRC

# install Minecraft
git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher/
makepkg -sic
cd ~ 
rm -rf minecraft-launcher/

# install Slack
git clone https://aur.archlinux.org/slack-desktop.git
cd slack-desktop/
makepkg -sic
cd ~
rm -rf slack-desktop/

# install Discord
git clone https://aur.archlinux.org/discord.git
cd discord/
makepkg -sic
cd ~
rm -rf discord/

# install Spotify
git clone https://aur.archlinux.org/spotify.git
cd spotify/
makepkg -sic
cd ~
rm -rf spotify

# add util aliases
echo "alias :q=exit" >> $BASHRC

# update pacman packages
sudo pacman -Syu

# write passwords
echo "GitHub settings"
if grep -F "machine github.com" $NETRC > /dev/null; then
    echo "Skipped bacause the settings found"
else
    echo "machine github.com"     >> $NETRC
    read -p  "> username: "       >> $NETRC
    read -ps "> password/token: " >> $NETRC
fi

echo "Setup has been successful! Do not forget to restart terminal."
