#!/usr/bin/env bash
set -e

export TMPDIR=/tmp
export HOME=/root

apt-get update

# install Libuv
apt-get -y install make automake libtool
curl -sSL https://github.com/libuv/libuv/archive/v1.8.0.tar.gz \
  | tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.8.0
sh autogen.sh
./configure
make
make install
rm -rf /usr/local/src/libuv-1.8.0
cd ~/ && ldconfig

# clean up
apt-get autoclean && apt-get autoremove -y && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
