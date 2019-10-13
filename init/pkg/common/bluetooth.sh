#!/bin/bash

sudo pacman --needed -S bluez bluez-utils blueberry

sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl daemon-reload
