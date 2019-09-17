#!/bin/bash

yes | sudo pacman --needed -S stack
stack setup --system-ghc
