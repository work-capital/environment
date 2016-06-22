#!/bin/bash
# install dependencies
#
# Author: Henry Hazan <github.com/henry-hz> 2016

# update 
apt-get update
apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev git tmux htop iftop iotop g++ gcc make zsh -y

# ERLANG
wget https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.0-1~debian~jessie_amd64.deb
dpkg -i esl-erlang_19.0-1~debian~jessie_amd64.deb

# NEOVIM
cd ~
wget http://http.us.debian.org/debian/pool/main/n/neovim/neovim_0.1.3-1_amd64.deb
dpkg -i neovim_0.1.3-1_amd64.deb
rm dpkg -i neovim_0.1.3-1_amd64.deb

# NODEJS
cd ~
git clone https://github.com/nodejs/node
cd node
git checkout v6.2.2
make
make test
sudo make install
node -v

# Lucky us: NPM is packaged with Node.js source so this is now installed too
# curl http://npmjs.org/install.sh | sudo sh
npm -v # it's alive!


# METEOR
curl https://install.meteor.com/ | sh 


