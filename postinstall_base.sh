#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo pacman -S chromium mpv alsa-utils ntfs-3g gvfs pcmanfm lxappearance alsa-firmware sof-firmware alsa-ucm-conf xarchiver gnome-themes-standard gnome-themes-extra gvfs-mtp gvfs-smb code avahi cups bluez bluez-utils tlp deluge deluge-gtk

sudo systemctl enable cups
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon
sudo systemctl enable tlp
sudo alsactl store

echo "setxkbmap de" >> ~/.config/bspwm/bspwmrc
echo "QT_STYLE_OVERRIDE=adwaita" >> ~/.config/bspwm/bspwmrc
echo "DESKTOP_SESSION=gnome" >> ~/.config/bspwm/bspwmrc
echo "xrdb -merge ~/.Xresources" >> ~/.config/bspwm/bspwmrc

sudo echo "[Qt]" >> /etc/xdg/Trolltech.conf
sudo echo "style=adwaita" >> /etc/xdg/Trolltech.conf

echo "Xft.dpi: 144" >> ~/.Xresources

mkdir ~/Downloads
mkdir -p ~/Torrents/Downloading
mkdir ~/Torrents/Done
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Work
mkdir ~/Projects
mkdir ~/University
