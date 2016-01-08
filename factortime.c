#define _XOPEN_SOURCE
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <libgen.h>
#include <time.h>
#include "primes.h"

int print_factortime(struct tm* tm, char* argv0) {
	int num = (*tm).tm_hour * 100 + (*tm).tm_min;
	bool first = true;
	if (primes_max < num / 2) {
		fprintf(stderr, "%s: Insufficient amount of primes in prime.h\n", basename(argv0));
		return -3;
	}
	for (int i = 0; i < primes_num;) {
		if (num <= 1) break;
		if (num % primes[i] == 0) {
			printf("%s%d", first ? "" : " * ", primes[i]);
			first = false;
			num = num / primes[i];
		} else {
			++i;
		}
	}
	if (first) {
		printf("%d", num);
	}
	printf("\n");
	return 0;
}

int main(int argc, char** argv) {
	time_t t = time(NULL);
	struct tm* tm = localtime(&t);
	if (argc > 2) {
		fprintf(stderr, "%s: Invalid arguments\n", basename(argv[0]));
		return -1;
	} else if (argc == 2) {
		strptime(argv[1], "%H:%M", tm);
	}
	return print_factortime(tm, argv[0]);
}
