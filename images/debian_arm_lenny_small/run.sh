#!/bin/bash
#Script to start qemu arm with debian lenny qcow2 image

QEMU_ARM_BIN=/usr/bin/qemu-system-arm
DIR_PREFIX=.

$QEMU_ARM_BIN -M versatilepb -kernel $DIR_PREFIX/vmlinuz-2.6.26-1-versatile -initrd $DIR_PREFIX/initrd.img-2.6.26-1-versatile -hda $DIR_PREFIX/debian_lenny_armel_small.qcow2 -append "root=/dev/sda1 console=ttyAMA0" -nographic
