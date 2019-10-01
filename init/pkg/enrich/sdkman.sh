#!/bin/bash
cd `dirname $0`

readonly SDKMAN_DIR="$HOME/.sdkman"

if [ -d $SDKMAN_DIR ]; then
    exit 0
fi

yes | sudo pacman --needed -S zip unzip

curl -s "https://get.sdkman.io" | bash
source $SDKMAN_DIR/bin/sdkman-init.sh
