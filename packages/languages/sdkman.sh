#!/bin/bash

if [ -d ~/.sdkman/ ]; then
  exit 0
fi

curl -s "https://get.sdkman.io" | bash
shopt -s expand_aliases
source ~/.sdkman/bin/sdkman-init.sh
