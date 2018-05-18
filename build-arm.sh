#!/bin/bash

CFLAGS="-O3 -std=gnu99 -march=native -mtune=native -mfloat-abi=hard -mfpu=neon" ./configure
make -j3

