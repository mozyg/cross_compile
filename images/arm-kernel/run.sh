#!/bin/bash
#Script to start qemu arm with a test kernel image

QEMU_ARM_BIN=/usr/bin/qemu-system-arm
DIR_PREFIX=.

$QEMU_ARM_BIN -kernel $DIR_PREFIX/zImage.integrator -initrd $DIR_PREFIX/arm_root.img -append "root=/dev/sda1 console=ttyAMA0" -nographic
