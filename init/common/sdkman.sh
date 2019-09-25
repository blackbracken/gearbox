#!/bin/bash
cd `dirname $0`

if [ -d $SDKMAN_DIR ]; then
    exit 0
fi

curl -s "https://get.sdkman.io" | bash
source $SDKMAN_DIR/bin/sdkman-init.sh
