#!/bin/bash

# Installation Help
# cfdisk /dev/<device>
# pacstrap /mnt base base-devel linux linux-firmware vim git
# genfstab -U -p /mnt >> /mnt/etc/fstab

# Set hostname
echo 'omen' > /etc/hostname

# Region and language setup
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
export LANG=en_US.UTF-8
echo 'KEYMAP=de' >> /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc
timedatectl set-local-rtc 1 --adjust-system-clock

# Install required packages
pacman -Syyu --noconfirm dhcpcd iwd tlp tlp-rdw sudo vim alsa-utils alsa-plugins alsa-firmware sof-firmware alsa-ucm-conf pulseaudio pulseaudio-alsa refind gdisk ntfs-3g

# Enable AUR
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm

# Enable services
systemctl enable dhcpcd
systemctl enable iwd
systemctl enable tlp

# User setup
useradd -mg users -G wheel,storage,power -s /bin/bash asf
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# Change passwords
echo "Change password for root:"
passwd
echo "Change password for asf:"
passwd asf

# Setup complete
echo ''
echo '*****************************************************************************'
echo 'Arch installation and setup complete!'
echo 'Please install bootloader. (e.g. For rEFInd, refind-install --usedefault /dev/<boot>)'
echo '*****************************************************************************'
echo ''
