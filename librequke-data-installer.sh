#!/bin/sh

if [ "$(id -u)" = "0" ]; then
    echo "ERROR: Do not run Librequke-data-installer as root." >&2
    exit 1
fi

cd ..
mkdir .quakespasm
cd .quakespasm/
wget https://github.com/lavenderdotpet/LibreQuake/releases/download/v0.09-beta/full.zip
unzip ./full.zip
cd full/
mv ./id1 ..
cd ..
rm -rf ./full
rm -rf ./full.zip
cd ..
cd install-scripts/
