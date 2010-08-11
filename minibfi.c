#include <stdio.h>

char *S[9999],
      P[9999],
      T[9999],
    **s=S,
     *p=P,
     *t=T,
      c,x;

int main() {
	fread(p,1,9999,stdin);

	for(; (c=*p); ++p) {
		if (c == 93) {
			if (!x) {
				if (*t) {
					p = *(s-1);
				} else {
					--s;
				}
			} else {
				--x;
			}
		} else if (!x) {
			if (c == 91) {
				if (*t) {
					*(s++) = p;
				} else {
					++x;
				}
			}

			if (c == 60) t--;
			if (c == 62) t++;
			if (c == 43) ++*t;
			if (c == 45) --*t;
			if (c == 44) *t = getc(stdin);
			if (c == 46) putc(*t,stdout);
		}
	}
}
