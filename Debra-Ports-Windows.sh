#!/bin/sh
# Debra-Ports-Windows.sh
# Cross-compiles Windows 10/11 (x86_64) binaries using MinGW-w64.
# Requires: sudo apt install mingw-w64

if [ "$(id -u)" = "0" ]; then
    echo "ERROR: Do not run Debra-Ports-Windows as root." >&2
    exit 1
fi

if ! command -v x86_64-w64-mingw32-gcc >/dev/null 2>&1; then
    echo "ERROR: mingw-w64 not found. Install it with:" >&2
    echo "  sudo apt install mingw-w64" >&2
    exit 1
fi

MINGW="x86_64-w64-mingw32"

mkdir -p ./Debra-Ports-Windows
cd ./Debra-Ports-Windows

dialog --msgbox "DO NOT RUN Debra-Ports-Windows ON UBUNTU BASED DISTROS" 0 0

# Write CMake toolchain file for projects that use CMake
TOOLCHAIN_FILE="$(pwd)/mingw-w64-toolchain.cmake"
cat > "$TOOLCHAIN_FILE" << 'TOOLCHAIN_EOF'
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)
set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
TOOLCHAIN_EOF

cmd=(dialog --keep-tite --menu "Select a Port: [Windows x86_64 / MinGW-w64]" 22 76 16)

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
          git clone https://github.com/dhewm/dhewm3.git
          cd dhewm3/
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" ./neo/
          make -j$(nproc)
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        2)
          git clone https://voidpoint.io/terminx/eduke32.git
          cd eduke32/
          make -j$(nproc) PLATFORM=windows CROSS="${MINGW}-" USE_LIBVPX=0 OPTLEVEL=2 WITHOUT_GTK=1
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        3)
          git clone https://github.com/DarkPlacesEngine/darkplaces.git
          cd darkplaces/
          make -j$(nproc) sdl-release CC="${MINGW}-gcc" CXX="${MINGW}-g++" WINDRES="${MINGW}-windres"
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        4)
          git clone --depth 1 https://github.com/minetest/minetest.git
          cd minetest
          git clone --depth 1 https://github.com/minetest/minetest_game.git games/minetest_game
          git clone --depth 1 https://github.com/minetest/irrlicht.git lib/irrlichtmt
          git clone https://codeberg.org/SumianVoice/backroomtest.git games/backroomtest
          cmake . -DRUN_IN_PLACE=TRUE -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE"
          make -j$(nproc)
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        5)
          git clone https://github.com/ioquake/ioq3.git
          cd ioq3/
          make -j$(nproc) PLATFORM=mingw32 ARCH=x86_64 CROSS_COMPILE_TARGET="$MINGW"
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        6)
          wget https://github.com/PadWorld-Entertainment/worldofpadman/archive/refs/tags/v1.6.2.zip
          unzip *.zip
          rm -rf ./*.zip
          cd worldofpadman-1.6.2/
          make -j$(nproc) PLATFORM=mingw32 ARCH=x86_64 CROSS_COMPILE_TARGET="$MINGW"
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        7)
          wget https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_30.zip
          unzip *.zip
          rm -rf ./*.zip
          cd yquake2-QUAKE2_8_30/
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" .
          make -j$(nproc)
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        8)
          git clone https://github.com/yquake2/yquake2.git
          cd yquake2
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" .
          make -j$(nproc)
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        9)
          git clone https://github.com/iortcw/iortcw.git
          cd iortcw/
          cd SP/
          make -j$(nproc) PLATFORM=mingw32 ARCH=x86_64 CROSS_COMPILE_TARGET="$MINGW"
          cd ..
          cd MP/
          make -j$(nproc) PLATFORM=mingw32 ARCH=x86_64 CROSS_COMPILE_TARGET="$MINGW"
          cd ..
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        10)
          git clone https://github.com/kraflab/dsda-doom.git
          cd ./dsda-doom/
          cd ./prboom2/
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" ./
          make -j$(nproc)
          cd ..
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        11)
          git clone https://github.com/eqvaldi/ClassiCube-from-src.git
          cd ClassiCube-from-src
          make -j$(nproc) CC="${MINGW}-gcc" AR="${MINGW}-ar" PLAT=win64
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        12)
          exit
            ;;

    esac
done
