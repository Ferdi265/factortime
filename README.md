Factortime
==========

Factortime is a small c prgram in homage to [xkcd 247](https://xkcd.com/247) "Factoring the time".

Building
--------

Run `make` followed by `make install`.

Makefile supports DESTDIR, PREFIX, and CC variables.

Running
-------

When invoked without arguments, factortime factorizes the current time.

When invoked with an argument in the form of `%H:%M`, it factorizes that time.
