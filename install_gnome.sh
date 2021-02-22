# Install required packages
pacman -S --noconfirm networkmanager gnome gnome-tweaks mpv gnome-passwordsafe chrome-gnome-shell

# Debloat gnome
pacman -R gedit gnome-boxes gnome-weather gnome-photos totem gnome-contacts gnome-calendar epiphany gnome-books gnome-documents gnome-clocks gnome-maps gnome-software

# Enable services
systemctl disable iwd
systemctl enable NetworkManager.service
systemctl enable gdm
systemctl enable avahi-daemon.service