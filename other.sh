
cmd=(dialog --keep-tite --menu "Select program suite:" 22 76 16)

options=(1 "Minimal"
         2 "Basic"
         3 "Full")

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
                        bash ./other2.sh
                        ;;
                    2)
                        apt install qutebrowser -y
                        bash ./other2.sh
                        ;;
                    3)
                        bash ./other2.sh
                        ;;
                esac
            done
            ;;
        2)
            apt install gufw handbrake audacious audacity putty gimp vlc-plugin-fluidsynth fluidsynth dsda-doom freedoom dosbox milkytracker libsdl2-net-dev cmake sox bison flex -y
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
                        bash ./other2.sh
                        ;;
                    2)
                        apt install qutebrowser -y
                        bash ./other2.sh
                        ;;
                    3)
                        bash ./other2.sh
                        ;;
                esac
            done
            ;;
        3)
            apt install gufw handbrake audacious audacity putty gimp vlc-plugin-fluidsynth fluidsynth mixxx ardour dsda-doom freedoom dosbox libsdl2-net-dev milkytracker cmake sox bison flex -y
            apt purge minetest-server
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
                        bash ./other2.sh
                        ;;
                    2)
                        apt install qutebrowser -y
                        bash ./other2.sh
                        ;;
                    3)
                        bash ./other2.sh
                        ;;
                esac
            done
            ;;

    esac
done
