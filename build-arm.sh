#!/bin/bash

echo "Install motion compile dependencies"
sudo apt-get -y install autoconf automake build-essential pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev libmicrohttpd-dev autopoint

echo "autoreconf -fiv"
autoreconf -fiv

arch=`dpkg --print-architecture`
if [ "$ARCH" == "arm" ] || [ "$arch" == "armhf" ]
then
	echo "Arch: $ARCH"
	CFLAGS="-O3 -std=gnu99 -march=native -mtune=native -mfloat-abi=hard -mfpu=neon" ./configure
	#CFLAGS="-O3 -std=gnu99 -march=armv7 -mtune=cortex-a9 -mfloat-abi=hard -mfpu=neon" ./configure
else
	echo "Arch: $ARCH"
	CFLAGS="-O3 -std=gnu99 -march=native" ./configure
fi

make -j3

