#!/bin/bash

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm bspwm sxhkd alacritty nitrogen picom lightdm lightdm-gtk-greeter rofi firefox mpv polybar

sudo systemctl enable lightdm

mkdir ~/.config
