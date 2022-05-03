#!/bin/bash

export CROSS_COMPILE=/home/akhilesh/personalprojects/m32/SM-M325F_SWA_RR_Opensource/Kernel/toolchain/aarch64-linux-android/bin/aarch64-linux-androidkernel-
export CC=/home/akhilesh/personalprojects/m32/SM-M325F_SWA_RR_Opensource/Kernel/toolchain/clang/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r
make distclean

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y a22x_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j8

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
