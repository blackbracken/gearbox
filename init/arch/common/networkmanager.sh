#!/bin/bash

yay --needed -S networkmanager network-manager-applet
sudo systemctl enable NetworkManager
