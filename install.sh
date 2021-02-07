#!/bin/bash

# Installation Help
# cfdisk /dev/<device>
# pacstrap /mnt base base-devel linux linux-firmware
# genfstab -U -p /mnt >> /mnt/etc/fstab

pacman -Syyu --noconfirm

# Set hostname
echo 'omen' > /etc/hostname

# Region and language setup
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
export LANG=en_US.UTF-8
echo 'KEYMAP=de' >> /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc
timedatectl set-local-rtc 1 --adjust-system-clock

# Install required packages
pacman -S --noconfirm dhcpcd iwd tlp vim sudo alsa-utils alsa-plugins alsa-firmware sof-firmware alsa-ucm-conf

# Sound setup
alsactl store
echo "options snd_hda_instal index=1" >> /etc/modprobe.d/default.conf


# Network setup
systemctl enable dhcpcd
systemctl enable iwd

# Enable tlp
systemctl enable tlp

# User setup
useradd -mg users -G wheel,storage,power -s /bin/bash asf
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# Setup complete
echo ''
echo '*****************************************************************************'
echo 'Arch installation and setup complete!'
echo 'Please make sure to:'
echo '1. Change passwords for root and your user using passwd.'
echo '2. Install bootloader. (e.g. For rEFInd, refind-install --use-default /dev/<boot>)'
echo '*****************************************************************************'
echo ''
