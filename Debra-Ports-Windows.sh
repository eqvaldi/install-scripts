#!/bin/sh
# Debra-Ports-Windows.sh
# Cross-compiles Windows 10/11 (x86_64) binaries using MinGW-w64.
# Requires: sudo apt install mingw-w64 libopenal-dev libsdl2-dev

if [ "$(id -u)" = "0" ]; then
    echo "ERROR: Do not run Debra-Ports-Windows as root." >&2
    exit 1
fi

MISSING=""
if ! command -v x86_64-w64-mingw32-gcc >/dev/null 2>&1; then
    MISSING="$MISSING mingw-w64"
fi
if ! dpkg -s libopenal-dev >/dev/null 2>&1; then
    MISSING="$MISSING libopenal-dev"
fi
if ! dpkg -s libsdl2-dev >/dev/null 2>&1; then
    MISSING="$MISSING libsdl2-dev"
fi
if [ -n "$MISSING" ]; then
    echo "ERROR: Missing required packages:$MISSING" >&2
    echo "Install with: sudo apt install$MISSING" >&2
    exit 1
fi

MINGW="x86_64-w64-mingw32"
PREFIX="/usr/x86_64-w64-mingw32"

# --- One-time: install OpenAL-Soft Windows import lib into the mingw sysroot ---
# libopenal-dev only ships a Linux .so; the MinGW linker needs a Windows .dll.a
if [ ! -f "$PREFIX/lib/libOpenAL32.dll.a" ]; then
    echo "==> OpenAL Windows import lib not found - downloading openal-soft Windows dev package..."
    OALVER="1.24.2"
    OALTMP="$(mktemp -d)"
    wget -q -O "$OALTMP/openal.zip" \
        "https://github.com/kcat/openal-soft/releases/download/${OALVER}/openal-soft-${OALVER}-bin.zip"
    unzip -q "$OALTMP/openal.zip" -d "$OALTMP"
    OALDIR="$OALTMP/openal-soft-${OALVER}-bin"
    sudo cp -r "$OALDIR/include/." "$PREFIX/include/"
    sudo cp "$OALDIR/libs/Win64/libOpenAL32.dll.a" "$PREFIX/lib/"
    sudo cp "$OALDIR/bin/Win64/soft_oal.dll" "$PREFIX/bin/OpenAL32.dll"
    rm -rf "$OALTMP"
    echo "==> OpenAL installed to $PREFIX"
fi

# --- One-time: install SDL2 MinGW dev package into the mingw sysroot ---
# libsdl2-dev ships Debian-patched headers (SDL_config.h -> _real_SDL_config.h)
# that break MinGW cross-compilation. Use the official upstream MinGW package instead.
if [ ! -f "$PREFIX/lib/libSDL2.dll.a" ]; then
    echo "==> SDL2 MinGW headers/libs not found - downloading SDL2 MinGW dev package..."
    SDL2VER="2.30.10"
    SDL2TMP="$(mktemp -d)"
    wget -q -O "$SDL2TMP/sdl2.tar.gz" \
        "https://github.com/libsdl-org/SDL/releases/download/release-${SDL2VER}/SDL2-devel-${SDL2VER}-mingw.tar.gz"
    tar -xzf "$SDL2TMP/sdl2.tar.gz" -C "$SDL2TMP"
    SDL2DIR="$SDL2TMP/SDL2-${SDL2VER}/x86_64-w64-mingw32"
    sudo cp -r "$SDL2DIR/include/." "$PREFIX/include/"
    sudo cp -r "$SDL2DIR/lib/."     "$PREFIX/lib/"
    sudo cp -r "$SDL2DIR/bin/."     "$PREFIX/bin/"
    rm -rf "$SDL2TMP"
    echo "==> SDL2 installed to $PREFIX"
fi

mkdir -p ./Debra-Ports-Windows
cd ./Debra-Ports-Windows

dialog --msgbox "DO NOT RUN Debra-Ports-Windows ON UBUNTU BASED DISTROS" 0 0

# Write windres wrapper first so the path can be embedded directly in the toolchain file.
# --preprocessor must come before -O coff (cmake puts RC_FLAGS after),
# so we wrap windres itself to inject the flag first.
RCPPWRAPPER="$(pwd)/mingw-w64-cpp-wrapper.sh"
cat > "$RCPPWRAPPER" << 'RCPPWRAPPER_EOF'
#!/bin/sh
exec x86_64-w64-mingw32-gcc-posix -E -xc-header -DRC_INVOKED "$@"
RCPPWRAPPER_EOF
chmod +x "$RCPPWRAPPER"

RCWRAPPER="$(pwd)/mingw-w64-windres-wrapper.sh"
cat > "$RCWRAPPER" << RCWRAPPER_EOF
#!/bin/sh
exec x86_64-w64-mingw32-windres --preprocessor="$RCPPWRAPPER" "\$@"
RCWRAPPER_EOF
chmod +x "$RCWRAPPER"

