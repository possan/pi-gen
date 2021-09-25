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

