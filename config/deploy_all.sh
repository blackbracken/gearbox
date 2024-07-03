#!/bin/bash
cd `dirname $0`

chmod +x */deploy.sh
find . -maxdepth 2 -type f -name 'deploy.sh' -exec bash {} \;
