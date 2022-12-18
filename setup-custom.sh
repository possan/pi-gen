#!/bin/bash -e

cat > config <<EOL      
IMG_NAME=Dmxian5
ENABLE_SSH=1
FIRST_USER_NAME=light
FIRST_USER_PASS=light
EOL

touch stage3/SKIP stage4/SKIP stage5/SKIP 
touch stage4/SKIP_IMAGES stage5/SKIP_IMAGES

pushd stage2

if [ -f "EXPORT_NOOBS" ]; then mv EXPORT_NOOBS zzzEXPORT_NOOBS; fi



if [ -d "04-dmx" ]; then rm -rf "04-dmx"; fi

mkdir "04-dmx"
pushd "04-dmx"

cat > 00-run-chroot.sh <<EOL
echo "Update package lists"
apt-get update
EOL

chmod +x 00-run-chroot.sh

cat > 01-packages <<EOL
git
cmake
gstreamer1.0-dev
gstreamer1.0-libav
gstreamer1.0-plugins-good
gstreamer-plugins-base1.0-dev
wiringpi
jq
libpng-dev
ninja-build
EOL

popd


if [ -d "05-dmx" ]; then rm -rf "05-dmx"; fi

mkdir "05-dmx"
pushd "05-dmx"

cat > 00-run-chroot.sh <<EOL
echo "Get dmx code"

git clone https://github.com/possan/dmx-playback
pushd dmx-playback/apps
mkdir build 
pushd build

echo "Build dmx stuffs"
cmake -GNinja -DGPIO=ON -DRECORDER=OFF ..
ninja

echo "Install dmx stuffs"

popd
popd

EOL

chmod +x 00-run-chroot.sh

popd

popd

# ./build.sh
