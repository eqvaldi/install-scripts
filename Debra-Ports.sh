#!/bin/sh

if [ "$(id -u)" = "0" ]; then
    echo "ERROR: Do not run Debra-Ports as root." >&2
    exit 1
fi

mkdir ./Debra-Ports
cd ./Debra-Ports 

dialog --msgbox "DO NOT RUN Debra-Ports ON UBUNTU BASED DISTROS" 0 0

cmd=(dialog --keep-tite --menu "Select a Port:" 22 76 16)

options=(1 "Dhewm3"
         2 "Eduke32"
         3 "Darkplaces (quake 1)"
         4 "QuakeSpasm (quake 1,Librequake)"
         5 "luanti (Minetest)"
         6 "Ioq3 (Quake3)"
         7 "taradino (Rise of the triad)"
         8 "Yamagi Quake II"
         9 "Yamagi Quake II (Git)"
         10 "Yamagi Quake II (Remaster)"
         11 "iortcw (Return to Castle Wolfenstein)"
	 12 "Wolf3D"
	 13 "DSDA-Doom (Doom,Heretic,Hexen)"
	 14 "UZDoom (Doom,Heretic,Hexen)"
	 15 "Classic-cube"
	 16 "Exit")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
          git clone https://github.com/dhewm/dhewm3.git
	  cd dhewm3/
	  cmake ./neo/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        2)
          git clone https://voidpoint.io/terminx/eduke32.git
	  cd eduke32/
	  make -j$(nproc) USE_OPENGL=0 POLYMER=0 USE_LIBVPX=0 OPTLEVEL=2 WITHOUT_GTK=1
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        3)
          git clone https://github.com/DarkPlacesEngine/darkplaces.git
	  cd darkplaces/
	  make -j$(nproc) sdl-release
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        4)
          git clone https://github.com/sezero/quakespasm.git
          cd quakespasm/Quake/
          make USE_SDL2=1
          cd ..
	  cd ..
	  cd ..
	  bash ./Debra-Ports.sh
            ;;
        5)
          git clone --depth 1 https://github.com/luanti-org/luanti.git
	  cd luanti/
	  git clone --depth 1 https://github.com/minetest/minetest_game.git games/minetest_game
 	  git clone --depth 1 https://github.com/minetest/irrlicht.git lib/irrlichtmt
	  git clone https://codeberg.org/SumianVoice/backroomtest.git games/backroomtest
	  cmake . -DRUN_IN_PLACE=TRUE
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        6)
          git clone https://github.com/ioquake/ioq3.git
	  cd ioq3/
	  cmake ./
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        7)
          git clone https://github.com/fabiangreffrath/taradino.git
	  cd taradino/
	  cmake ./
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        8)
	  wget https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_60.zip
   	  unzip *.zip
	  rm -rf ./*.zip
   	  cd yquake2-QUAKE2_8_60/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        9)
          git clone https://github.com/yquake2/yquake2.git
   	  cd yquake2
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        10)
	  git clone https://github.com/yquake2/yquake2remaster.git
	  cd yquake2remaster/
	  cmake ./
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        11)
          git clone https://github.com/iortcw/iortcw.git
	  cd iortcw/
   	  cd SP/
      	  make -j$(nproc)
	  cd ..
          cd MP/
	  make -j$(nproc)
   	  cd ..
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        12)
	  git clone https://github.com/ECWolfEngine/ECWolf.git
	  cd ECWolf/
	  cmake ./
	  make  -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        13)
	  git clone https://github.com/kraflab/dsda-doom.git
	  cd ./dsda-doom/
          cd ./prboom2/
	  cmake ./
	  make -j$(nproc)
	  cd ..
	  cd ..
    	  cd ..
          bash ./Debra-Ports.sh
            ;;
        14)
          git clone https://github.com/UZDoom/UZDoom.git
	  mkdir -p UZDoom/build
	  cd UZDoom/build
	  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -G Ninja                             ..
	  cmake --build .
	  cd ..
	  cd ..
    	  cd ..  
    	  bash ./Debra-Ports.sh
            ;;     
        15)
    	  git clone https://github.com/ClassiCube/ClassiCube.git
    	  cd ClassiCube
    	  make -j$(nproc)
    	  cd ..
    	  cd ..
          bash ./Debra-Ports.sh
            ;;
        16)
          exit
            ;;

    esac
done
