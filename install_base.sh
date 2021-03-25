#!/bin/bash

# Installation Help
# cfdisk /dev/<device>
# pacstrap /mnt base base-devel linux linux-firmware vim git
# genfstab -U -p /mnt >> /mnt/etc/fstab

# Set hostname
echo 'maverick' > /etc/hostname

# Region and language setup
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
export LANG=en_US.UTF-8
echo 'KEYMAP=de' >> /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc

# Install required packages
pacman -Syyu --noconfirm dhcpcd sudo amd-ucode ntfs-3g udisks2 cups tlp tlp-rdw avahi iwd bluez bluez-utils brightnessctl

# Enable services
systemctl enable dhcpcd
systemctl enable tlp
systemctl enable cups
systemctl enable avahi-daemon
systemctl enable iwd
systemctl enable bluetooth

# User setup
useradd -mg users -G wheel,storage,power -s /bin/bash zero
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# Change passwords
echo "Change password for root:"
passwd
echo "Change password for zero:"
passwd zero

# Setup complete
echo ''
echo '*****************************************************************************'
echo 'Arch installation and setup complete!'
echo 'Please install bootloader. (e.g. For rEFInd, refind-install --usedefault /dev/<boot>)'
echo '*****************************************************************************'
echo ''
