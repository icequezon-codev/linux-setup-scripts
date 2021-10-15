#!/bin/bash

BLUE='\033[0;34m'

##############################################
# Setup coding Environment
##############################################
# Python 3

echo "${BLUE}Installing Python 3.7..."

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.7

##############################################
# Telegram

echo "${BLUE}Installing Telegram..."

sudo apt-get install telegram-desktop

##############################################
# Skype

echo "${BLUE}Installing Skype..."

wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb

##############################################
# FZF

echo "${BLUE}Installing FZF..."

# Install fzf from config_file
pushd `pwd`

cd config_files/.vim/plugged/fzf
./install

popd

##############################################
# Vim

echo "${BLUE}Setting up Vim..."

pushd `pwd`

cp config_files/.vimrc ~
cp -R config_files/.vim ~

popd

##############################################
# Tmux

echo "${BLUE}Installing up Tmux..."

sudo apt-get install tmux
pushd `pwd`

cp config_files/.tmux.conf ~
cp -R config_files/.tmux ~

popd

##############################################
# i3-gaps

echo "${BLUE}Installing up i3-gaps..."

# Install i3-gaps dependencies
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake

# Setup i3-gaps
pushd `pwd`

mkdir tmp
cd tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

popd

##############################################
# Install URXVT Terminal

echo "${BLUE}Installing up URXVT Terminal..."

sudo apt-get install rxvt-unicode

# Configure ubuntu to use urxvt as default terminal
echo "2" | sudo update-alternatives --config x-terminal-emulator

# Copy URXVT settings
cp config_files/.Xresources ~

##############################################
# Clone union-ledger
##############################################

pushd `pwd`

cd ..
cat "SECRETS" | git clone https://github.com/UNIONProtocolFoundation/union-ledger.git

popd

##############################################
# Install union-ledger dependencies
##############################################
# Install build dependencies
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo add-apt-repository ppa:mhier/libboost-latest
sudo apt-get update
sudo apt-get install libdb4.8-dev
sudo apt-get install libdb4.8++-dev
sudo apt-get install qt5-default
sudo apt-get install libevent-dev
sudo apt-get install miniupnpc
sudo apt-get install libzmq3-dev
sudo apt-get install libunivalue-dev
sudo apt-get install libqrencode-dev
sudo apt-get install libboost1.70
sudo apt-get install libboost1.70-dev

# Install functional-test dependencies
sudo apt-get install python3-zmq

# Install functional-test dependencies
sudo rm /usr/bin/shellcheck
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/v0.7.1/shellcheck-v0.7.1.linux.x86_64.tar.xz" | tar -xJv
sudo cp "shellcheck-v0.7.1/shellcheck" /usr/bin/
shellcheck --version
pip3 install flake8==3.8.3
pip3 install mypy==0.781
pip3 install yq
pip3 install codespell==1.17.1
