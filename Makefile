CC = gcc $(CCFLAGS)
CCFLAGS = -std=c99 -pedantic -Wall $(CCOPTIMIZE) $(CCDEBUG)
CCOPTIMIZE = -O0
CCDEBUG =

CC_APATHETIC = gcc -std=c99 $(CCOPTIMIZE) $(CCDEBUG)

PROGRAMS = bff tinybfi minibfi microbfi



bff : bff.c bff.h
	$(CC) -o bff bff.c

tinybfi : tinybfi.c
	$(CC) -o tinybfi tinybfi.c

minibfi : minibfi.c
	$(CC) -o minibfi minibfi.c

microbfi.c : microbfi_formatted.c
	cat microbfi_formatted.c | tr -d '\n\t ' > microbfi.c

microbfi : microbfi.c
	$(CC_APATHETIC) -o microbfi microbfi.c



.PHONY : all clean rebuild

all : $(PROGRAMS)

clean :
	rm -rf bff bff.dSYM tinybfi tinybfi.dSYM minibfi minibfi.dSYM microbfi microbfi.dSYM

rebuild : clean all
