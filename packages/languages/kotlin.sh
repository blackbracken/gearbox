#!/bin/bash
cd `dirname $0`

sh ./sdkman.sh

yes | sdk install gradle
yes | sdk install kotlin
