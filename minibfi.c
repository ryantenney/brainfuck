#include <stdio.h>

char *S[9999],
	  P[9999],
	  T[9999],
	**s = S,
	 *p = P,
	 *t = T,
	  x;

int main() {
	fread(p, 1, 9999, stdin);
	for (; *p; ++p) {
		if (*p == ']') {
			if (!x) {
				if (*t) {
					p = *(s - 1);
				} else {
					--s;
				}
			} else {
				--x;
			}
		} else if (!x) {
			if (*p == '[') {
					if (*t) {
						*(s++) = p;
					} else {
						++x;
					}
			}

			if (*p == '<') --t;
			if (*p == '>') ++t;
			if (*p == '+') ++*t;
			if (*p == '-') --*t;
			if (*p == ',') *t = getchar();
			if (*p == '.') putchar(*t);
		}
	}
}
