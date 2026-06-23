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
         2 "Cinnamon Lite"
         3 "XFCE"
         4 "XFCE Lite"
         5 "MATE"
         6 "LXQT"
         7 "FVWM-3"
         8 "Enlightenment"
         9 "KDE"
	 10 "Skip to Firmware install")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            apt install cinnamon cinnamon-control-center cinnamon-screensaver cinnamon-session cinnamon-settings-daemon dconf-gsettings-backend f3 desktop-base pulseaudio numix-icon-theme pulseaudio-module-bluetooth pavucontrol gnome-terminal muffin nemo xserver-xorg file-roller network-manager-gnome gnome-calculator ghostscript libmtp-runtime light-locker vlc hyfetch lightdm-gtk-greeter-settings eog xorg lightdm synaptic htop gnome-icon-theme orchis-gtk-theme nemo usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse gedit inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev libglx-mesa0 libgl1-mesa-dri gnome-screenshot dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list

		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        2)
            apt install cinnamon cinnamon-control-center cinnamon-session cinnamon-settings-daemon dconf-gsettings-backend f3 desktop-base pulseaudio numix-icon-theme pavucontrol gnome-terminal muffin nemo xserver-xorg file-roller network-manager-gnome gnome-calculator ghostscript ffmpeg libmtp-runtime light-locker vlc lightdm-gtk-greeter-settings eog xorg lightdm htop orchis-gtk-theme exfalso nemo usb-modeswitch genisoimage gnome-disk-utility gvfs-fuse gedit inputattach xserver-xorg-input-all xserver-xorg-video-all transmission-gtk tumbler mesa-utils gparted xarchiver p7zip zip unzip mesa-utils-bin alsa-utils lm-sensors glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list

		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        3)
            apt install xfce4 xfce4-terminal file-roller network-manager-gnome galculator ghostscript libmtp-runtime light-locker vlc hyfetch f3 lightdm-gtk-greeter-settings ristretto xorg lightdm synaptic htop pulseaudio numix-icon-theme pulseaudio-module-bluetooth gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse mousepad inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk xfce4-notifyd xfce4-power-manager xfce4-whiskermenu-plugin xfce4-power-manager-plugins pavucontrol tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime thunar-archive-plugin mesa-utils-bin gvfs-backends gvfs-common soundconverter build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev xfce4-screenshooter catfish libglx-mesa0 libgl1-mesa-dri thunar-archive-plugin dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        4)
            apt install xfce4 xfce4-terminal file-roller galculator libmtp-runtime light-locker lightdm-gtk-greeter-settings numix-icon-theme f3 xorg lightdm htop usb-modeswitch genisoimage inputattach xfce4-notifyd xfce4-power-manager gparted xarchiver p7zip zip unzip uuid-runtime thunar-archive-plugin libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso libjpeg-dev libglx-mesa0 libgl1-mesa-dri thunar-archive-plugin libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats openssl libao-dev vainfo vdpauinfo bluez-firmware alsa-utils transmission-gtk lm-sensors glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        5)
            apt install caja dconf-gsettings-backend fonts-cantarell gvfs-backends marco mate-control-center mate-desktop f3 mate-icon-theme mate-menus mate-notification-daemon mate-panel mate-polkit mate-session-manager mate-settings-daemon mate-terminal mate-themes file-roller network-manager-gnome galculator ghostscript libmtp-runtime light-locker vlc hyfetch lightdm-gtk-greeter-settings eom xorg lightdm synaptic htop pulseaudio numix-icon-theme pulseaudio-module-bluetooth gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse pluma inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk xfce4-notifyd mate-power-manager pavucontrol tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac libjpeg-dev libglx-mesa0 libgl1-mesa-dri xfce4-screenshooter dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        6)
            apt install desktop-file-utils lxqt-config lxqt-globalkeys lxqt-notificationd lxqt-panel lxqt-policykit lxqt-qtplugin lxqt-runner lxqt-session lxqt-system-theme lxqt-themes pcmanfm-qt featherpad lximage-qt qterminal openbox obconf-qt lxqt-powermanagement lxqt-qtplugin xorg xinit file-roller f3 pulseaudio numix-icon-theme pulseaudio-module-bluetooth pavucontrol-qt galculator ghostscript libmtp-runtime light-locker vlc hyfetch lightdm-gtk-greeter-settings lightdm synaptic htop gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse inputattach xserver-xorg-input-all xserver-xorg-video-all system-config-printer transmission-qt tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        7)
            apt install fvwm3 xfce4-terminal thunar pulseaudio numix-icon-theme pasystray light-locker lightdm-gtk-greeter-settings lightdm file-roller f3 network-manager-gnome galculator ghostscript libmtp-runtime vlc hyfetch ristretto xorg synaptic htop gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse mousepad inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all xorg software-properties-qt system-config-printer transmission-gtk tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev xfce4-screenshooter catfish libglx-mesa0 libgl1-mesa-dri thunar-archive-plugin dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        8)
            apt install enlightenment xfce4-terminal connman thunar pulseaudio numix-icon-theme pasystray light-locker lightdm-gtk-greeter-settings lightdm file-roller f3 network-manager-gnome galculator ghostscript libmtp-runtime vlc hyfetch ristretto xorg synaptic htop gnome-icon-theme usb-modeswitch blueman genisoimage gnome-disk-utility gvfs-fuse mousepad inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all xorg software-properties-qt system-config-printer transmission-gtk tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev xfce4-screenshooter catfish libglx-mesa0 libgl1-mesa-dri thunar-archive-plugin dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        9)
	    apt install kde-plasma-desktop systemsettings plasma-workspace plasma-workspace-wallpapers kwin-wayland kwrite kdenetwork kio-admin kcolorchooser kde-spectacle kgamma konsole gwenview plasma-pa udisks2 upower pulseaudio lightdm lightdm-gtk-greeter-settings pasystray f3 ghostscript libmtp-runtime vlc hyfetch synaptic htop usb-modeswitch blueman genisoimage gvfs-fuse inputattach system-config-printer transmission-qt tumbler mesa-utils gparted xarchiver p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common soundconverter ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac libjpeg-dev libglx-mesa0 libgl1-mesa-dri dbus build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* --no-install-recommends -y
            apt upgrade -y
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;
        10)
            	cmd=(dialog --keep-tite --menu "choose OS:" 22 76 16)

		options=(1 "Debian (server)"
 		         2 "Debian for Raspberry Pi (server)"
         		 3 "Raspberry Pi OS (server)"
			 4 "Armbian (Debian server)")

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

		for choice in $choices
		do
		    case $choice in
		        1)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            #echo 'deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			    echo 'deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list

		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
		            ;;

		        3)
		            bash ./firmware.sh
		            ;;
		        4)
		            bash ./firmware.sh
            		    ;;
            
    			    esac
			done
            ;;

    esac
done
