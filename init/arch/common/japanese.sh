#!/bin/bash

yay --needed -S scim \
                scim-anthy \
                otf-ipafont \
                noto-fonts-emoji

sed -i -e "/^\/Panel\/Gtk\/ToolBar\/AlwaysHidden/c\/Panel\/Gtk\/ToolBar\/AlwaysHidden = true" ~/.scim/config

scim -d &
