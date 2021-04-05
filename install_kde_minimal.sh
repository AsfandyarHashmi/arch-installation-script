#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm xorg nvidia
sudo pacman -S --noconfirm plasma \
    konsole dolphin ark kwrite kcalc spectacle krunner partitionmanager \
    print-manager system-config-printer cups \
    tlp avahi alsa-utils bluez bluez-utils

sudo systemctl enable sddm 
sudo systemctl enable cups
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon
sudo systemctl enable NetworkManager
sudo systemctl enable tlp

mkdir ~/Downloads
mkdir -p ~/Torrents/Downloading
mkdir ~/Torrents/Done
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Work
mkdir ~/Projects
mkdir ~/University
