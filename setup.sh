#!/bin/bash

readonly BASH="${HOME}/.bashrc"
readonly XMODMAP="${HOME}/.xmodmap"

# add aliaes
echo "alias vim=nvim"                                        >> $BASH

# rewrite CapsLock to L_Ctrl
echo "keycode  66 = Control_L Control_L Control_L Control_L" >  $XMODMAP
echo "remove Lock = Control_L"                               >> $XMODMAP
echo "add Control = Control_L"                               >> $XMODMAP

echo "RESTART TERMINAL!"
