#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm xorg nvidia
sudo pacman -S --noconfirm plasma-desktop kscreen sddm-kcm sddm plasma-nm plasma-pa \
    dolphin konsole kdeplasma-addons spectacle mpv nomacs ark \
    partitionmanager kcalc bluedevil powerdevil qbittorrent \
    print-manager system-config-printer breeze-gtk kde-gtk-config \
    keepassxc libnotify xclip kdegraphics-thumbnailers ffmpegthumbs \
    cups bluez bluez-utils avahi networkmanager tlp code ntfs-3g

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
