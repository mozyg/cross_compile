NAME = zlib
VERSION = 1.2.3

SRC_BZ2 = http://palm.cdnetworks.net/opensource/1.3.5/${NAME}-${VERSION}.tar.bz2

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build
	tar -C build -j -x -f $<
	mv build/${NAME}-${VERSION} build/src
	${MAKE} SRC_FILE=http://palm.cdnetworks.net/opensource/1.3.5/${NAME}-${VERSION}-patches.tgz \
		LOCAL_FILE=${NAME}-${VERSION}-patches.tgz download
	tar -x -f ${DL_DIR}/${NAME}-${VERSION}-patches.tgz -O \
		zlib-patches/visibility.patch zlib-patches/autotools.patch | patch -d build/src -p1
	touch $@

include ../../support/staging.mk

include ../../support/stage-rootfs.mk

stage:: build/armv7.built

#The 'CC=arm-none-linux-gnueabi-gcc' part of the make invocation below should NOT be required.
#I'm not sure why it is, even CC=gcc doesn't work (despite 'gcc' from within sb2 being properly
#mapped to arm-none-linux-gnueabi-gcc.  Leaving alone for now, but NOTE this isn't ideal/clean
build/%.built: build/.unpacked
	rm -f $@
	install -d ${STAGING_DIR}/usr/include
	install -m 644 build/src/zlib.h ${STAGING_DIR}/usr/include/
	install -m 644 build/src/zconf.h ${STAGING_DIR}/usr/include/
	( cd build/src ; ${SB2} make CC=arm-none-linux-gnueabi-gcc)
	install -m 755 build/src/libz.a ${STAGING_DIR}/usr/lib/
	touch $@

clobber::
	rm -f ${STAGING_DIR}/usr/include/zlib.h
	rm -f ${STAGING_DIR}/usr/include/zconf.h
	rm -rf build
