#!/bin/bash

# Installation Help
# cfdisk /dev/<device>
# pacstrap /mnt base base-devel linux linux-firmware vim git
# genfstab -U -p /mnt >> /mnt/etc/fstab

pacman -Syyu --noconfirm

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
pacman -S --noconfirm dhcpcd tlp tlp-rdw sudo alsa-utils alsa-plugins alsa-firmware sof-firmware alsa-ucm-conf pulseaudio pulseaudio-alsa refind gdisk networkmanager gnome gnome-tweaks firefox mpv code ntfs-3g gnome-passwordsafe chrome-gnome-shell papirus-icon-theme materia-gtk-theme

# Debloat gnome
pacman -R gedit gnome-boxes gnome-weather gnome-photos totem gnome-contacts gnome-calendar epiphany gnome-books gnome-documents gnome-clocks gnome-maps gnome-software

# Enable AUR
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm

# Hide unsavory icons
echo "NoDisplay=true" >> /usr/share/applications/avahi-discover.desktop
echo "NoDisplay=true" >> /usr/share/applications/bssh.desktop
echo "NoDisplay=true" >> /usr/share/applications/bvnc.desktop
echo "NoDisplay=true" >> /usr/share/applications/qv4l2.desktop
echo "NoDisplay=true" >> /usr/share/applications/qvidcap.desktop
echo "NoDisplay=true" >> /usr/share/applications/lstopo.desktop

# Sound setup
alsactl store
echo "options snd-hda-intel index=1,0" >> /etc/modprobe.d/alsa-base.conf

# Enable services
systemctl enable dhcpcd
systemctl enable NetworkManager.service
systemctl enable tlp
systemctl enable gdm
systemctl enable avahi-daemon.service

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
