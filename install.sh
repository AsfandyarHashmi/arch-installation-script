#!/bin/bash
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt

pacman -Syyu --noconfirm

echo 'omen' > /etc/hostname

echo 'en_US.UTF-8 UTF-8' >> /etc/locale.conf
locale-gen
export LANG=en_US.UTF-8
localectl set-keymap --no-convert de
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc
timedatectl set-local-rtc 1 --adjust-system-clock

pacman -S --noconfirm vim tlp dhcpcd iwd git sudo firefox mpv

systemctl enable dhcpcd
systemctl enable iwd
systemctl enable tlp

git clone https://aur.archlinux.org/yay.git
(cd yay && makepkg -si)

useradd -mg users -G wheel,storage,power -s /bin/bash asf
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo 'Arch installation and setup complete! Please make sure to:\n1. arch-chroot /mnt and change passwords for root and your user using passwd.\n2. Setup bootloader.'