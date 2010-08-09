CC = gcc $(CCFLAGS)
CCFLAGS = -std=c99 -pedantic -Wall $(CCOPTIMIZE) $(CCDEBUG)
CCOPTIMIZE = -O0
CCDEBUG =

.PHONY : all clean

all : bff tinybfi

bff : bff.c bff.h
	$(CC) -o bff bff.c

tinybfi : tinybfi.c
	$(CC) -o tinybfi tinybfi.c

clean :
	rm -f bff tinybfi bff.dSYM tinybfi.dSYM
