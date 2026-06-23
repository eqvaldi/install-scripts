#!/bin/sh
echo ============================================================================
echo
echo
echo                    Copyright © Eqvaldi-deer/Eqvaldi-records
echo
echo
echo                                   2017-2025
echo
echo                               special thanks to:
echo
echo          BeanGreen247/Tomáš Mozdřeň: MATE-Desktop and KDE-Desktop idea.
echo
echo                    Github: https://github.com/BeanGreen247
echo
echo ============================================================================

apt update
apt install dialog -y

dialog --msgbox "DO NOT RUN THESE SCRIPTS ON UBUNTU BASED DISTROS" 0 0


cmd=(dialog --keep-tite --menu "Select Desktop Environment:" 22 76 16)

options=(1 "Cinnamon"
         2 "XFCE")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            apt install cinnamon cinnamon-control-center cinnamon-screensaver cinnamon-session cinnamon-settings-daemon dconf-gsettings-backend f3 desktop-base pulseaudio numix-icon-theme pulseaudio-module-bluetooth pavucontrol gnome-terminal muffin nemo xserver-xorg file-roller network-manager-gnome gnome-calculator ghostscript libmtp-runtime light-locker vlc hyfetch lightdm-gtk-greeter-settings eog xorg lightdm synaptic htop gnome-icon-theme orchis-gtk-theme nemo usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse gedit inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev libglx-mesa0 libgl1-mesa-dri gnome-screenshot dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool quakespasm gufw handbrake audacious audacity putty gimp vlc-plugin-fluidsynth fluidsynth dsda-doom freedoom dosbox milkytracker libsdl2-net-dev cmake sox bison flex chromium-browser glmark2-* -y
            apt upgrade -y
            
            ;;
        2)
	    apt install xfce4 xfce4-terminal file-roller network-manager-gnome galculator ghostscript libmtp-runtime light-locker vlc hyfetch f3 lightdm-gtk-greeter-settings ristretto xorg lightdm synaptic htop pulseaudio numix-icon-theme pulseaudio-module-bluetooth gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse mousepad inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk xfce4-notifyd xfce4-power-manager xfce4-whiskermenu-plugin xfce4-power-manager-plugins pavucontrol tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime thunar-archive-plugin mesa-utils-bin gvfs-backends gvfs-common soundconverter build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev xfce4-screenshooter catfish libglx-mesa0 libgl1-mesa-dri thunar-archive-plugin dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool quakespasm gufw handbrake audacious audacity putty gimp vlc-plugin-fluidsynth fluidsynth dsda-doom freedoom dosbox milkytracker libsdl2-net-dev cmake sox bison flex chromium-browser glmark2-* -y
            apt upgrade -y
            ;;
    esac
done
