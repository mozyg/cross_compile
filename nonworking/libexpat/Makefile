NAME = expat
VERSION = 2.0.1

SRC_TGZ = http://downloads.sourceforge.net/project/expat/${NAME}/${VERSION}/${NAME}-${VERSION}.tar.gz?use_mirror=cdnetworks-us-2

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	tar -C build -z -x -f $<
	mv build/${NAME}-${VERSION} build/src
	touch $@

include ../../support/staging.mk

stage:: build

include ../../support/cross-compile.mk

build: build/armv7.built

build/%.built: build/.unpacked
	rm -f $@
	( cd build/src ; ${SB2} \
	PKG_CONFIG_LIBDIR=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig \
	LDFLAGS="\"-L/usr/local/lib -Wl,-rpath-link,/usr/local/lib -Wl,-rpath,/usr/local/lib\" PATH=/usr/local/bin:${PATH}" \
	./configure \
		--prefix=${INSTALL_PREFIX} \
	)	
	( cd build/src ; ${SB2} make)
	( cd build/src ; ${SB2} make install)
	touch $@

clobber::
	rm -rf build
