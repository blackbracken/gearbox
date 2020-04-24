#!/bin/bash

yay -S stack

stack update
stack install stylish-haskell
stack install hlint
