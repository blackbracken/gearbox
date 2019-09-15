#!/bin/bash

yes | sudo pacman --needed -S $(pacman -Qg base-devel | cut -f2 -d " ")
