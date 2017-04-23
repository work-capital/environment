#!/bin/bash
# install dependencies
#
# Author: Henry Hazan <github.com/henry-hz> 2016
# run it as su [superuser]

# update
apt-get update
#apt-get install gnome-terminal -y
apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev git tmux ranger xbacklight zsh -y
apt-get install htop iftop iotop g++ gcc make libwxbase3.0-0 libwxgtk3.0-0 curl autossh sudo xfonts-terminus -y

# ERLANG
wget https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.3-1~ubuntu~xenial_amd64.deb
dpkg -i esl-erlang_19.3-1~ubuntu~xenial_amd64.deb

# ELIXIR
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install elixir -y

# NODEJS
cd ~
git clone https://github.com/nodejs/node
cd node
git checkout v6.2.2
make
make test
make install
node -v

# Lucky us: NPM is packaged with Node.js source so this is now installed too
# curl http://npmjs.org/install.sh | sudo sh
npm -v # it's alive!


# METEOR
curl https://install.meteor.com/ | sh

# NEOVIM

#Save current dir
pushd .

#Install dependencies
apt-get install libtool libtool-bin autoconf automake cmake libncurses5-dev g++ pkg-config unzip -y

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

# to run ctrl-p VIM plugin
apt-get install silversearcher-ag-el

#Restore dir
popd

echo nvim command: `which nvim`
