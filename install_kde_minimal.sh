#!/bin/bash

pacman -Syyu --noconfirm

pacman -S --noconfirm xorg nvidia
pacman -S --noconfirm kscreen sddm-kcm sddm plasma-nm plasma-pa \
    dolphin konsole kdeplasma-addons spectacle mpv nomacs ark \
    partitionmanager kcalc bluedevil powerdevil qbittorrent \
    print-manager system-config-printer breeze-gtk kde-gtk-config \
    keepassxc libnotify xclip kdegraphics-thumbnailers ffmpegthumbs

systemctl enable sddm 

mkdir ~/Downloads
mkdir -p ~/Torrents/Downloading
mkdir ~/Torrents/Done
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Work
mkdir ~/Projects
mkdir ~/University

cp templates/etc_font_local.conf /etc/fonts/local.conf
cp templates/Xresources ~/.Xresources
xrdb -merge ~/.Xresources