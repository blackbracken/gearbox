#!/bin/bash
cd `dirname $0`

sh ./sdkman.sh

. $HOME/.sdkman/bin/sdkman-init.sh
yes | sdk install gradle
yes | sdk install kotlin
