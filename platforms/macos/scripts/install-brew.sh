#!/usr/bin/env bash
set -eu -o pipefail

export LC_ALL=C

if ! type brew > /dev/null 2>&1; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

taps=(
    homebrew/cask-fonts
)
for tap in ${taps[@]}; do
    brew tap $tap
done

formulas=(
    bat
    tokei
    exa
    bottom
    peco
    pngquant
    optipng
)
for formula in ${formulas[@]}; do
    brew install $formula
done

casks=(
    alacritty
    jetbrains-toolbox
    visual-studio-code
    font-jetbrains-mono
    font-jetbrains-mono-nerd-font
    android-platform-tools
    spotify
    deepl
)
for cask in ${casks[@]}; do
    brew install --cask $cask
done
