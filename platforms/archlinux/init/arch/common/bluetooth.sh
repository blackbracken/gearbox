#!/bin/bash

yay --needed -S bluez bluez-utils blueberry

sudo systemctl enable bluetooth
sudo systemctl start bluetooth
