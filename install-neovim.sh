#!/usr/bin/env bash

#Build and install neovim for Debian

#Save current dir
pushd .

#Install dependencies
sudo apt-get install libtool libtool-bin autoconf automake cmake libncurses5-dev g++ pkg-config unzip

#Get or update neovim github repo
mkdir -p ~/src
cd ~/src
if [ ! -e ~/src/neovim ]; then
  git clone https://github.com/neovim/neovim
else
  cd neovim
  git pull origin
fi

# Build and install neovim
cd ~/src/neovim
make install

#Restore dir
popd

echo nvim command: `which nvim`