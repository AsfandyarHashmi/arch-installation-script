#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm xorg nvidia
sudo pacman -S --noconfirm kscreen sddm-kcm sddm plasma-nm plasma-pa \
    dolphin konsole kdeplasma-addons spectacle mpv nomacs ark \
    partitionmanager kcalc bluedevil powerdevil qbittorrent \
    print-manager system-config-printer breeze-gtk kde-gtk-config \
    keepassxc libnotify xclip kdegraphics-thumbnailers ffmpegthumbs

sudo systemctl enable sddm 

mkdir ~/Downloads
mkdir -p ~/Torrents/Downloading
mkdir ~/Torrents/Done
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Work
mkdir ~/Projects
mkdir ~/University

sudo cp templates/etc_font_local.conf /etc/fonts/local.conf
cp templates/Xresources ~/.Xresources
xrdb -merge ~/.Xresources
