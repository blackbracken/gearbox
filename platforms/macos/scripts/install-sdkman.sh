#!/usr/bin/env fish

if ! type sdk > /dev/null 2&>1
  curl -s "https://get.sdkman.io" | bash
  fish -c "fisher install reitzig/sdkman-for-fish@v1.4.0"
end
