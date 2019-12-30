#!/bin/bash

yay --needed -S stack
stack setup --system-ghc

yay --needed -S haskell-ide-engine
stack install hoogle --resolver lts
stack exec -- hoogle generate
stack hoogle
