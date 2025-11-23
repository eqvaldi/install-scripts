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
echo                          BeanGreen247/Tomáš Mozdřeň: MATE-Desktop and KDE-Desktop idea
echo
echo                    Github: https://github.com/BeanGreen247
echo
echo ============================================================================

dialog --msgbox "WARNING - YOU ARE ENTERING UNMAINTAINED Desktop Environments" 0 0

cmd=(dialog --keep-tite --menu "Select Desktop Environment:" 22 76 16)

options=(1 "LXDE"
	 2 "Skip to Firmware install")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            dialog --msgbox "WARNING - YOU ARE SURE?" 0 0
            apt install openbox lxsession lxde-common lxappearance lxappearance-obconf openbox-lxde-session lxpanel xfce4-notifyd xfce4-power-manager f3 xfce4-power-manager-plugins ristretto pavucontrol tumbler mesa-utils gparted xarchiver usb-modeswitch p7zip zip unzip uuid-runtime mesa-utils-bin gvfs-backends gvfs-common inputattach xserver-xorg-input-all xserver-xorg-input-synaptics xserver-xorg-video-all system-config-printer transmission-gtk pcmanfm lxterminal mousepad file-roller galculator ghostscript libmtp-runtime light-locker vlc hyfetch lightdm-gtk-greeter-settings xorg lightdm synaptic gdebi htop pulseaudio numix-icon-theme gnome-disk-utility gnome-icon-theme soundconverter network-manager-gnome ffmpeg build-essential libcurl4-openssl-dev libalut-dev libsdl2-dev libsdl2-mixer-dev bluez-firmware alsa-utils lm-sensors libgtk-3-dev libgtk3-perl ffmpeg libavcodec-dev exfalso flac font-manager libjpeg-dev libglx-mesa0 libgl1-mesa-dri xfce4-screenshooter dbus-x11 build-essential git nasm libgl1-mesa-dev libsdl2-dev flac libflac-dev libvpx-dev libgtk2.0-dev freepats libsndfile1-dev ninja-build qtbase5-dev qtbase5-private-dev qtbase5-dev-tools qttools5-dev openssl miniupnpc libao-dev vainfo vdpauinfo libzip-dev zipcmp zipmerge ziptool glmark2-* -y
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
		            echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			          echo 'deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			          echo 'deb http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            cat /etc/apt/sources.list
		            apt update -y
		            bash ./firmware.sh
            
		            ;;
		        2)
		            rm /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			          echo 'deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
			          echo 'deb http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
		            echo 'deb-src http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
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
