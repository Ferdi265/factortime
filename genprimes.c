#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <libgen.h>

void print_primes(int max) {
	for (int i = 2; i <= max; ++i) {
		bool isPrime = true;
		for (int j = 2; j <= i / 2; ++j) {
			if (i % j == 0) {
				isPrime = false;
				break;
			}
		}
		if (isPrime) {
			printf("%d\n", i);
		}
	}
}

int main(int argc, char** argv) {
	if (argc != 2) {
		fprintf(stderr, "%s: Invalid arguments\n", basename(argv[0]));
		return -1;
	}
	print_primes(atoi(argv[1]));
	return 0;
}
