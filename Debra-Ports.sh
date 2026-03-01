#!/bin/sh
if [ "$(id -u)" = "0" ]; then
    echo "ERROR: Do not run Debra-Ports as root." >&2
    exit 1
fi

mkdir -p ./Debra-Ports
cd ./Debra-Ports
 

dialog --msgbox "DO NOT RUN Debra-Ports ON UBUNTU BASED DISTROS" 0 0

cmd=(dialog --keep-tite --menu "Select a Port:" 22 76 16)

options=(1 "Dhewm3"
         2 "Eduke32"
         3 "Darkplaces"
         4 "Minetest"
         5 "Ioq3"
         6 "worldofpadman (WIP)"
         7 "Yamagi Quake II"
         8 "Yamagi Quake II (Git)"
         9 "iortcw"
	 10 "DSDA-Doom"
	 11 "Classic-cube"
	 12 "Exit")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
          [ -d dhewm3 ] && git -C dhewm3 pull || git clone https://github.com/dhewm/dhewm3.git
	  cd dhewm3/
	  rm -f CMakeCache.txt
	  cmake ./neo/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        2)
          [ -d eduke32 ] && git -C eduke32 pull || git clone https://voidpoint.io/terminx/eduke32.git
	  cd eduke32/
	  make -j$(nproc) USE_OPENGL=0 POLYMER=0 USE_LIBVPX=0 OPTLEVEL=2 WITHOUT_GTK=1
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        3)
          [ -d darkplaces ] && git -C darkplaces pull || git clone https://github.com/DarkPlacesEngine/darkplaces.git
	  cd darkplaces/
	  make -j$(nproc) sdl-release
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        4)
          [ -d minetest ] && git -C minetest pull || git clone --depth 1 https://github.com/minetest/minetest.git
	  cd minetest
	  [ -d games/minetest_game ] && git -C games/minetest_game pull || git clone --depth 1 https://github.com/minetest/minetest_game.git games/minetest_game
	  [ -d lib/irrlichtmt ] && git -C lib/irrlichtmt pull || git clone --depth 1 https://github.com/minetest/irrlicht.git lib/irrlichtmt
	  [ -d games/backroomtest ] && git -C games/backroomtest pull || git clone https://codeberg.org/SumianVoice/backroomtest.git games/backroomtest
	  cmake . -DRUN_IN_PLACE=TRUE
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        5)
          [ -d ioq3 ] && git -C ioq3 pull || git clone https://github.com/ioquake/ioq3.git
	  cd ioq3/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        6)
          if [ ! -d worldofpadman-1.6.2 ]; then
	    wget https://github.com/PadWorld-Entertainment/worldofpadman/archive/refs/tags/v1.6.2.zip
	    unzip *.zip
	    rm -rf ./*.zip
	  fi
	  cd worldofpadman-1.6.2/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        7)
	  if [ ! -d yquake2-QUAKE2_8_30 ]; then
	    wget https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_30.zip
	    unzip *.zip
	    rm -rf ./*.zip
	  fi
	  cd yquake2-QUAKE2_8_30/
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        8)
          [ -d yquake2 ] && git -C yquake2 pull || git clone https://github.com/yquake2/yquake2.git
   	  cd yquake2
	  make -j$(nproc)
	  cd ..
	  cd ..
          bash ./Debra-Ports.sh
            ;;
        9)
          [ -d iortcw ] && git -C iortcw pull || git clone https://github.com/iortcw/iortcw.git
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
        10)
	  [ -d dsda-doom ] && git -C dsda-doom pull || git clone https://github.com/kraflab/dsda-doom.git
	  cd ./dsda-doom/
          cd ./prboom2/
	  cmake ./
	  make -j$(nproc)
	  cd ..
	  cd ..
    	  cd ..
          bash ./Debra-Ports.sh
            ;;
        11)
    	  [ -d ClassiCube-from-src ] && git -C ClassiCube-from-src pull || git clone https://github.com/eqvaldi/ClassiCube-from-src.git
    	  cd ClassiCube-from-src
    	  bash ./build.sh
    	  cd ..
    	  cd ..
          bash ./Debra-Ports.sh
            ;;
        12)
          exit
            ;;

    esac
done
