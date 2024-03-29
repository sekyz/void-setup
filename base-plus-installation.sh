# Some base packages and activations

sudo xbps-install -Suv dbus elogind polkit
sudo ln -s /etc/sv/{dbus,elogind,polkitd}
sudo xbps-install cmake gcc wget
sudo xbps-install links # TUI Browser

sudo xbps-install linux-headers # Optional

# -----------------------------

# GNOME
# sudo xbps-install -Suv gnome gdm gnome-terminal mesa-dri xdg-user-dirs xdg-utils

# ----------------------------

# Network Manager
sudo ln -s /etc/sv/NetworkManager /var/service

# -----------------------------

# Basic packages
sudo xbps-install void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree p7zip unzip base-devel xtools bash-completion x265 x265-32bit ffmpeg neofetch htop git openjdk openjdk-jre bridge-utils ntfs-3g neovim git nano

# -----------------------------

# Intel Microcode
sudo xbps-install -S intel-ucode

# -----------------------------

# AMDGPU Drivers
# sudo xbps-install -Suv xf86-video-amdgpu amdvlk amdvlk-32bit mesa-opencl ocl-icd mesa-opencl-32bit ocl-icd-32bit mesa-vulkan-radeon mesa-32bit mesa-dri-32bit mesa-vulkan-radeon-32bit
# sudo xbps-install mesa-ati-dri mesa-ati-dri-32bit

# -----------------------------

# Intel Gpus
sudo xbps-install -S xf86-video-intel intel-media-driver intel-video-accel libva-intel-driver libva-intel-driver-32bit mesa-vulkan-intel mesa-intel-dri

# -----------------------------

# Nvidia Drivers (Prop)
# sudo xbps-install nvidia nvidia-settings nv-codec-headers nvidia-libs-32bit nvidia-opencl

# -----------------------------

# Flatpak and configuration
sudo xbps-install -Suv flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# -----------------------------

# Fonts
sudo xbps-install -Suv dejavu-fonts-ttf amiri-font font-Siji font-awesome font-fira-ttf font-firacode font-go-ttf font-hack-ttf font-libertine-ttf font-unifont-bdf font-sourcecodepro font-unifont-bdf fonts-croscore-ttf fonts-droid-ttf freefont-ttf nerd-fonts noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra source-sans-pro terminus-font ttf-ubuntu-font-family freetype-32bit

# -----------------------------

# XBPS-SRC Configuration
cd Downloads
git clone https://github.com/void-linux/void-packages --depth 1
cd void-packages
./xbps-src binary-bootstrap
# ./xbps-src pkg neofetch
# xi neofetch
cd
su -c "echo XBPS_ALLOW_RESTRICTED=yes >> /etc/conf"

# -----------------------------

# Optional
sudo xi papirus-icon-theme # Papirus Icon Theme

# sudo xi ryzen-stabilizator # for Ryzen CPUs

sudo xi gparted # GNOME Partition Manager app

sudo xi v4l-utils v4l2loopback obs # OBS Studio with virtual camera

# sudo xi vlc # VLC Video Player

# xi firefox # Firefox Web Browser (also there s ungoogled option at the bottom)

sudo flatpak install com.discordapp.Discord # Discord app from Flathub

flatpak override com.discordapp.Discord --filesystem=path_to_allow_access # App can access all folders

# sudo flatpak install org.telegram # Telegram Desktop app from Flathub
# sudo flatpak install gimp inkscape krita # Graphic design apps from Flathub

# -----------------------------

# BSPWM Setup
xi xorg-minimal xorg-server-xdmx xorg-server-xephyr xorg-input-drivers xorg-fonts xf86-input-synaptics xf86-input-mtrack xf86-input-joystick xf86-input-evdev xorg-server-xvfb
xi lightdm lightdm-mini-greeter
xi alsa-utils bluez bluez-alsa cups bluez-cups mpd mpc mpv
xi bspwm polybar sxhkd pcmanfm lxappearance i3lock-color xfce4-power-manager gvfs gvfs-smb gvfs-mtp ImageMagick
xi alacritty
xi ufw # Firewall
# xi kitty # Kitty or Alacritty, Choose One
xi zathura feh ranger # some tui apps
# xi tlp tlp-rdw # Apps for laptops

# Enabling Services
# sudo ln -s /etc/sv/bluetoothd /var/service
# sudo ln -s /etc/sv/cupsd /var/service
sudo ln -s /etc/sv/ufw /var/service

# -----------------------------

# Some Apps
sudo xbps-install -S libreoffice-base
xi inkscape krita gimp # Graphic Design Apps

# -----------------------------

# Ungoogled Chromium (v91)
# mkdir ungoogled-chromium; cd ungoogled-chromium
# wget https://github.com/KF-Art/ungoogled-chromium-void/releases/download/91.0.4472.164_1/ungoogled-chromium-bin-91.0.4472.164_1.x86_64.xbps
# xbps-rindex -a *.xbps
# sudo xbps-install --repository=$PWD ungoogled-chromium-bin

# -----------------------------

# Finish with GDM Activation
# sudo ln -s /etc/sv/gdm /var/service

# -----------------------------

#######   BONUS    ########

# Pfetch

# xdg-user-dirs-update
# cd Downloads
# git clone https://github.com/dylanaraps/pfetch
# cd pfetch
# sudo make install

# -----------------------------
GREEN='\033[1;32m'

echo -e "${GREEN}Base install has finished. Please reboot and active lightdm (sudo ln -s /etc/sv/lightdm /var/service)"
