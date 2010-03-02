#!/bin/bash
#Script to start minimallinux with i386 qemu
#http://minimalinux.org/ttylinux

QEMU_BIN=/usr/bin/qemu
DIR_PREFIX=.

$QEMU_BIN -cdrom ./bootcd-i486-9.1.iso -boot d
