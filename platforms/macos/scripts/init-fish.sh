#/usr/bin/env bash
set -eu

FILE_SHELLS="/etc/shells"

brew install fish

if [ ! "$(cat ${FILE_SHELLS} | grep `which fish`)" ]; then
  echo `which fish` | sudo tee -a ${FILE_SHELLS} > /dev/null
fi

if [ `which fish` != "${SHELL}" ]; then
  chsh -s `which fish`
fi
