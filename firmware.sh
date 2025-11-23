

cmd=(dialog --keep-tite --menu "Select Firmware:" 22 76 16)

options=(1 "Intel PC "
         2 "Intel PC Realtek+Brodcom Wlan/ETH Firmware"
         3 "firmware-qcom-media+SOC "
         4 "AMD PC"
         5 "AMD PC Realtek+Brodcom Wlan/ETH Firmware"
         6 "firmware-qcom-media+SOC Realtek+Brodcom Wlan/ETH Firmware"
         7 "Raspberry Pi Firmware"
         8 "Raspberry Pi Firmware/WideWine (RPIOS)"
         9 "Intel Server Firmware"
         10 "AMD Server Firmware"
	 11 "Linux Firmware/Realtek+Brodcom Wlan/ETH Firmware"
         12 "Linux Firmware/"
         13 "Armbian Firmware/Realtek Wlan/ETH Firmware"
         14 "Armbian Firmware/Brodcom Wlan/ETH Firmware"
         15 "ARM Server Firmware"
         16 "Skip to headers install")
         
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            apt install intel-microcode firmware-sof-signed firmware-intel-misc firmware-intel-sound firmware-iwlwifi firmware-linux-free alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        2)
            apt install intel-microcode firmware-sof-signed firmware-intel-misc firmware-intel-sound firmware-iwlwifi firmware-realtek firmware-brcm80211 firmware-mediatek firmware-linux-free alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        3)
            apt install firmware-qcom-media firmware-qcom-soc -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        4)
            apt install firmware-amd-graphics amd64-microcode firmware-iwlwifi alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        5)
            apt install firmware-amd-graphics amd64-microcode firmware-iwlwifi firmware-realtek firmware-brcm80211 firmware-mediatek alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        6)
            apt install firmware-qcom-media firmware-qcom-soc firmware-realtek firmware-brcm80211 -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        7)
            apt install raspi-firmware -y
	    bash ./other.sh
	    ;;
        8)
            apt install raspi-firmware libwidevinecdm0 -y
	    bash ./other.sh
	    ;;
        9)
            apt install intel-microcode firmware-sof-signed firmware-linux-free ixp4xx-microcode samba alsa-firmware-loaders cifs-utils pciutils openssh-* -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        10)
            apt install amd64-microcode firmware-linux-free ixp4xx-microcode samba alsa-firmware-loaders cifs-utils pciutils openssh-* -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        11)
            apt install firmware-linux-free firmware-realtek alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        12)
            apt install firmware-linux-free firmware-brcm80211 alsa-firmware-loaders pciutils cifs-utils -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        13)
	    bash ./other.sh
	    ;;
        14)
	    bash ./other.sh
	    ;;
        15)
            apt install firmware-linux-free ixp4xx-microcode samba alsa-firmware-loaders cifs-utils pciutils openssh-* -y
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;
        16)
		cmd=(dialog --keep-tite --menu "Select linux Headers:" 22 76 16)
		
		options=(1 "Amd64"
   		         2 "Arm64"
   		         3 "Do not install")
		
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		
		for choice in $choices
		do
    		    case $choice in
        		1)
            		    apt install linux-headers-amd64 -y
            		    bash ./other.sh
            		    ;;
        		2)
            		    apt install linux-headers-arm64 -y
            		    bash ./other.sh
            		    ;;
        		3)
            		    bash ./other.sh
            		    ;;

	    		    esac
			done
            ;;

    esac
done
