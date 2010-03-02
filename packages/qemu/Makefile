NAME = qemu
VERSION = stable
DEPENDS = zlib ncurses
SRC_GIT = git@wdtz.org:/qemu.git

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/qemu
	tar -C build/qemu -z -x -f $<
	touch $@

include ../../support/staging.mk

#include ../../support/stage-rootfs.mk

stage:: build/armv7.built
#stage::

include ../../support/cross-compile.mk

build/%.built: build/.unpacked
	rm -f $@
	( cd build/qemu ; ${SB2} ./build.sh )	
	touch $@

clobber::
	rm -rf build
