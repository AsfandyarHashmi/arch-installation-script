#!/bin/bash

# Update packages
sudo pacman -Syyu --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
cd ..

# Install required packages
sudo pacman -S --noconfirm bspwm sxhkd alacritty rofi xorg-xinit feh mpv firefox xorg

# Install required packages (yay)
yay -S --noconfirm polybar

mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/polybar
mkdir -p ~/.config/mpv

# Copy defaults
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Set background
mkdir -p ~/Pictures/Wallpapers
cp images/bg.jpg ~/Pictures/Wallpapers/bg.jpg
feh --bg-scale ~/Pictures/Wallpapers/bg.jpg
echo "~/.fehbg &" >> ~/.xinitrc

# bspwm setup
echo "exec bspwm" >> ~/.xinitrc
cat bspwm/volume-and-brightness-keys-snippet >> ~/.config/sxhkd/sxhkdrc

# Polybar setup
cp /usr/share/doc/polybar/config ~/.config/polybar/
cp polybar/launch.sh ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh
echo "$HOME/.config/polybar/launch.sh" >> ~/.config/bspwm/bspwmrc
