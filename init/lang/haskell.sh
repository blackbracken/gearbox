#!/bin/bash

yes | sudo pacman --needed -S stack
stack setup --system-ghc

yay -S haskell-ide-engine

stack install hoogle --resolver lts
stack exec -- hoogle generate
stack hoogle
