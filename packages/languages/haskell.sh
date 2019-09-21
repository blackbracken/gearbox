#!/bin/bash

yes | sudo pacman --needed -S stack
stack setup --system-ghc

yes | yay -S haskell-ide-engine
