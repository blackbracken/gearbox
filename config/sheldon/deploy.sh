#!/bin/bash
cd `dirname $0`

mkdir -p $HOME/.config/sheldon
ln -sf `pwd`/plugins.toml $HOME/.config/sheldon/plugins.toml
