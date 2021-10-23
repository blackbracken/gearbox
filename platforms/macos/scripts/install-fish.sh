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

if fish -c "fisher" > /dev/null 2>&1; then
  fish -c "fisher update"
else
  fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fi

# plugins
fish -c "fisher install reitzig/sdkman-for-fish@v1.4.0"
