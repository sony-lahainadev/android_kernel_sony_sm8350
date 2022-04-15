#!/bin/bash

mkdir out

BUILD_CROSS_COMPILE=/home/cramfs28/android/los18/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CLANG_PATH=/home/cramfs28/android/los18/prebuilts/clang/host/linux-x86/clang-r383902/bin
CLANG_TRIPLE=aarch64-linux-gnu-

export ARCH=arm64
export PATH=${CLANG_PATH}:${PATH}

make -j64 -C $(pwd) O=$(pwd)/out CROSS_COMPILE=$BUILD_CROSS_COMPILE CLANG_TRIPLE=$CLANG_TRIPLE \
    CC=clang LD=ld.lld \
    pdx215_defconfig

make -j64 -C $(pwd) O=$(pwd)/out CROSS_COMPILE=$BUILD_CROSS_COMPILE CLANG_TRIPLE=$CLANG_TRIPLE \
    CC=clang LD=ld.lld \
    2>&1 | tee build.txt

cp out/arch/arm64/boot/Image $(pwd)/Image
