NAME = libGLUES_CM
VERSION = 51
DEPENDS = libGLUES_CM tisgxgfx

SRC_SVN_REV = http://glues.googlecode.com/svn/trunk/glues

include ../../support/download.mk

CC = gcc

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-svn-r${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-svn-r${VERSION}.tar.gz
	cat ${NAME}-svn-r${VERSION}-demos-patch | patch -d build/src -p1
	touch $@

include ../../support/staging.mk

stage:: build/armv7.built

include ../../support/cross-compile.mk

build: stage

build/%.built: build/.unpacked
	rm -f $@
	( cd build/src/sdltests ; ${SB2} make )
	touch $@

clobber::
	rm -rf build