# Write CMake toolchain file for projects that use CMake.
# set(MINGW TRUE) tells WoP (and others) to use their bundled Win64 SDL2 libs rather
# than falling through to pkg_check_modules, which would find the Linux system SDL2.
# CMAKE_RC_COMPILER is set here (not per-project) so cmake never sees a conflicting
# value between cache and command-line, preventing spurious re-configures.
TOOLCHAIN_FILE="$(pwd)/mingw-w64-toolchain.cmake"
cat > "$TOOLCHAIN_FILE" << TOOLCHAIN_EOF
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc-posix)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++-posix)
set(CMAKE_RC_COMPILER "$RCWRAPPER")
set(MINGW TRUE)
set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
TOOLCHAIN_EOF

cmd=(dialog --keep-tite --menu "Select a Port: [Windows x86_64 / MinGW-w64]" 22 76 16)

options=(1 "Dhewm3"
         2 "Eduke32"
         3 "Darkplaces"
         4 "Ioq3"
         5 "worldofpadman (1.7.0)"
         6 "Yamagi Quake II"
         7 "Exit")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
          [ -d dhewm3 ] && git -C dhewm3 pull || git clone https://github.com/dhewm/dhewm3.git
          cd dhewm3/
          rm -rf CMakeCache.txt CMakeFiles/
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" \
                -DSDL2_INCLUDE_DIR="$PREFIX/include/SDL2" \
                -DSDL2_LIBRARY="$PREFIX/lib/libSDL2.dll.a" \
                -DOPENAL_INCLUDE_DIR="$PREFIX/include/AL" \
                -DOPENAL_LIBRARY="$PREFIX/lib/libOpenAL32.dll.a" \
                ./neo/
          make -j$(nproc)
          cp -f "$PREFIX/bin/SDL2.dll" "$PREFIX/bin/OpenAL32.dll" .
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        2)
          [ -d eduke32 ] && git -C eduke32 pull || git clone https://voidpoint.io/terminx/eduke32.git
          cd eduke32/
          make -j$(nproc) PLATFORM=WINDOWS \
               CC=x86_64-w64-mingw32-gcc-posix \
               CXX=x86_64-w64-mingw32-g++-posix \
               CROSS="${MINGW}-" \
               USE_LIBVPX=0 OPTLEVEL=2 WITHOUT_GTK=1
          cp -f "$PREFIX/bin/SDL2.dll" "$PREFIX/bin/OpenAL32.dll" .
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        3)
          [ -d darkplaces ] && git -C darkplaces pull || git clone https://github.com/DarkPlacesEngine/darkplaces.git
          cd darkplaces/
          make -j$(nproc) sdl-release \
               DP_MAKE_TARGET=mingw \
               CC="${MINGW}-gcc-posix" \
               WINDRES="${MINGW}-windres" \
               SDL_CONFIG="${PREFIX}/bin/sdl2-config" \
               DP_LINK_JPEG=dlopen
          cp -f "$PREFIX/bin/SDL2.dll" .
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        4)
          [ -d ioq3 ] && git -C ioq3 pull || git clone https://github.com/ioquake/ioq3.git
          # Fix win_resource.rc for GNU windres:
          # 1. Remove DISCARDABLE (MS-only RC keyword windres rejects)
          # 2. Replace #ifdef WINDOWS_ICON_PATH block with a direct relative path;
          #    windres loses the surrounding quotes when forwarding -D flags to the
          #    preprocessor, so the macro expands to a bare unquoted path that the
          #    RC parser then rejects as a syntax error.
          python3 <<'PYEOF'
