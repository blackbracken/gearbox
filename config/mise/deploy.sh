#!/bin/bash
cd `dirname $0`

mkdir -p $HOME/.config/mise
ln -sf `pwd`/config.toml $HOME/.config/mise/config.toml