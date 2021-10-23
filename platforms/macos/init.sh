#!/usr/bin/env bash
set -eu -o pipefail

export LC_ALL=C

cd `dirname $0`

if !(type "brew" > /dev/null 2>&1); then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install `cat common-pkg.txt | egrep -v "^#.*|^$"`
brew install --cask `cat common-pkg-cask.txt | egrep -v "^#.*|^$"`

bash ./scripts/init-fish.sh