path = 'ioq3/code/sys/win_resource.rc'
rc = open(path).read()
rc = rc.replace(' DISCARDABLE', '')
old = '#ifdef WINDOWS_ICON_PATH\nIDI_ICON1               ICON        WINDOWS_ICON_PATH\n#else\nIDI_ICON1               ICON        "quake3.ico"\n#endif'
new = 'IDI_ICON1               ICON        "../../misc/windows/quake3.ico"'
rc = rc.replace(old, new)
open(path, 'w').write(rc)
PYEOF
          cd ioq3/
          rm -rf CMakeCache.txt CMakeFiles/
          cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" \
                -DBUILD_GAME_QVMS=OFF \
                .
          make -j$(nproc)
          cp -f "$PREFIX/bin/SDL2.dll" .
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        5)
          if [ ! -d worldofpadman-1.7.0 ]; then
            wget https://github.com/PadWorld-Entertainment/worldofpadman/archive/refs/tags/v1.7.0.zip
            unzip *.zip
            rm -rf ./*.zip
            # Patch out unconditional QVM/tools build: WoP has no cmake option for this
            # and the tools (lburg → dagcheck.c → q3rcc → q3lcc) can't run during
            # cross-compilation because they are built as Windows executables.
            sed -i 's/add_subdirectory(tools)/# add_subdirectory(tools)/' \
                worldofpadman-1.7.0/code/CMakeLists.txt
            sed -i 's/^add_qvm(/# add_qvm(/' \
                worldofpadman-1.7.0/code/cgame/CMakeLists.txt \
                worldofpadman-1.7.0/code/game/CMakeLists.txt \
                worldofpadman-1.7.0/code/ui/CMakeLists.txt
            # Patch: server and client must link ws2_32/winmm/psapi/gdi32/ole32 under MinGW
            # just as under MSVC; CMAKE_SYSTEM_NAME=Windows makes WIN32 true but not MSVC.
            # Without this, cross-compiled MinGW client falls into the else() branch and
            # tries to link Linux-only librt/libm, failing at link time.
            sed -i 's/^if (MSVC)$/if (MSVC OR MINGW)/' \
                worldofpadman-1.7.0/code/server/CMakeLists.txt \
                worldofpadman-1.7.0/code/client/CMakeLists.txt
            # Patch: wopded (dedicated server) has its own WinMain in sys_win32.c;
            # linking SDL2main would provide a second WinMain that expects SDL_main,
            # causing unresolved SDL_main + SDL_ShowSimpleMessageBox etc.
            sed -i 's/ SDL2::SDL2main//' \
                worldofpadman-1.7.0/code/server/CMakeLists.txt
            # Patch: v1.7.0 added bsptool/shadertool validation tests in wop/ and xmas/
            # which reference those targets via generator expressions. Since tools/ is
            # suppressed for cross-compilation those targets don't exist, so cmake
            # generate fails.  Suppress wop and xmas; we don't need to build pk3s.
            sed -i \
                -e 's/^add_subdirectory(wop)$/# add_subdirectory(wop)/' \
                -e 's/^add_subdirectory(xmas)$/# add_subdirectory(xmas)/' \
                worldofpadman-1.7.0/CMakeLists.txt
            # Patch: libcurl.a (schannel TLS) references ws2_32 and crypt32.
            # These must be declared as INTERFACE deps of the curl cmake target so
            # GNU ld's single-pass scan sees them AFTER the archive, not before it.
            python3 << 'PYEOF'
path = 'worldofpadman-1.7.0/libs/curl-7.54.0/CMakeLists.txt'
t = open(path).read()
old = ('if (NOT USE_CURL_DLOPEN OR MINGW)\n'
       '\tif (LIBS)\n'
       '\t\ttarget_link_libraries(curl INTERFACE ${LIBS})\n'
       '\tendif()\n'
       'else()')
new = ('if (NOT USE_CURL_DLOPEN OR MINGW)\n'
       '\tif (LIBS)\n'
       '\t\ttarget_link_libraries(curl INTERFACE ${LIBS})\n'
       '\tendif()\n'
       '\tif (MINGW)\n'
       '\t\t# libcurl.a (schannel TLS) references ws2_32 and crypt32 (CertFree*).\n'
       '\t\t# Declaring them as INTERFACE deps ensures GNU ld sees them AFTER the\n'
       '\t\t# static archive in its single-pass scan.\n'
       '\t\ttarget_link_libraries(curl INTERFACE ws2_32 crypt32)\n'
       '\tendif()\n'
       'else()')
t2 = t.replace(old, new, 1)
assert t2 != t, 'Patch (curl ws2_32/crypt32) not applied - no match in libs/curl-7.54.0/CMakeLists.txt'
open(path, 'w').write(t2)
PYEOF
            # Patch: pre-declare WinMain for GNU ld's single-pass archive scan so that
            # libSDL2main.a (which provides WinMain) is extracted before libmingw32.a
            # requests the symbol.  Without this flag the object is never pulled in and
            # the linker falls back to mingw32's stub, which lacks SDL_main redirection.
            python3 << 'PYEOF'
path = 'worldofpadman-1.7.0/code/CMakeLists.txt'
t = open(path).read()
old = ('\t\t\tif (MSVC)\n'
       '\t\t\t\tset_target_properties(${_EXE_TARGET} PROPERTIES LINK_FLAGS "/SUBSYSTEM:WINDOWS")\n'
       '\t\t\tendif()')
new = ('\t\t\tif (MSVC)\n'
       '\t\t\t\tset_target_properties(${_EXE_TARGET} PROPERTIES LINK_FLAGS "/SUBSYSTEM:WINDOWS")\n'
       '\t\t\telseif (MINGW)\n'
       '\t\t\t\t# GNU ld single-pass archive scan: pre-declare WinMain as needed so\n'
       '\t\t\t\t# it gets extracted from libSDL2main.a before libmingw32.a requests it\n'
       '\t\t\t\ttarget_link_options(${_EXE_TARGET} PRIVATE -Wl,-u,WinMain)\n'
       '\t\t\tendif()')
t2 = t.replace(old, new, 1)
assert t2 != t, 'Patch (WinMain) not applied - no match in code/CMakeLists.txt'
open(path, 'w').write(t2)
PYEOF
          fi
          cd worldofpadman-1.7.0/
          rm -rf build/
          # SDL2 (built from source in v1.7.0) forbids in-tree builds, so use -B build.
          cmake -S . -B build \
                -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" \
                -DBUILD_RENDERER_VULKAN=OFF \
                -DBUILD_RENDERER_OPENGL2=OFF \
                -DUSE_OPENAL_DLOPEN=OFF \
                "-DCMAKE_RC_FLAGS=--include-dir $(pwd)"
          cmake --build build -j$(nproc)
          # Download WoP 1.7.0 game data into the source root.
          # wop.x86_64.exe, cgame/ui/game DLLs, and renderer DLLs are all placed
          # in the SOURCE root (worldofpadman-1.7.0/) by WoP's CMakeLists output-
          # directory settings, so SDL2.dll and game data must live there too.
          # The source tree contains wop/*.pk3dir with raw source assets that
          # include paletted TGA files the renderer can't load.  The unified
          # release zip ships processed wop/*.pk3 files which take priority
          # over pk3dirs and contain the correct asset formats.
          if [ ! -f wop-1.7.0-unified.zip ]; then
            wget -O wop-1.7.0-unified.zip \
              https://github.com/PadWorld-Entertainment/worldofpadman/releases/download/v1.7.0/wop-1.7.0-unified.zip
          fi
          unzip -o wop-1.7.0-unified.zip 'wop/*' 'XTRAS/*'
          # Use the SDL2.dll built from source (in build/libs/SDL2/) alongside the exe.
          cp -f build/libs/SDL2/SDL2.dll .
          cp -f "$PREFIX/bin/OpenAL32.dll" .
          # renderer_opengl2 requires a host 'stringify' tool which can't be built
          # during cross-compilation, so we build opengl1 only.  Force the game to
          # load the opengl1 renderer by shipping autoexec.cfg in the wop/ dir.
          echo 'seta cl_renderer "opengl1"' > wop/autoexec.cfg
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        6)
          # Yamagi Quake II QUAKE2_8_30 - cross-compiled with Makefile (CMakeLists.txt
          # is officially unmaintained upstream).  The Makefile needs two small patches:
          #   1. Add WINDRES ?= windres variable so we can supply our windres wrapper.
          #   2. Replace the hardcoded `windres` call in the icon target with $(WINDRES).
          if [ ! -d yquake2-QUAKE2_8_30 ]; then
            wget -O QUAKE2_8_30.zip \
              https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_30.zip
            unzip QUAKE2_8_30.zip
            rm -rf QUAKE2_8_30.zip
            # Patch 1: add WINDRES ?= windres before CONFIG_FILE so we can pass our
            # cross windres wrapper on the make command line.
            sed -i 's/^CONFIG_FILE:=config.mk/# Cross-compilation: override with target windres binary\nWINDRES ?= windres\n\nCONFIG_FILE:=config.mk/' \
              yquake2-QUAKE2_8_30/Makefile
            # Patch 2: use $(WINDRES) instead of the hardcoded `windres` in the icon target.
            sed -i 's/\${Q}windres /\${Q}\$(WINDRES) /' \
              yquake2-QUAKE2_8_30/Makefile
          fi
          cd yquake2-QUAKE2_8_30/
          make cleanall
          make -j$(nproc) \
            CC=x86_64-w64-mingw32-gcc-posix \
            WINDRES="$RCWRAPPER" \
            YQ2_OSTYPE=Windows \
            YQ2_ARCH=x86_64 \
            INCLUDE="-I$PREFIX/include" \
            LDFLAGS="-L$PREFIX/lib" \
            SDLCFLAGS="-I$PREFIX/include/SDL2 -Dmain=SDL_main" \
            SDLLDFLAGS="-lmingw32 -lSDL2main -lSDL2 -mwindows"
          # Copy runtime DLLs alongside the executables in release/
          cp -f "$PREFIX/bin/SDL2.dll" "$PREFIX/bin/OpenAL32.dll" release/
          # NOTE: Game data (baseq2/pak0.pak ... pak8.pak) is NOT free and must be
          # supplied by the user from a retail Quake II purchase (GOG/Steam/CD).
          # Copy or symlink your baseq2/ data into the release/ directory before running.
          cd ..
          cd ..
          bash ./Debra-Ports-Windows.sh
            ;;
        7)
          exit
            ;;

    esac
done
