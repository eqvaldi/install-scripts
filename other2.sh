cmd=(dialog --keep-tite --menu "Select GPU Driver:" 22 76 16)

options=(1 "NVIDIA-Latest (firmware-nvidia)"
	2 "Intel-nonfree (INTEL)"
	3 "Do not install")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices; do
	case $choice in
	1)
		apt install firmware-nvidia-graphics -y
		dialog --title "Flatpak Support?" \
			--yesno "Do you want to install Flatpak" 7 60

		response=$?
		case $response in
		0)
			apt install gnome-software gnome-software-plugin-flatpak flatpak -y
			echo Install finished,rebooting now.
			reboot
			;;
		1)
			echo Flatpak install skipped. --NO--
			echo Install finished,rebooting now.
			reboot
			;;
		255)
			echo Flatpak install skipped. --user--
			echo Install finished,rebooting now.
			reboot
			;;
		esac
		;;
	2)
		apt install i965-va-driver-shaders -y
		echo NOTE: This Driver will remove the Intel media driver pakage.
		dialog --title "Flatpak Support?" \
			--yesno "Do you want to install Flatpak" 7 60

		response=$?
		case $response in
		0)
			apt install gnome-software gnome-software-plugin-flatpak flatpak -y
			echo Install finished,rebooting now.
			reboot
			;;
		1)
			echo Flatpak install skipped. --NO--
			echo Install finished,rrebooting now.
			reboot
			;;
		255)
			echo Flatpak install skipped. --user--
			echo Install finished,rebooting now.
			reboot
			;;
		esac
		;;
	3)
		dialog --title "Flatpak Support?" \
			--yesno "Do you want to install Flatpak" 7 60

		response=$?
		case $response in
		0)
			apt install gnome-software gnome-software-plugin-flatpak flatpak -y
			echo Install finished,rebooting now.
			reboot
			;;
		1)
			echo Flatpak install skipped. --NO--
			echo Install finished,rebooting now.
			reboot
			;;
		255)
			echo Flatpak install skipped. --user--
			echo Install finished,rebooting now.
			reboot
			;;
		esac
		;;
	esac
done
