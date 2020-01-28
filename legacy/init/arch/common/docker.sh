#!/bin/bash

yay --needed -S docker \
                docker-compose

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $(whoami)
