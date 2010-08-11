CC = gcc $(CCFLAGS)
CCFLAGS = -std=c99 -pedantic -Wall $(CCOPTIMIZE) $(CCDEBUG)
CCOPTIMIZE = -O0
CCDEBUG = -g

.PHONY : all clean

all : bff tinybfi minibfi microbfi

bff : bff.c bff.h
	$(CC) -o bff bff.c

tinybfi : tinybfi.c
	$(CC) -o tinybfi tinybfi.c

minibfi : minibfi.c
	$(CC) -o minibfi minibfi.c

microbfi : microbfi.c
	$(CC) -o microbfi microbfi.c

clean :
	rm -rf bff bff.dSYM tinybfi tinybfi.dSYM minibfi minibfi.dSYM microbfi microbfi.dSYM
