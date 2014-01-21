SHELL = /bin/sh
ARCH = $(shell arch)
PROGRAM = $(shell pwd)
CC = gcc
EXECS = xor
LARGE_FILE_FLAGS = -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64


ifeq ($(ARCH),i686)
	CFLAGS = -m32 -lm -O2 -I ./include -D_REENTRANT $(LARGE_FILE_FLAGS)
	LDFLAGS = -m32
else
	CFLAGS = -lm -O2 -I ./include -D_REENTRANT $(LARGE_FILE_FLAGS)
	LDFLAGS =
endif

all:
	echo ""

install:
	$(CC) $(PROGRAM)/debian/source/xor.c -o xor $(CFLAGS) $(LDFLAGS) $^
	@mkdir -p $(DESTDIR)/usr/bin
	@cp xor $(DESTDIR)/usr/bin
	

uninstall:
	@rm -rf $(DESTDIR)/usr/bin/xor
	
reinstall: uninstall install

clean:
	/bin/rm -f *.o *~ ./$(EXECS)*
	

	

	




