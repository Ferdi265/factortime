Factortime
==========

Factortime is a small c prgram in homage to [xkcd 247](https://xkcd.com/247) "Factoring the time".

Building
--------

Just run `./build.sh`. It invokes `gcc` or the compiler under `$CC` if given, as well as a script to generate the `primes.h` header.

Running
-------

When invoked without arguments, factortime factorizes the current time.

When invoked with an argument in the form of `%H:%M`, it factorizes that time.
