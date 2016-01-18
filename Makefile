CC=gcc
DESTDIR=/
PREFIX=/usr

all: factortime

genprimes:
	$(CC) -o genprimes genprimes.c

primes_h: genprimes
	./primes_h.sh

factortime: primes_h
	$(CC) -o factortime factortime.c

install:
	mkdir -p $(DESTDIR)/$(PREFIX)/bin/
	install -s factortime $(DESTDIR)/$(PREFIX)/bin/

clean:
	rm primes.h genprimes factortime
