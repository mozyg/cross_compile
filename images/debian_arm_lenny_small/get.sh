#!/bin/bash
#Script to get debian lenny qcow2 image for qemu

WGET_BIN=/usr/bin/wget

$WGET_BIN http://people.debian.org/~aurel32/qemu/armel/debian_lenny_armel_small.qcow2 http://people.debian.org/~aurel32/qemu/armel/initrd.img-2.6.26-1-versatile http://people.debian.org/~aurel32/qemu/armel/vmlinuz-2.6.26-1-versatile
