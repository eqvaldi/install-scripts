
cmd=(dialog --keep-tite --menu "Select program suite:" 22 76 16)

options=(1 "Minimal"
         2 "Basic")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            apt install gufw handbrake audacious audacity putty gimp dosbox milkytracker libsdl2-net-dev cmake sox -y
            cmd=(dialog --keep-tite --menu "Select Web browser:" 22 76 16)

            options=(1 "chromium"
                     2 "qutebrowser"
                     3 "Do not install")

            choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

            for choice in $choices
            do
                case $choice in
                    1)
                        apt install chromium -y
                        echo Install finished,rebooting now.
			reboot
                        ;;
                    2)
                        apt install qutebrowser -y
                        echo Install finished,rebooting now.
			reboot
                        ;;
                    3)
                        echo Install finished,rebooting now.
			reboot
                        ;;
                esac
            done
            ;;
        2)
            apt install quakespasm gufw handbrake audacious audacity putty gimp vlc-plugin-fluidsynth fluidsynth dsda-doom freedoom dosbox milkytracker libsdl2-net-dev cmake sox bison flex -y
            cmd=(dialog --keep-tite --menu "Select Web browser:" 22 76 16)

            options=(1 "chromium"
                     2 "qutebrowser"
                     3 "Do not install")

            choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

            for choice in $choices
            do
                case $choice in
                    1)
                        apt install chromium -y
			echo Install finished,rebooting now.
			reboot
                        ;;
                    2)
                        apt install qutebrowser -y
                        echo Install finished,rebooting now.
			reboot
                        ;;
                    3)
                        echo Install finished,rebooting now.
			reboot
                        ;;
                esac
            done
            ;;

    esac
done
