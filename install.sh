cd /home/fingarde

cp /etc/apt/sources.list /etc/apt/old_sources.list
sed 's/main/main contrib non-free/g' /etc/apt/old_sources.list > /etc/apt/sources.list

apt update && apt upgrade -y

apt install -y sudo
sudo adduser fingarde sudo

apt install -y xorg
X -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf

apt install dkms

git clone -b extended --single-branch https://github.com/lwfinger/rtlwifi_new.git 
cd rtlwifi_new

sudo dkms add ../rtlwifi_new
sudo dkms build rtlwifi-new/0.6 
sudo dkms install rtlwifi-new/0.6 --force
sudo modprobe -v rtl8723de ant_sel=2

/bin/sh -c 'echo "options rtl8723de ant_sel=2" >> /etc/modprobe.d/rtl8723de.conf'

cd ../
rm -r rtlwifi_new

apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
wget https://github.com/jaagr/polybar/releases/download/3.4.0/polybar-3.4.0.tar
tar xvf polybar-3.4.0.tar polybar/

cd polybar
mkdir build
cd build
cmake ../
make -j$(nproc)
sudo make install -B

cd ../../

apt install -y alsa-utils
adduser fingarde audio

apt install -y playerctl dunst compton i3  psmisc ksnapshot xinit rxvt rofi

cp -rf bin /home/fingarde
cp -rf .config /home/fingarde
cp -f .xinitrc /home/fingarde
cp -f .Xresources /home/fingarde
cp -ef .wall /home/fingarde

git clone https://github.com/ZulwiyozaPutra/SF-Mono-Font
cd SF-Mono-Font

cp *.otf /home/fingarde/.local/share/fonts/Apple/OpenType/'SF Mono'

cd ../
rm -r SF-Mono-Font
