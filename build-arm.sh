#!/bin/bash

sudo apt-get install autoconf automake build-essential pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev libmicrohttpd-dev

autoreconf -fiv
CFLAGS="-O3 -std=gnu99 -march=native -mtune=native -mfloat-abi=hard -mfpu=neon" ./configure
make -j3

