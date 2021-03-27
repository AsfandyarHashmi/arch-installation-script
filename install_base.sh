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
timedatectl set-local-rtc 1 --adjust-system-clock

# Speed up makepkg
sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf

# Update mirrors
pacman -Syyu --noconfirm reflector
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Install required packages
pacman -Syyu --noconfirm dhcpcd sudo amd-ucode iwd
#pacman -S --noconfirm dhcpcd sudo amd-ucode ntfs-3g udisks2 cups tlp \
#    alsa-utils avahi bluez bluez-utils networkmanager openssh \
#    zsh zsh-completions refind mpv iwd brightnessctl gvfs

# Enable services
systemctl enable dhcpcd
#systemctl enable tlp
#systemctl enable cups
#systemctl enable avahi-daemon
#systemctl enable bluetooth
#systemctl enable NetworkManager
systemctl enable iwd

# User setup
useradd -mg users -G wheel,storage,power -s /bin/bash zero
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# Change passwords
echo "Change password for root:"
passwd
echo "Change password for zero:"
passwd zero

# Setup complete
echo 'Arch installation and setup complete! Please install bootloader.'
