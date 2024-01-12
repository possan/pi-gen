echo "Update package lists"
apt-get update
ls -la 
wget https://github.com/WiringPi/WiringPi/releases/download/2.61-1/wiringpi-2.61-1-arm64.deb
dpkg -i wiringpi-2.61-1-arm64.deb
