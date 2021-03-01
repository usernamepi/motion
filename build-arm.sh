#!/bin/bash

sudo apt-get install autoconf automake build-essential pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev libmicrohttpd-dev autopoint

autoreconf -fiv

arch=`dpkg --print-architecture`
if [ "$ARCH" == "arm" ] || [ "$arch" == "armhf" ]
then
	CFLAGS="-O3 -std=gnu99 -march=native -mtune=native -mfloat-abi=hard -mfpu=neon" ./configure
	#CFLAGS="-O3 -std=gnu99 -march=armv7 -mtune=cortex-a9 -mfloat-abi=hard -mfpu=neon" ./configure
else
	CFLAGS="-O3 -std=gnu99 -march=native" ./configure
fi

make -j3

