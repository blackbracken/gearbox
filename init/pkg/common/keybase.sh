#!/bin/bash

sudo pacman --needed -S keybase

keybase pgp export | gpg --import
keybase pgp export --secret | gpg --allow-secret-key --import

git config --global user.signingkey B1FC23B8715B228978DF603180817D61AF1D3F9B
git config --global gpg.program gpg
git config --global commit.gpgsign true
