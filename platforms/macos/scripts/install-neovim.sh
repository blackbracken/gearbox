#!/usr/bin/env fish

cd (dirname (status filename))
cd ../

brew install neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p $HOME/.config/nvim/
for file in (ls -A config/neovim)
  rm -rf $HOME/.config/nvim/$file
  ln -sf (pwd)/config/neovim/$file $HOME/.config/nvim/$file
end
