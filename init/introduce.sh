#!/bin/bash -u
cd `dirname $0`

readonly GEARBOX_DIR="$HOME/.gearbox"

curl -sL https://raw.githubusercontent.com/blackbracken/gearbox/master/res/gear_art | cat

if [ "`whoami`" == "root" ]; then
  echo "gearbox must be spun without the privilege."
  exit 1
elif [ -e $GEARBOX_DIR ]; then
  echo "gearbox has already been introduced."
  exit 1
fi

sudo -v

rm -rf $GEARBOX_DIR
git clone https://github.com/blackbracken/gearbox.git $GEARBOX_DIR

cd $GEARBOX_DIR

make minimal
