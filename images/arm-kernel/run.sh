#!/bin/bash
#Script to start qemu arm with a test kernel image

QEMU_ARM_BIN=/usr/bin/qemu-system-arm

$QEMU_ARM_BIN -kernel zImage.integrator -initrd arm_root.img -append "root=/dev/sda1 console=ttyAMA0" -nographic
