#!/bin/sh
cp ../pacman.conf /etc/pacman.conf
pacman -Syyu
pacman -S yaourt vim htop tree
./install_wifif_utils.sh
./install_zsh.sh
