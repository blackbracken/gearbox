#!/bin/bash
cd `dirname $0`

if [ -d $HOME/.sdkman/ ]; then
  exit 0
fi

curl -s "https://get.sdkman.io" | bash
shopt -s expand_aliases

source $HOME/.sdkman/bin/sdkman-init.sh
