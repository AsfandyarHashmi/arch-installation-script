#!/bin/bash

# Installation Help
# cfdisk /dev/<device>
# pacstrap /mnt base base-devel linux linux-firmware
# genfstab -U -p /mnt >> /mnt/etc/fstab

pacman -Syyu --noconfirm

# Set hostname
echo 'omen' > /etc/hostname

# Region and language setup
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.conf
locale-gen
export LANG=en_US.UTF-8
echo 'KEYMAP=de' >> /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc
timedatectl set-local-rtc 1 --adjust-system-clock

# Network setup
pacman -S --noconfirm dhcpcd 
systemctl enable dhcpcd
systemctl enable iwd

# Install hardware tools
pacman -S --noconfirm tlp
systemctl enable tlp

# Install misc. tools
pacman -S --noconfirm vim git

# User setup
pacman -S --noconfirm sudo
useradd -mg users -G wheel,storage,power -s /bin/bash asf
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo 'Arch installation and setup complete! Please make sure to:\n1. arch-chroot /mnt and change passwords for root and your user using passwd.\n2. Setup bootloader.'