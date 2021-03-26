#!/bin/bash

sudo pacman -Syyu
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si