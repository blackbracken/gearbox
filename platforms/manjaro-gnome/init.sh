#/bin/bash
cd `dirname $0`

sudo pacman --needed -S base-devel yay
yay

# common packages
yay --needed -S `cat pkg.txt | egrep -v "^#.*|^$"`

rustup toolchain install stable

# dotfiles
for dotfile in $(ls -A dotfiles); do
  rm -f $HOME/$dotfile;
  ln -sf `pwd`/dotfiles/$dotfile $HOME;
  echo "Set the symbolic: $dotfile"
done

# files located in ~/.config
for config in $(ls config); do
  rm -rf $HOME/.config/$config
  ln -sf `pwd`/config/$config $HOME/.config;
  echo "Set the symbolic: $config/"
done

# gnome settings
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gnome-extensions enable `gnome-extensions list | grep launch-new-instance`
gnome-extensions disable `gnome-extensions list | grep dash-to-dock`
gnome-extensions disable `gnome-extensions list | grep arc-menu`

# docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $(whoami)

# zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh
