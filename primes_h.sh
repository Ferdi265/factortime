#!/bin/bash

# generate primes
PRIMESMAX=1200
PRIMES=$(./genprimes $PRIMESMAX | tr '\n' ',' | sed 's/,/, /g' | sed 's/, $//')
PRIMESNUM=$(echo $PRIMES | wc -w)

# print primes.h
cat << EOF > primes.h
/* THIS FILE IS GENERATED - DO NOT EDIT */

#ifndef _PRIMES_H
#define _PRIMES_H

int primes_num = $PRIMESNUM;
int primes_max = $PRIMESMAX;
int primes[] = { $PRIMES };

#endif
EOF
