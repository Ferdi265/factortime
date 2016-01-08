#!/bin/bash
CC=${CC-gcc}

genprimes() {
	echo Building target genprimes
	$CC -o genprimes genprimes.c
	echo Finished building genprimes
}

primes_h() {
	echo Building target primes_h
	genprimes
	
	./primes_h.sh
	echo Finished building primes_h
}

factortime() {
	echo Building target factortime
	primes_h
	
	$CC -o factortime factortime.c
	echo Finsihed building factortime
}

all() {
	echo Building all targets
	factortime
	echo Finished building all targets
}

clean() {
	echo Cleaning up
	rm genprimes
	rm primes.h
	rm factortime
	echo Finished cleaning up
}

case $1 in
	'') all;;
	all) all;;
	factortime) factortime;;
	primes_h) primes_h;;
	genprimes) genprimes;;
	clean) clean;;
	*) echo 'No such target:' $1; exit 1;;
esac
