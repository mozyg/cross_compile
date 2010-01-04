NAME = libsdl
VERSION = 1.2

SRC_TGZ = http://palm.cdnetworks.net/opensource/1.3.5/${NAME}-${VERSION}.tgz

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	tar -C build -x -f $<
	mv build/${NAME}-${VERSION} build/src
	${MAKE} SRC_FILE=http://palm.cdnetworks.net/opensource/1.3.5/${NAME}-${VERSION}-patch.gz \
		LOCAL_FILE=${NAME}-${VERSION}-patch.gz download
	zcat ${DL_DIR}/${NAME}-${VERSION}-patch.gz | patch -d build/src -p1
	touch $@

include ../../support/staging.mk

include ../../support/stage-rootfs.mk

stage:: build/armv7.built

build/%.built: build/.unpacked
	rm -f $@
	( cd build/src ; sb2 -t $* ./configure )
	( cd build/src ; \
	  sb2 -t $* make prefix=/usr DESTDIR=/srv/preware/cross-compile/staging/$* install-hdrs )
	touch $@

clobber::
	rm -rf build